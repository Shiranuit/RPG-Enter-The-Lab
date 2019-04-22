function getName(self)
    return "healSpell"
end

function getMaxCooldown(self)
    return 5
end

function cooldownStartAtEnd()
    return true
end

function cast(self)
    player:heal(50)
    player:removeMana(10)
end

function getCost(self)
    return 10
end