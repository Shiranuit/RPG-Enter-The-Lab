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
    local x, y = player.getPosition()
    animationSpell["shieldSpell"].setPosition(x, y + 1)
    if animationSpell["shieldSpell"].hasEnded() then
        self:disable()
    end
end

function isInstant(self)
    return false
end

function enable(self)
    player.removeMana(getCost())
    player.activateSpell()
    animationSpell["shieldSpell"].restart()
    world.spawnEntity(animationSpell["shieldSpell"])
    player.damageable(false)
end

function disable(self)
    world.removeEntityByUUID(animationSpell["shieldSpell"].getUUID())
    player.desactivateSpell()
    player.damageable(true)
end