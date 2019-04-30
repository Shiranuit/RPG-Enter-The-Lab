function getName(self)
    return "repulsionSpell"
end

function getMaxCooldown(self)
    return 5
end

function cooldownStartAtEnd()
    return true
end

function getCost()
    return 5
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
    return false
end

function cast(self)
    status, hor, ver = player.getStatus()
    player.activateSpell()
    world.spawnEntity(animationSpell["repulsionSpell"])
    animationSpell["repulsionSpell"].restart()
    player.removeMana(getCost())
end
