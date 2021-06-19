local FileUtils = require("FileUtils")
local StringUtils = require("StringUtils")

local CommandService = {
    Commands = {}
}

function CommandService.autofillCommand(text)
    if #text > 0 then
        local autofillOptions = {}

        for i in pairs(CommandService.Commands) do
            if i:sub(1, #text) == text then
                table.insert(autofillOptions, i:sub(#text + 1))
            end
        end

        return autofillOptions
    else
        return nil
    end
end

function CommandService.runCommand(text)
    local arguments = StringUtils.split(text, " ")
    local command = arguments[1]
    arguments = {select(2, unpack(arguments))}

    if CommandService.Commands[command] then
        CommandService.Commands[command].Handle(arguments)
    else
        print("Invalid command: ".. (command or "nil"))
    end
end

function CommandService.registerCommand(commandName, handler)
    CommandService.Commands[commandName] = handler
end

--[[
for i,v in ipairs(fs.list(script.Directory)) do
    print(i,v)
end
]]

local path = Instance.new("Path", script.Directory)
for _,command in ipairs(path.Commands:GetChildren()) do
    CommandService.Commands[FileUtils.getNameWithoutExtension(command.Name)] = require(command.Path)
end

return CommandService