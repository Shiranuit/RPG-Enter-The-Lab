function getName(self)
    return "dashSpell"
end

function getMaxCooldown(self)
    return 2
end

function cooldownStartAtEnd()
    return true
end

function cast(self)
    status, hor, ver = player.getStatus()
    player.removeMana(5)
    assets["dash"]:play()
    if (hor == "right") then
        player.move(100, 0)
    end
    if (hor == "left") then
        player.move(100, 0)
    end
    if (ver == "down") then
        if (hor == "left") then
            player.move(-70, 70)
            return
        end
        if (hor == "right") then
            player.move(70, 70)
            return
        end
        player.move(0, 100)
    end
    if (ver == "up") then
        if (hor == "left") then
            player.move(-70, -70)
            return
        end
        if (hor == "right") then
            player.move(70, -70)
            return
        end
        player.move(0, -100)
    end
end

