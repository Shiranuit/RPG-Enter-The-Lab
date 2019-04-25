function getName(self)
    return "rayonSpell"
end

function getMaxCooldown(self)
    return 0
end

function cooldownStartAtEnd()
    return true
end

function cast(self)
    player.removeMana(1)
    player.activateSpell()
end
