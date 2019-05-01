local is_idle = false

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
    if animationSpell["rayonSpell"].hasEnded() and not is_idle then
        world.removeEntityByUUID(animationSpell["rayonSpell"].getUUID())
        world.spawnEntity(animationSpell["rayonIdleAnimation"])
        animationSpell["rayonIdleAnimation"].restart()
        is_idle = true
    end
    player.removeMana(getCost())
    if player.getMana() == 0 then
        self:disable()
    end
end

function isInstant(self)
    return false
end

function enable(self)
    local status, hor, ver = player.getStatus()

    if (hor == "right") then
        animationSpell["rayonSpell"].setRotation(-90)
        animationSpell["rayonIdleAnimation"].setRotation(-90)
        animationSpell["rayonEndAnimation"].setRotation(-90)
    end
    if (hor == "left") then
        animationSpell["rayonSpell"].setRotation(90)
        animationSpell["rayonIdleAnimation"].setRotation(90)
        animationSpell["rayonEndAnimation"].setRotation(90)
    end
    if (ver == "down") then
        animationSpell["rayonSpell"].setRotation(0)
        animationSpell["rayonIdleAnimation"].setRotation(0)
        animationSpell["rayonEndAnimation"].setRotation(0)
    end
    if (ver == "up") then
        animationSpell["rayonSpell"].setRotation(180)
        animationSpell["rayonIdleAnimation"].setRotation(180)
        animationSpell["rayonEndAnimation"].setRotation(180)
    end
    world.spawnEntity(animationSpell["rayonSpell"])
    player.activateSpell()
    is_idle = false
    animationSpell["rayonSpell"].restart()

end

function disable(self)
    world.removeEntityByUUID(animationSpell["rayonIdleAnimation"].getUUID())
    if not is_idle then
        world.removeEntityByUUID(animationSpell["rayonSpell"].getUUID())
    end
    world.spawnEntity(animationSpell["rayonEndAnimation"])
    animationSpell["rayonEndAnimation"].restart()
end

function getCost(self)
    return 0.2
end
