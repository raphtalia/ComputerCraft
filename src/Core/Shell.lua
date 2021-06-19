local CommandService = require("CommandService")
local TermUtils = require("TermUtils")

TermUtils.clear()

for i = 1, 5 do
    CommandService.runCommand(input(nil, nil, CommandService.autofillCommand))
end