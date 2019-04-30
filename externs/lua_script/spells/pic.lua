function getName(self)
    return "picSpell"
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

function cast(self)
    status, hor, ver = player.getStatus()
    
    player.activateSpell()
    world.spawnEntity(animationSpell["picSpell"])
    animationSpell["picSpell"].restart()
    if (status == "idle") then
        assets["deny"]:play()
        return
    end
    player.removeMana(getCost())
    local x_player, y_player = player.getPosition()
    local x_touch, y_touch = x_player, y_player
    local size = 100
    local big = 30
    local siz_up_left, siz_down_right = 0

    if (hor == "right") then
        x_touch = x_player + size
        siz_up_left = y_player - big
        siz_down_right = y_player + big
    end
    if (hor == "left") then
        x_touch = x_player - size
        siz_up_left = y_player - big
        siz_down_right = y_player + big
    end
    if (ver == "down") then
        y_touch = y_player + size
        siz_up_left = x_player - big
        siz_down_right = x_player + big
    end
    if (ver == "up") then
        y_touch = y_player - size
        siz_up_left = x_player - big
        siz_down_right = x_player + big
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
