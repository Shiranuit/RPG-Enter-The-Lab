-- =========================================
-- =                PLAYER                 =
-- =========================================

player = {}

function player.create(info)
    check(info, "table", 1)

    local sprite = lsfml.sprite.create()
    sprite:setTexture(info.texture, false)
    sprite:setPosition(info.pos_x, info.pos_y)
    sprite:setScale(0.5, 0.5)
    return setmetatable({}, {
        __type = "player",
        __index = player,
        __clock = lsfml.clock.create(),
        __pos_rect = {12, 100000, 0, 2000, 220, 500},
        __sprite = sprite,
        __health = info.health or 100,
        __stamina = info.stamina or 100,
        __speed = info.speed or 20,
        __level = info.level or 0,
        __experience = info.experience or 0,
        __max_health = info.max_health or 100,
        __max_stamina = info.max_stamina or 100,
        __luck = info.luck or 1;
        __defense = info.defense or 1,
        __attack = info.attack or 1,
        __parade = info.parade or 1,
        __status = "idle",
        __position_x = info.pos_x,
        __position_y = info.pos_y,
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

end

function player.update(self)
    check(self ,"player", 1)

    meta = getmetatable(self)
    if lsfml.keyboard.keyPressed(keys.Z) then 
        if (meta.__status ~= "up") then
            meta.__status = "up"
            meta.__pos_rect = {7, 350000 / meta.__speed, 0, 1000, 220, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
        meta.__sprite:move(0, -meta.__speed)
    elseif lsfml.keyboard.keyPressed(keys.S) then
        if (meta.__status ~= "down") then
            meta.__status = "down"
            meta.__pos_rect = {7, 350000 / meta.__speed, 0, 1500, 220, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
        meta.__sprite:move(0, meta.__speed)
    elseif lsfml.keyboard.keyPressed(keys.D) then
        if (meta.__status ~= "right") then
            meta.__status = "right"
            meta.__pos_rect = {15, 350000 / meta.__speed, 0, 0, 220, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
        meta.__sprite:move(meta.__speed, 0)
    elseif lsfml.keyboard.keyPressed(keys.Q) then
        if (meta.__status ~= "left") then
            meta.__status = "left"
            meta.__pos_rect = {15, 350000 / meta.__speed, 0, 500, 220, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
        meta.__sprite:move(-meta.__speed, 0)
    else
        if (meta.__status ~= "idle") then
            meta.__status = "idle"
            meta.__pos_rect = {12, 100000, 0, 2000, 220, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
    end
    if  meta.__health <= 0 then
        meta.__status = "death"
    end
end

function player.draw(self)
    check(self, "player", 1)

    local meta = getmetatable(self)
    if meta.__clock:getEllapsedTime() > meta.__pos_rect[2] then
        meta.__pos_rect[3] = meta.__pos_rect[3] + meta.__pos_rect[5]
        if meta.__pos_rect[3] > meta.__pos_rect[5] * (meta.__pos_rect[1] - 1) then
            meta.__pos_rect[3] = 0
        end
        meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        meta.__clock:restart()
    end
    window:draw(meta.__sprite)
end