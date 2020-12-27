-- Initialized with every module
local Environment = {}

-- Initalized on start
local Services = {}

-- Initalized on index
local Libraries = {}

local function runModule(path, envVars)
    local fileHandler = fs.open(path, "r")
    local source = fileHandler.readAll()

    fileHandler.close()

    local module = loadstring(source)
    local env = getfenv(module)

    if envVars then
        for i,v in pairs(envVars) do
            env[i] = v
        end
    end

    local output = module()
    if output then
        return output
    else
        error("Module did not return any values")
    end
end

local function isALuaFile(fileName)
    if fileName:sub(#fileName - 3) == ".lua" then
        return fileName:sub(1, #fileName - 4)
    else
        return false
    end
end

local Boot = {}

-- Register environment variables
for _,environmentModuleName in pairs(fs.list("system/Environment")) do
    local fileName = isALuaFile(environmentModuleName)
    if fileName then
        Environment[fileName] = runModule("system/Environment/".. environmentModuleName)
    end
end

-- Start services
for _,serviceModuleName in pairs(fs.list("system/Services")) do
    local fileName = isALuaFile(serviceModuleName)
    if fileName then
        Services[fileName] = runModule("system/Services/".. serviceModuleName, Environment)
    end
end

-- Store library names
for _,libraryModuleName in pairs(fs.list("system/Libraries")) do
    local fileName = isALuaFile(libraryModuleName)
    if fileName then
        -- Library modules are lazy loaded
        Libraries[fileName] = "system/Libraries/".. libraryModuleName
    end
end

-- Run startup files in parallel
for _,startupModuleName in pairs(fs.list("system/Startup")) do
    local fileName = isALuaFile(startupModuleName)
    if fileName then
        coroutine.wrap(function()
            runModule("system/Startup/".. startupModuleName, Environment)
        end)()
    end
end

runModule("system/Main.lua", Environment)

return Boot