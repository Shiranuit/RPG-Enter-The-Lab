function getName(self)
    return "picSpell"
end

function getMaxCooldown(self)
    return 1
end

function getCost()
    return 1
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
    world.spawnEntity(animationSpell["picSpell"])
    animationSpell["picSpell"].restart()
    player.removeMana(getCost())
    local x_player, y_player = player.getPosition()
    local size = 300
    local big = 100
    local w, h = 0, 0
    local status, hor, ver , idle = player.getStatus()
    
    if (hor == "left") then
        w = -size * 1.5
        h = -big
        x_player = x_player - big / 2
        animationSpell["picSpell"].setRotation(0)
    elseif (hor == "right") then
        w = size * 1.5
        h = -big
        x_player = x_player + big / 2
        animationSpell["picSpell"].setRotation(180)
    elseif (ver == "up" or (status == "idle" and idle == "up")) then
        w = big
        h = -size
        x_player = x_player - big / 2
        y_player = y_player - big * 2
        animationSpell["picSpell"].setRotation(90)
    elseif (ver == "down" or (status == "idle" and idle == "down")) then
        x_player = x_player - big / 2
        w = big
        h = size
        animationSpell["picSpell"].setRotation(-90)
    end

    animationSpell["picSpell"].makeDamage()
    player.activateSpell()
end
