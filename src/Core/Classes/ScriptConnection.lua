local ScriptConnection = {}
ScriptConnection.__index = ScriptConnection

function ScriptConnection.new(handler)
    local connection = {
        _handler = handler,
        Connected = true
    }

    return setmetatable(connection, ScriptConnection)
end

function ScriptConnection:Disconnect()
    self._handler = nil
    self.Connected = false
end

function ScriptConnection:Fire(...)
    self._handler(...)
end

return ScriptConnection