local system = {}

function system:GetService(serviceName)
    
end

function system:GetPlatform()
    if turtle then
        if paint then
            return "AdvancedTurtle"
        else
            return "Turtle"
        end
    else
        if paint then
            return "AdvancedComputer"
        else
            return "Computer"
        end
    end
end

return system