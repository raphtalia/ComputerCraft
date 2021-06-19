return {
    Help = "",
    Flags = {},
    Handle = function(command)
        local subCommand = command.Arguments[1]

        if subCommand == "list" then

        elseif subCommand == "create" then

        elseif subCommand == "remove" then

        elseif subCommand == "get" then
            local fleetName = command.Arguments[2]
        end
    end
}