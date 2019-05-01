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

function isNotValid()
    status, hor, ver = player.getStatus()
    if (status == "idle") then
        assets["deny"]:play()
        return true
    end
    return false
end

function cast(self)
    -- player.activateSpell()
    world.spawnEntity(animationSpell["bouleelecSpell"])
    animationSpell["bouleelecSpell"].restart()
    player.removeMana(getCost())
    local x, y = animationSpell["bouleelecSpell"].getPosition()
    local x_player, y_player = player.getPosition()
    local x_boule, y_boule = x_player, y_player
    local big = 30
    local siz_up_left, siz_down_right = 0
    local status, hor, ver , idle = player.getStatus()
    
    if (hor == "left") then
        siz_up_left = y_player - big
        siz_down_right = y_player + big
    elseif (hor == "right") then
        animationSpell["bouleelecSpell"].setPosition(x + 50, y)
        siz_up_left = y_player - big
        siz_down_right = y_player + big
    elseif (ver == "up" or (status == "idle" and idle == "up")) then
        siz_up_left = x_player - big
        siz_down_right = x_player + big
    elseif (ver == "down" or (status == "idle" and idle == "down")) then
        siz_up_left = x_player - big
        siz_down_right = x_player + big
    end
end
