local FileUtils = {}

function FileUtils.getNameWithoutExtension(name)
    return fs.getName(name):match("(.+)%..+")
end

return FileUtils