local luaMath = math

local function __index(self, i)
    local v = rawget(self, i)
    if v then
        return v
    else
        return luaMath[i]
    end
end

local function __newindex()
    error("[Locked metatable] Attempt to edit environment table")
end

local math = {}

function math.round(x, y)

end

return setmetatable(
    math,
    {
        __index = __index,
        __newindex = __newindex,
        __metatable = "[Locked Metatable] Environment Table"
    }
)