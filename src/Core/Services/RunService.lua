local RunService = {}

function RunService:IsTurtle()
    if turtle then
        return true
    else
        return false
    end
end

function RunService:IsPocket()
    if pocket then
        return true
    else
        return false
    end
end

function RunService:IsComputer()
    if not RunService:IsTurtle() and not RunService:IsPocket() then
        return true
    else
        return false
    end
end

function RunService:IsAdvanced()
    if term.isColor() then
        return true
    else
        return false
    end
end

return RunService