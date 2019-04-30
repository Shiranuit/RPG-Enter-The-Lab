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

function cast(self)
    status, hor, ver = player.getStatus()
    player.activateSpell()
    world.spawnEntity(animationSpell["elecSpell"])
    animationSpell["elecSpell"].restart()
    player.removeMana(getCost())
    local x_player, y_player = player.getPosition()
    local x_touch, y_touch = x_player, y_player
    local big = 30
    local siz_up_left, siz_down_right = 0

    if (hor == "right") then
        x_touch = x_player + size
        siz_up_left = y_player - big
        siz_down_right = y_player + big
        animationSpell["elecSpell"].setRotation(180)
    end
    if (hor == "left") then
        x_touch = x_player - size
        siz_up_left = y_player - big
        siz_down_right = y_player + big
        animationSpell["elecSpell"].setRotation(0)
    end
    if (ver == "down") then
        y_touch = y_player + size
        siz_up_left = x_player - big
        siz_down_right = x_player + big
        animationSpell["elecSpell"].setRotation(-90)
    end
    if (ver == "up") then
        y_touch = y_player - size
        siz_up_left = x_player - big
        siz_down_right = x_player + big
        animationSpell["elecSpell"].setRotation(90)
    end
end
