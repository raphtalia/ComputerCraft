local State = {
    Text = ""
}

local UserInputService = require("UserInputService")
local CommandService = require("CommandService")
local TermUtils = require("TermUtils")

TermUtils.clear()

local function autofill(text)
    State.Text = text
    return CommandService.autofillCommand(text)
end

UserInputService.Char:Connect(function(char)
    State.Text = State.Text.. char
end)

UserInputService.InputBegan:Connect(function(input)
    local keyName = input.Name
    if keyName == "tab" then
        local autofillResult = autofill(State.Text)
        if #autofillResult > 0 then
            State.Text = State.Text.. autofillResult[1]
        end
    elseif keyName == "enter" then
        if State.Text ~= "" then
            CommandService.runCommand(State.Text)
            State.Text = ""
        end
    end
end)

UserInputService.InputContinue:Connect(function(input)
    if input.Name == "backspace" then
        State.Text = State.Text:sub(1, #State.Text - 1)
    end
end)

return function()
    TermUtils.clearLine()
    input(nil, nil, autofill, State.Text)
end