function getName(self)
    return "shieldSpell"
end

function getMaxCooldown(self)
    return 5
end

function cooldownStartAtEnd()
    return true
end

function getCost()
    return 25
end

function cast(self)
    if animationSpell["shieldSpell"].hasEnded() then
        self:disable()
    end
end

function isInstant(self)
    return false
end

function enable(self)
    local x, y = player.getPosition()
    player.removeMana(getCost())
    player.activateSpell()
    animationSpell["shieldSpell"].restart()
    animationSpell["shieldSpell"].setPosition(x, y)
    world.spawnEntity(animationSpell["shieldSpell"])
end

function disable(self)
    world.removeEntityByUUID(animationSpell["shieldSpell"].getUUID())
    player.desactivateSpell()
end