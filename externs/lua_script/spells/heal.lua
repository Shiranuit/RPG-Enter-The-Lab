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
    print("ok")
    player:heal(50)
    player:removeMana(10)
end
