local NetworkService = require("NetworkService")

local IP = os.getComputerID()

local Connection = {}
Connection.__index = Connection

function Connection.new(target, port, protocol)
    local connection = {
        Source = IP,
        Destination = target,
        Port = port,
        Protocol = protocol,
    }

    return setmetatable(connection, Connection)
end

function Connection:Send(message)
    return Instance.new(
        "Packet",
        {
            Port = self.Port,
            SendTime = os.time(),
            Source = self.Source,
            Destination = self.Destination,
            Protocol = self.Protocol,
            Message = message,
        }
    )
end

function Connection:Receive()
    
end

return Connection