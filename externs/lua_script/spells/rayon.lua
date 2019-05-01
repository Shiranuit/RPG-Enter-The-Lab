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
    if player.getMana() <= 0 then
        self:disable()
        return
    end
    if animationSpell["rayonSpell"].hasEnded() and not is_idle then
        world.removeEntityByUUID(animationSpell["rayonSpell"].getUUID())
        world.spawnEntity(animationSpell["rayonIdleAnimation"])
        animationSpell["rayonIdleAnimation"].restart()
        is_idle = true
    end
    local status, hor, ver, idle = player.getStatus()
    local x_player, y_player = player.getPosition()
    local size = 250
    local big = 70
    local w, h = 0

    if (hor == "left") then
        w = -size * 1.5
        h = -big
        x_player = x_player - big / 2
    elseif (hor == "right") then
        w = size * 1.5
        h = -big
        x_player = x_player + big / 2
    elseif (ver == "up" or (status == "idle" and idle == "up")) then
        w = big
        h = -size
        x_player = x_player - big / 2
        y_player = y_player - big * 2
    elseif (ver == "down" or (status == "idle" and idle == "down")) then
        x_player = x_player - big / 2
        w = big
        h = size
    end


    player.removeMana(getCost())
    if ((w ~= nil) and (h ~= nil) and (x_player ~= nil) and (y_player ~= nil)) then
            local entities_in_spell = world.getEntitiesInRect(x_player, y_player, w, h)
        for i = 1, #entities_in_spell do
            if (class.isInstanceOf(entities_in_spell[i], "EntityLiving")) then
                entities_in_spell[i].hit(1 * DeltaTime)
                print("HEAL : "..entities_in_spell[i].getHealth())
            end
        end
    end
end

function isInstant(self)
    return false
end

function enable(self)
    local status, hor, ver , idle = player.getStatus()
    if (hor == "left") then
        animationSpell["rayonSpell"].setRotation(90)
        animationSpell["rayonIdleAnimation"].setRotation(90)
        animationSpell["rayonEndAnimation"].setRotation(90)
        animationSpell["rayonEndAnimation"].setOrigin(0, 0)
        animationSpell["rayonSpell"].setOrigin(0, 0)
        animationSpell["rayonIdleAnimation"].setOrigin(0, 0)
        animationSpell["rayonSpell"].setTranslation(-28, -85)
        animationSpell["rayonEndAnimation"].setTranslation(-28, -85)
        animationSpell["rayonIdleAnimation"].setTranslation(-28, -85)
    elseif (hor == "right") then
        animationSpell["rayonSpell"].setRotation(-90)
        animationSpell["rayonIdleAnimation"].setRotation(-90)
        animationSpell["rayonEndAnimation"].setRotation(-90)
        animationSpell["rayonEndAnimation"].setOrigin(0, 0)
        animationSpell["rayonSpell"].setOrigin(0, 0)
        animationSpell["rayonIdleAnimation"].setOrigin(0, 0)
        animationSpell["rayonSpell"].setTranslation(40, -25)
        animationSpell["rayonEndAnimation"].setTranslation(40, -25)
        animationSpell["rayonIdleAnimation"].setTranslation(40, -25)
    elseif (ver == "up" or (status == "idle" and idle == "up")) then
        animationSpell["rayonSpell"].setRotation(180)
        animationSpell["rayonIdleAnimation"].setRotation(180)
        animationSpell["rayonEndAnimation"].setRotation(180)
        animationSpell["rayonEndAnimation"].setOrigin(0, 0)
        animationSpell["rayonSpell"].setOrigin(0, 0)
        animationSpell["rayonIdleAnimation"].setOrigin(0, 0)
        animationSpell["rayonSpell"].setTranslation(40, -50)
        animationSpell["rayonEndAnimation"].setTranslation(40, -50)
        animationSpell["rayonIdleAnimation"].setTranslation(40, -50)
    elseif (ver == "down" or (status == "idle" and idle == "down")) then
        animationSpell["rayonEndAnimation"].setOrigin(9.5, 20)
        animationSpell["rayonSpell"].setOrigin(9.5, 20)
        animationSpell["rayonIdleAnimation"].setOrigin(9.5, 20)
        animationSpell["rayonSpell"].setRotation(0)
        animationSpell["rayonIdleAnimation"].setRotation(0)
        animationSpell["rayonEndAnimation"].setRotation(0)
        animationSpell["rayonSpell"].setTranslation(15, 20)
        animationSpell["rayonEndAnimation"].setTranslation(15, 20)
        animationSpell["rayonIdleAnimation"].setTranslation(15, 20)
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
    is_finish = true
end

function getCost(self)
    return 0.2
end
