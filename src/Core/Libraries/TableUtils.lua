local TableUtils = {}

function TableUtils.removeVoids(tab)
    table.sort(tab, function(a)
        return a ~= nil and true or false
    end)
    return tab
end

return TableUtils