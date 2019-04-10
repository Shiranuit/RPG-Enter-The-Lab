-- =========================================
-- =                PLAYER                 =
-- =========================================

player = {}

function player.create(info)
    check(info, "table", 1)

    local sprite = lsfml.sprite.create()
    sprite:setTexture(info.idle, false)
    sprite:setPosition(info.x, info.y)
    return setmetatable({}, {
        __clock = lsfml.clock.create(),
        __pos_rect = {0, 0, 0, 0},
        __sprite = sprite,
        __health = info.health,
        __stamina = info.stamina,
        __speed = info.speed,
        __level = info.level,
        __experience = info.experience,
        __max_health = info.max_health,
        __max_stamina = info.max_stamina,
        __luck = info.luck;
        __defense = info.defense,
        __attack = info.attack,
        __parade = info.parade,
        __status = "idle"
    })
end

function player.getHealth(self)
    check(self ,"player", 1)

    meta = getmetatable(self)
    return meta.__health
end

function player.setHealth(self, life)
    check(self ,"player", 1)
    check(life, "number", 2)

    meta = getmetatable(self)
    cassert(life < 0, "The life must be positive", 3)
    cassert(life > meta.__max_health, "The life cant exceed the max health", 3)
    meta.__health = life
end

function player.heal(self, life)
    check(self ,"player", 1)
    check(life, "number", 2)

    meta = getmetatable(self)
    cassert(life < 0, "The added life must be positive", 3)
    meta.__health = meta.__health + life
    if meta.__health > meta.__max_health then meta.__health = meta.__max_health end
end

function player.hit(self)
    check(self ,"player", 1)
    check(life, "number", 2)

    meta = getmetatable(self)
    cassert(life < 0, "The removed life must be positive", 3)
    meta.__health = meta.__health - life
    if meta.__health < 0 then meta.__health = 0 end
end

function player.getMaximumHealth(self)
    check(self ,"player", 1)

    meta = getmetatable(self)
    return meta.__max_health
end 

function player.setMaximumHealth(self, life)
    check(self ,"player", 1)
    check(life ,"number", 1)

    meta = getmetatable(self)
    assert(life < 0, "The Maximum health must be positive", 3)
    meta.__max_health = life
    if meta.__health > meta.__max_health then meta.__health = meta.__max_health end
end

function player.getStamina(self)
    check(self ,"player", 1)

    meta = getmetatable(self)
    return meta.__stamina
end

function player.setStamina(self, stamina)
    check(self ,"player", 1)
    check(stamina, "stamina", 2)

    meta = getmetatable(self)
    cassert(stamina < 0, "The stamina must be positive", 3)
    cassert(stamina > meta.__max_stamina, "The stamina cant exceed the max stamina", 3)
    meta.__stamina = stamina
end

function player.addStamina(self, stamina)
    check(self ,"player", 1)
    check(stamina, "stamina", 2)
    
    meta = getmetatable(self)
    cassert(life < 0, "The added stamina must be positive", 3)
    meta.__stamina = meta.__stamina + stamina
    if meta.__stamina > meta.__max_stamina then meta.__stamina = meta.__max_stamina end
end

function player.removeStamina(self, stamina)
    check(self ,"player", 1)
    check(stamina, "stamina", 2)
    
    meta = getmetatable(self)
    cassert(life < 0, "The removed stamina must be positive", 3)
    meta.__stamina = meta.__stamina - stamina
    if meta.__stamina < 0 then meta.__stamina = 0 end
end

function player.getSpeed(self)
    check(self ,"player", 1)

    meta = getmetatable(self)
    return meta.__speed
end

function player.setSpeed(self, speed)
    check(self ,"player", 1)
    check(speed ,"speed", 1)

    meta = getmetatable(self)
    cassert(speed < 0, "The speed must be positive", 3)
    meta.__speed = speed

end
---------------------------------

function player.getInventory(self)
    check(self ,"player", 1)
end

function player.getEquipement(self)
    check(self ,"player", 1)
end
---------------------------------

function player.getLevel(self)
    check(self ,"player", 1)

    meta = getmetatable(self)
    return meta.__level
end

function player.getExperience(self)
    check(self ,"player", 1)

    meta = getmetatable(self)
    return meta.__experience
end

function player.getStats(self)
    check(self ,"player", 1)

    meta = getmetatable(self)
    return {
        maxHealth=meta.__max_health, 
        maxStamina=meta.__max_stamina, 
        luck=meta.__luck, 
        attack=meta.__attack, 
        defense=meta.__defense, 
        parade=meta.__parade
    }
end

function player.event(self)
    check(self ,"player", 1)

    meta = getmetatable(self)
    if lsfml.keyboard.keyPressed(keys.Z) then 
        if (meta.__status ~= "up") then
            meta.__status = "up"
            meta.__pos_rect = {5, 0, 0, 0, 0}
            meta.__clock:restart()
            sprite:setTextureRect(table.unpack(meta.__pos_rect, 2))
        end
    elseif lsfml.keyboard.keyPressed(keys.S) then
        if (meta.__status ~= "down") then
            meta.__status = "down"
            meta.__pos_rect = {5, 0, 0, 0, 0}
            meta.__clock:restart()
            sprite:setTextureRect(table.unpack(meta.__pos_rect, 2))
        end
    elseif lsfml.keyboard.keyPressed(keys.D) then
        if (meta.__status ~= "right") then
            meta.__status = "right"
            meta.__pos_rect = {5, 0, 0, 0, 0}
            meta.__clock:restart()
            sprite:setTextureRect(table.unpack(meta.__pos_rect, 2))
        end
    elseif lsfml.keyboard.keyPressed(keys.Q) then
        if (meta.__status ~= "left") then
            meta.__status = "left"
            meta.__pos_rect = {5, 0, 0, 0, 0}
            meta.__clock:restart()
            sprite:setTextureRect(table.unpack(meta.__pos_rect, 2))
        end
    else
        meta.__status = "idle"
        meta.__pos_rect = {5, 0, 0, 0, 0}
        meta.__clock:restart()
        sprite:setTextureRect(table.unpack(meta.__pos_rect, 2))
    end
end

function player.update(self)
    check(self ,"player", 1)
end

function player.draw(self)
    check(self, "player", 1)

    local meta = getmetatable(self)
    if meta.__clock:getEllapsedTime() > 100000 then
        meta.__pos_rect[2] = meta.__pos_rect[2] + 0
        if meta.__pos_rect[2] > meta.__pos_rect[4] then
            meta.__pos_rect[2] = 0
        end
        sprite:setTextureRect(table.unpack(meta.__pos_rect, 2))
        meta.__clock:restart()
    end

    window:draw(meta.__sprite)
end