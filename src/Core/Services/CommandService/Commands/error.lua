return {
    Help = "",
    Flags = {},
    Handle = function(command)
        error(table.concat(command.Arguments))
    end
}