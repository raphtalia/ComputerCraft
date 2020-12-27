local RunService = {}

function RunService:IsTurtle()
    local platform = system:GetPlatform()
    if platform == "Turtle" or platform == "AdvancedTurtle" then
        return true
    end
    return false
end

function RunService:IsComputer()
    local platform = system:GetPlatform()
    if platform == "Computer" or platform == "AdvancedComputer" then
        return true
    end
    return false
end

function RunService:IsAdvanced()
    local platform = system:GetPlatform()
    if platform == "AdvancedTurtle" or platform == "AdvancedComputer" then
        return true
    end
    return false
end

return RunService