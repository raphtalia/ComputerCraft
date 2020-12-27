local luaString = string

local function __index(self, i)
    local v = rawget(self, i)
    if v then
        return v
    else
        return luaString[i]
    end
end

local function __newindex()
    error("[Locked metatable] Attempt to edit environment table")
end

local string = {}

return setmetatable(
    string,
    {
        __index = __index,
        __newindex = __newindex,
        __metatable = "[Locked Metatable] Environment Table"
    }
)