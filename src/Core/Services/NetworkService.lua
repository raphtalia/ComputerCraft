local Ports = {}

local NetworkService = {}

function NetworkService.getModemsWithPortOpen(channel)
    return peripheral.find("modem", function(_,modem)
        return modem.isOpen(channel)
    end)
end

function NetworkService.getWirelessModems()
    return peripheral.find("modem", function(_,modem)
        return modem.isWireless()
    end)
end

function NetworkService.getWiredModems()
    return peripheral.find("modem", function(_,modem)
        return not modem.isWireless()
    end)
end

function NetworkService.closeAll()
    for _,modem in ipairs(peripheral.find("modem")) do
        modem.closeAll()
    end
end

function NetworkService.send(packet, modem)
    modem.transmit(Packet.port, Packet.port, textutils.serializeJSON(
        {
            Id = packet.Id,
            SendTime = packet.SendTime,
            Source = packet.Source,
            Destination = packet.Destination,
            Protocol = packet.Protocol,
            Message = packet.Message,
        }
    ))
end

function NetworkService.parse(message)
    return Instance.new("Packet", textutils.unserializeJSON(message))
end

function NetworkService.getPortsOpen()
    
end

function NetworkService.registerService(port, protocol, handler)
    Ports[port] = {
        Protocol = protocol,
        Handler = handler,
    }
end

return NetworkService