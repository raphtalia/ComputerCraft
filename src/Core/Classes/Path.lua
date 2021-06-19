local Path = {}
function Path:__index(i)
    if i == "Parent" then
        return Path.new(fs.getDir(self.Path))
    else
        for _,child in ipairs(fs.list(self.Path)) do
            if i == child then
                return Path.new(self.Path.. "/".. child)
            end
        end
    end

    return rawget(Path, i)
end

function Path.new(path)
    local pathObj = {
        Name = fs.getName(path),
        Path = path,
    }

    return setmetatable(pathObj, Path)
end

function Path:IsFile()
    return not fs.isDir(self.Path)
end

function Path:IsDir()
    return fs.isDir(self.Path)
end

function Path:GetChildren()
    local paths = {}

    for _,child in ipairs(fs.list(self.Path)) do
        table.insert(paths, Path.new(self.Path.. "/".. child))
    end

    return paths
end

return Path