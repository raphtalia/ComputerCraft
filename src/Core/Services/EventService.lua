local Events = {}

local EventService = {}

function EventService.getEvent(eventName)
    local event = Events[eventName] or Instance.new("Signal")
    Events[eventName] = event
    return event
end

return EventService