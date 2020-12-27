local luaTable = table

local function __index(self, i)
    local v = rawget(self, i)
    if v then
        return v
    else
        return luaTable[i]
    end
end

local function __newindex()
    error("[Locked metatable] Attempt to edit environment table")
end

local table = {}

function table.getKeys(tab)
    local output = {}
    for i in pairs(tab) do
        table.insert(output, i)
    end
    return output
end

function table.getValues(tab)
    local output = {}
    for _,v in pairs(tab) do
        table.insert(output, v)
    end
    return output
end

return setmetatable(
    table,
    {
        __index = __index,
        __newindex = __newindex,
        __metatable = "[Locked Metatable] Environment Table"
    }
)