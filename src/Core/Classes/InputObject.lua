local InputObject = {}
InputObject.__index = InputObject

function InputObject.new(keyCode)
    local inputObject = {
        KeyCode = keyCode,
        Name = keys.getName(keyCode),
    }

    return inputObject
end

return InputObject