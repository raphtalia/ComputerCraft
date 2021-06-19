local CLASSES_PATH = script.Directory.. "/../Classes"

local Classes = {}

local Instance = {}

function Instance.new(className, ...)
    local class = Classes[className]
    if type(class) == "string" then
        Classes[className] = require(class)
        class = Classes[className]
    end
    return class.new(...)
end

for _,className in ipairs(fs.list(CLASSES_PATH)) do
    Classes[className:match("(.+)%..+")] = CLASSES_PATH.. "/".. className
end

return Instance