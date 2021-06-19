local CLASSES_PATH = script.Directory.. "/../Classes"

local Classes = {}

local Instance = {}

function Instance.new(className, ...)
    return Classes[className].new(...)
end

for _,className in ipairs(fs.list(CLASSES_PATH)) do
    Classes[className:match("(.+)%..+")] = require(CLASSES_PATH.. "/".. className)
end

return Instance