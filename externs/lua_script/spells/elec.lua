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

function cast(self)
    world.spawnEntity(animationSpell["elecSpell"])
    animationSpell["elecSpell"].restart()
    player.removeMana(getCost())
    local status, hor, ver = player.getStatus()
    local x_player, y_player = player.getPosition()
    local size = 200
    local big = 80
    local w, h = 0, 0
    local box = new(Hitbox("soft", {takeDamage=false, doDamage=true}))
    box.setPoints({{0, 0}, {83, 0}, {83, 249}, {0, 249}})
    box.setScale(1.25, 1.25)
    box.setOrigin(41.5, 0)
    box.setPosition(x_player + 15, y_player - 60)

    if (hor == "left") then
        w = -size * 1.5
        h = -big
        x_player = x_player - big / 2
        box.setRotation(90)
        animationSpell["elecSpell"].setRotation(90)
    elseif (hor == "right") then
        w = size * 1.5
        h = -big
        x_player = x_player + big / 2
        box.setRotation(-90)
        animationSpell["elecSpell"].setRotation(-90)
    elseif (ver == "up" or (status == "idle" and idle == "up")) then
        w = big
        h = -size
        x_player = x_player - big / 2
        y_player = y_player - big * 2
        box.setRotation(-180)
        animationSpell["elecSpell"].setRotation(-180)
    elseif (ver == "down" or (status == "idle" and idle == "down")) then
        x_player = x_player - big / 2
        w = big
        h = size
        box.setRotation(0)
        animationSpell["elecSpell"].setRotation(0)
    end
    --print("\nRECT EST DE: "..x_player, y_player, size, big)

    local entities_in_spell = world.getEntitiesInHitbox(box, "EntityLiving")
    for i = 1, #entities_in_spell do
        if (class.isInstanceOf(entities_in_spell[i], "EntityLiving")) then
            entities_in_spell[i].hit(20 * DeltaTime)
            print("HEAL : "..entities_in_spell[i].getHealth())
        end
    end
    player.activateSpell()
end