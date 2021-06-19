local TermUtils = {}

function TermUtils.clear()
    term.clear()
    term.setCursorPos(1, 1)
end

return TermUtils