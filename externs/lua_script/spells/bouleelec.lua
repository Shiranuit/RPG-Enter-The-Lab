function getName(self)
    return "bouleelecSpell"
end

function getMaxCooldown(self)
    return 5
end

function cooldownStartAtEnd()
    return true
end

function getCost()
    return 15
end

function cooldownStartAtEnd()
    return true
end

function isInstant(self)
    return true
end

function enable(self)

end

function disable(self)

end

function cast(self)
    world.removeEntityByUUID(animationSpell["bouleelecSpell"].getUUID())
    world.spawnEntity(animationSpell["bouleelecSpell"])
    animationSpell["bouleelecSpell"].restart()
    player.removeMana(getCost())
    local x, y = animationSpell["bouleelecSpell"].getPosition()
    local x_player, y_player = player.getPosition()
    local x_boule, y_boule = x_player, y_player
    local size = 70
    local big = 70
    local w, h = 0, 0
    local siz_up_left, siz_down_right = 0
    local status, hor, ver , idle = player.getStatus()

    if (hor == "left") then
        animationSpell["bouleelecSpell"].setPosition(x_player, y_player + 60)
        animationSpell["bouleelecSpell"].moving(-15, 0)
        siz_up_left = y_player - big
        siz_down_right = y_player + big
    elseif (hor == "right") then
        animationSpell["bouleelecSpell"].setPosition(x_player, y_player + 60)
        animationSpell["bouleelecSpell"].moving(15, 0)
        siz_up_left = y_player - big
        siz_down_right = y_player + big
    elseif (ver == "up" or (status == "idle" and idle == "up")) then
        animationSpell["bouleelecSpell"].setPosition(x_player, y_player + 60)
        animationSpell["bouleelecSpell"].moving(0, -15)
        siz_up_left = x_player - big
        siz_down_right = x_player + big
    elseif (ver == "down" or (status == "idle" and idle == "down")) then
        animationSpell["bouleelecSpell"].setPosition(x_player, y_player + 60)
        animationSpell["bouleelecSpell"].moving(0, 15)
        siz_up_left = x_player - big
        siz_down_right = x_player + big
    end

    --print("\nRECT EST DE: "..x_player, y_player, size, big)
    local entities_in_spell = world.getEntitiesInRect(x_player, y_player, w, h)
    for i = 1, #entities_in_spell do
        if (class.isInstanceOf(entities_in_spell[i], "EntityLiving")) then
            entities_in_spell[i].hit(20 * DeltaTime)
            print("HEAL : "..entities_in_spell[i].getHealth())
        end
    end
end
