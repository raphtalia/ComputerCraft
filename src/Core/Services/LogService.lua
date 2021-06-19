local function concat(...)
    local args = {...}

    for i,v in pairs(args) do
        args[i] = tostring(v)
    end

    return table.concat(args)
end

local LogService = {}

function LogService.print(...)
    os.queueEvent("LogServiceOutput", "print", concat(...))
end

function LogService.warn(...)
    os.queueEvent("LogServiceOutput", "warn", concat(...))
end

function LogService.error(...)
    os.queueEvent("LogServiceOutput", "error", concat(...))
end

function LogService.info(...)
    os.queueEvent("LogServiceOutput", "info", concat(...))
end

return LogService