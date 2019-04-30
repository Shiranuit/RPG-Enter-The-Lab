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
    if animationSpell["rayonSpell"].hasEnded() then
        animationSpell["rayonSpell"].restart()
        animationSpell["rayonSpell"].setTextureRect({0, 114, 19, 114})
    end
end

function isInstant(self)
    return false
end

function enable(self)
    world.spawnEntity(animationSpell["rayonSpell"])
    player.activateSpell()
    animationSpell["rayonSpell"].setTextureRect({0, 0, 19, 114})
    animationSpell["rayonSpell"].restart()
end

function disable(self)
    world.removeEntityByUUID(animationSpell["rayonSpell"].getUUID())
    player.desactivateSpell()
end

function getCost(self)
    return 1
end
