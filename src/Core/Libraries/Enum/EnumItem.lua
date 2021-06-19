local EnumItem = {}
function EnumItem:__tostring()
    return ("Enum.%s.%s"):format(tostring(self.Enum), self.Name)
end

function EnumItem:__index(i)
    local v = props[i]

    if v then
        return v
    else
        error(("%s is not a valid member of \"%s\""):format(i, tostring(enumItem)), 2)
    end
end

function EnumItem:__newindex(i)
    error(i.. " cannot be assigned to", 2)
end

function EnumItem.new(name, value, enum)
    local enumItem = setmetatable(
        {
            Name = name,
            Value = value,
            Enum = enum,
        },
        EnumItem
    )

    return enumItem
end

return EnumItem