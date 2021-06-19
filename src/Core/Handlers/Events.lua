local EventService = require("EventService")

EventService.getEvent("terminate"):Connect(function()
    error("[Exit] Terminating", 100)
end)

return function()
    local eventData = {os.pullEvent()}
    local eventName = eventData[1]
    EventService.getEvent(eventName):Fire(select(2, unpack(eventData)))
end