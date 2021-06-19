local newEnum = require(script.Directory.. "/EnumItem.lua").new

local Enums = {
    Enums = {}
}
local meta = {}

function meta:__tostring()
    return "Enums"
end

function meta:__index(enumName)
    return self.Enums[enumName]
end

function meta:__newindex(i)
    error(i.. " cannot be assigned to", 2)
end

function Enums.new(enumName, enumItemsList)
    -- If an enum with the same name is used it is overwritten
    local enum = newEnum(enumName, enumItemsList)
    Enums.Enums[enumName] = enum
    return enum
end

function Enums.fromValue(enumName, enumValue)
    for _,enumItem in ipairs(Enums.Enums[enumName]:GetEnumItems()) do
        if enumItem.Value == enumValue then
            return enumItem
        end
    end
end

return setmetatable(Enums, meta)