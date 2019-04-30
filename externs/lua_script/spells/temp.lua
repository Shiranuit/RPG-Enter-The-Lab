function getName(self)
    return "tempSpell"
end

function getMaxCooldown(self)
    return 10
end

function cooldownStartAtEnd()
    return false
end

function getCost()
    return 50
end

function cast(self)
    world.spawnEntity(animationSpell["tempSpell"])
    player.removeMana(getCost())
    assets["time"]:play()
    animationSpell["tempSpell"].restart()
end

function isInstant(self)
    return true
end

function enable(self)

end

function disable(self)

end