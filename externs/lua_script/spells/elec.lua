function getName(self)
    return "elecSpell"
end

function getMaxCooldown(self)
    return 5
end

function getCost()
    return 10
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
    player.activateSpell()
    world.spawnEntity(animationSpell["elecSpell"])
    animationSpell["elecSpell"].restart()
    player.removeMana(getCost())
    local x_player, y_player = player.getPosition()
    local x_touch, y_touch = x_player, y_player
    local size = 100
    local big = 30
    local siz_up_left, siz_down_right = 0
    local status, hor, ver , idle = player.getStatus()

    if (hor == "left") then
        x_touch = x_player - size
        siz_up_left = y_player - big
        siz_down_right = y_player + big
        animationSpell["elecSpell"].setRotation(90)
    elseif (hor == "right") then
        x_touch = x_player + size
        siz_up_left = y_player - big
        siz_down_right = y_player + big
        animationSpell["elecSpell"].setRotation(-90)
    elseif (ver == "up" or (status == "idle" and idle == "up")) then
        y_touch = y_player - size
        siz_up_left = x_player - big
        siz_down_right = x_player + big
        animationSpell["elecSpell"].setRotation(-180)
    elseif (ver == "down" or (status == "idle" and idle == "down")) then
        y_touch = y_player + size
        siz_up_left = x_player - big
        siz_down_right = x_player + big
        animationSpell["elecSpell"].setRotation(0)
    end
    print("BOUT X = ")
    print(x_touch)
    print(" BOUT Y = ")
    print(y_touch)
    print(" SIZ UP LEFT = " )
    print(siz_up_left)
    print(" SIZ DOWN RITGH = ")
    print(siz_down_right)
end