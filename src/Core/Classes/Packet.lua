local NetworkService = require("NetworkService")
local UUID = require("UUID")

local Packet = {}
Packet.__index = Packet

function Packet.new(params)
    local packet = {
        -- Used to filter out duplicate packets
        Id = UUID.generate(),

        Port = params.Port,

        SendTime = params.SendTime,
        ReceiveTime = params.ReceiveTime,

        Source = params.Source,
        Destination = params.Destination,

        Protocol = params.Protocol,

        Message = params.Message,
    }

    return setmetatable(packet, Packet)
end

function Packet:Send()
    NetworkService.send(self)
end

function Packet:Reply(message)
    local source = self.Destination
    local destination = self.Source
    local packet = Packet.new(self)
    packet.Source = source
    packet.Destination = destination
    packet.Message = message
    NetworkService.send(self)
end

function Packet:GetLatency()
    return self.ReceiveTime - self.SendTime
end

return Packet