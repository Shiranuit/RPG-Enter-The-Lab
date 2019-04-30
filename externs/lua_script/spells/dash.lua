local distance = 100
local diag_dist = math.floor(math.sqrt(distance^2 / 2))

function getName(self)
    return "dashSpell"
end

function getMaxCooldown(self)
    return 2
end

function cooldownStartAtEnd()
    return true
end

function getCost()
    return 5
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
    status, hor, ver = player.getStatus()
    player.removeMana(getCost())
    assets["dash"]:play()
    if (hor == "right") then
        player.move(distance, 0)
    end
    if (hor == "left") then
        player.move(-distance, 0)
    end
    if (ver == "down") then
        if (hor == "left") then
            player.move(-diag_dist, diag_dist)
            return
        end
        if (hor == "right") then
            player.move(diag_dist, diag_dist)
            return
        end
        player.move(0, distance)
    end
    if (ver == "up") then
        if (hor == "left") then
            player.move(-diag_dist, -diag_dist)
            return
        end
        if (hor == "right") then
            player.move(diag_dist, -diag_dist)
            return
        end
        player.move(0, -distance)
    end
end

