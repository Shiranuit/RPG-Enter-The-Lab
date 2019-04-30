function getName(self)
    return "rayonSpell"
end

function getMaxCooldown(self)
    return 0
end

function cooldownStartAtEnd()
    return false
end

function cast(self)
    player.removeMana(1)
end

function isInstant(self)
    return false
end

function enable(self)
    world.spawnEntity(animationSpell["rayonSpell"])
    player.activateSpell()
    animationSpell["rayonSpell"].restart()
end

function disable(self)
    world.removeEntityByUUID(animationSpell["rayonSpell"].getUUID())
    player.desactivateSpell()
end

function getCost(self)
    return 1
end
