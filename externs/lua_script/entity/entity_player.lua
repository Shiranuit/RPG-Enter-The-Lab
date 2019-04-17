-- =========================================
-- =             ENTITY PLAYER             =
-- =========================================

entity_player = {}

function entity_player.create(info)
    check(info, "table", 1)

    local sprite = lsfml.sprite.create()
    sprite:setTexture(info.texture, false)
    sprite:setPosition(info.pos_x, info.pos_y)
    sprite:setScale(0.25, 0.25)
    sprite:setOrigin(220 / 2, 500)
    return setmetatable({}, {
        __type = "entity_player",
        __index = entity_player,
        __clock = lsfml.clock.create(),
        __pos_rect = {4, 150000, 0, 2000, 220, 500},
        __sprite = sprite,
        __health = info.health or 100,
        __stamina = info.stamina or 100,
        __speed = info.speed or 20,
        __level = info.level or 0,
        __mana = info.mana or 500,
        __max_mana = info.max_mana or 500,
        __experience = info.experience or 0,
        __max_health = info.max_health or 100,
        __max_stamina = info.max_stamina or 100,
        __luck = info.luck or 1;
        __defense = info.defense or 1,
        __attack = info.attack or 1,
        __parade = info.parade or 1,
        __status = "idle",
        __status_vertical = "none",
        __status_horizontal = "none",
        __inventory = hud.createFromFile("hud/inventory_hud.lua"),
        __uuid = uuid.randomUUID(),
        __position_x = info.pos_x,
        __position_y = info.pos_y,
        __is_sprinting = false
    })
end

function entity_player.addDefense(self, def)
    check(self ,"entity_player", 1)
    check(def, "number", 2)

    meta = getmetatable(self)
    cassert(def >= 0, "The defense must be positive", 3)
    meta.__defense = meta.__defense + def
end

function entity_player.setDefense(self, def)
    check(self ,"entity_player", 1)
    check(def, "number", 2)

    meta = getmetatable(self)
    cassert(def >= 0, "The defense must be positive", 3)
    meta.__defense = def
end

function entity_player.getDefense(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    return meta.__defense
end

function entity_player.getMana(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    return meta.__mana
end

function entity_player.getStatus(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    -- meta.__status -> the actual animation   (idle, run_right, run_left, left, right, up, down, death)
    -- meta.__status_horizontal -> the horizontal direction   (right, left, none)
    -- meta.__status_vertical -> the vertical direction   (up, down, none)
    return meta.__status, meta.__status_horizontal, meta.__status_vertical
end

function entity_player.setMana(self, mana)
    check(self ,"entity_player", 1)
    check(mana, "number", 2)

    meta = getmetatable(self)
    cassert(mana >= 0, "The mana must be positive", 3)
    cassert(mana < meta.__max_mana, "The mana cant exceed the max mana", 3)
    meta.__mana = mana
end

function entity_player.addMana(self, mana)
    check(self ,"entity_player", 1)
    check(mana, "number", 2)

    meta = getmetatable(self)
    cassert(mana > 0, "The added mana must be positive", 3)
    meta.__mana = meta.__mana + mana
    if meta.__mana > meta.__max_mana then meta.__mana = meta.__max_mana end
end

function entity_player.removeMana(self, mana)
    check(self ,"entity_player", 1)
    check(mana, "number", 2)

    meta = getmetatable(self)
    cassert(mana > 0, "The removed mana must be positive", 3)
    meta.__mana = meta.__mana - mana
    if meta.__mana < 0 then meta.__mana = 0 end
end

function entity_player.getHealth(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    return meta.__health
end

function entity_player.setHealth(self, life)
    check(self ,"entity_player", 1)
    check(life, "number", 2)

    meta = getmetatable(self)
    cassert(life > 0, "The life must be positive", 3)
    cassert(life < meta.__max_health, "The life cant exceed the max health", 3)
    meta.__health = life
end

function entity_player.heal(self, life)
    check(self ,"entity_player", 1)
    check(life, "number", 2)

    meta = getmetatable(self)
    cassert(life > 0, "The added life must be positive", 3)
    meta.__health = meta.__health + life
    if meta.__health > meta.__max_health then meta.__health = meta.__max_health end
end

function entity_player.hit(self, life)
    check(self ,"entity_player", 1)
    check(life, "number", 2)

    meta = getmetatable(self)
    cassert(life > 0, "The removed life must be positive", 3)
    meta.__health = meta.__health - life
    if meta.__health < 0 then meta.__health = 0 end
end

function entity_player.getMaximumHealth(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    return meta.__max_health
end

function entity_player.getMaximumStamina(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    return meta.__max_stamina
end

function entity_player.setMaximumHealth(self, life)
    check(self ,"entity_player", 1)
    check(life ,"number", 1)

    meta = getmetatable(self)
    assert(life > 0, "The Maximum health must be positive", 3)
    meta.__max_health = life
    if meta.__health > meta.__max_health then meta.__health = meta.__max_health end
end

function entity_player.setMaximumStamina(self, stamina)
    check(self ,"entity_player", 1)
    check(life ,"number", 1)

    meta = getmetatable(self)
    assert(life > 0, "The Maximum stamina must be positive", 3)
    meta.__max_stamina = life
    if meta.__stamina > meta.__max_stamina then meta.__stamina = meta.__max_stamina end
end

function entity_player.getStamina(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    return meta.__stamina
end

function entity_player.setStamina(self, stamina)
    check(self ,"entity_player", 1)
    check(stamina, "stamina", 2)

    meta = getmetatable(self)
    cassert(stamina > 0, "The stamina must be positive", 3)
    cassert(stamina < meta.__max_stamina, "The stamina cant exceed the max stamina", 3)
    meta.__stamina = stamina
end

function entity_player.addStamina(self, stamina)
    check(self ,"entity_player", 1)
    check(stamina, "stamina", 2)

    meta = getmetatable(self)
    cassert(life > 0, "The added stamina must be positive", 3)
    meta.__stamina = meta.__stamina + stamina
    if meta.__stamina > meta.__max_stamina then meta.__stamina = meta.__max_stamina end
end

function entity_player.removeStamina(self, stamina)
    check(self ,"entity_player", 1)
    check(stamina, "stamina", 2)

    meta = getmetatable(self)
    cassert(life > 0, "The removed stamina must be positive", 3)
    meta.__stamina = meta.__stamina - stamina
    if meta.__stamina < 0 then meta.__stamina = 0 end
end

function entity_player.getSpeed(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    return meta.__speed
end

function entity_player.setSpeed(self, speed)
    check(self ,"entity_player", 1)
    check(speed ,"speed", 1)

    meta = getmetatable(self)
    cassert(speed > 0, "The speed must be positive", 3)
    meta.__speed = speed

end
---------------------------------

function entity_player.getInventory(self)
    check(self ,"entity_player", 1)

    local meta = getmetatable(self)
    return meta.__inventory
end

function entity_player.getEquipement(self)
    check(self ,"entity_player", 1)
end
---------------------------------

function entity_player.getLevel(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    return meta.__level
end

function entity_player.getExperience(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    return meta.__experience
end

function entity_player.getStats(self)
    check(self ,"entity_player", 1)

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

function entity_player.respawn(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    meta.__status = "respawn"
    meta.__health = meta.__max_health
    meta.__stamina = meta.__max_stamina
    meta.__pos_rect = {12, 30000, 2640, 2500, 220, 500}
    meta.__clock:restart()
    meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
end

function entity_player.isDead(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    if meta.__status == "death" then
        return true
    else
        return false
    end
end

function entity_player.setPosition(self, x, y)
    check(self ,"entity_player", 1)
    check(x ,"number", 2)
    check(y ,"number", 3)

    meta = getmetatable(self)
    meta.__position_x, meta.__position_y = x, y
    meta.__sprite:setPosition(x, y)
end

function entity_player.getPosition(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    return meta.__position_x, meta.__position_y
end

function entity_player.move(self, x, y)
    check(self ,"entity_player", 1)
    check(x ,"number", 2)
    check(y ,"number", 3)

    meta = getmetatable(self)
    meta.__sprite:move(x, y)
    meta.__position_x = meta.__position_x + x
    meta.__position_y = meta.__position_y + y
end

function entity_player.event(self, e)
    local event = e:getEvent()
    if event[1] == "key_pressed" then
        if event[2] == controls.getControl("pickup") then
            local x, y = self:getPosition()
            local w, h = 50, 50
            local entities = world.getEntitiesInRect(x - w, y - h, w * 2,h * 2)
            for i=1, #entities do
                if type(entities[i]) == "entity_item" then
                    if self:getInventory():insertItemStack(entities[i]:getItemStack()) then
                        world.removeEntityByUUID(entities[i]:getUUID())
                        break
                    end
                end
            end
        end
    end
end

function entity_player.update(self)
    check(self ,"entity_player", 1)

    meta = getmetatable(self)
    if meta.__status == "respawn" then
        return
    end
    speed = meta.__speed * DeltaTime
    if meta.__is_sprinting == true and meta.__status ~= "idle" then
        meta.__stamina = meta.__stamina - 1 * DeltaTime
        speed = speed * 2
    elseif meta.__max_stamina > meta.__stamina and (not lsfml.keyboard.keyPressed(controls.getControl("sprint")) or meta.__status == "idle") then
        meta.__stamina = meta.__stamina + 1 * DeltaTime
    end
    if  meta.__health <= 0 then
        if (meta.__status ~= "death") then
            meta.__status = "death"
            meta.__pos_rect = {12, 30000, 0, 2500, 220, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
    end
    if lsfml.keyboard.keyPressed(controls.getControl("move_up")) and meta.__health > 0 then
        if (meta.__status ~= "up" and meta.__status ~= "left" and meta.__status ~= "right" and meta.__status ~= "run_right" and meta.__status ~= "run_left") then
            meta.__status = "up"
            meta.__pos_rect = {7, 250000 / speed, 0, 1000, 220, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
        if meta.__status ~= "death" and meta.__status ~= "respawn" then
            self:move(0, -speed)
            meta.__status_vertical = "up"
        end
    elseif lsfml.keyboard.keyPressed(controls.getControl("move_down")) and meta.__health > 0 then
        if (meta.__status ~= "down" and meta.__status ~= "left" and meta.__status ~= "right" and meta.__status ~= "run_right" and meta.__status ~= "run_left") then
            meta.__status = "down"
            meta.__pos_rect = {7, 250000 / speed, 0, 1500, 220, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
        if meta.__status ~= "death" and meta.__status ~= "respawn" then
            self:move(0, speed)
            meta.__status_vertical = "down"
        end
    else
        meta.__status_vertical = "none"
    end
    if lsfml.keyboard.keyPressed(controls.getControl("move_right")) and meta.__health > 0 and meta.__is_sprinting then
        if (meta.__status ~= "run_right") then
            meta.__status = "run_right"
            meta.__pos_rect = {5, 250000 / speed, 0, 3000, 219, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
        if meta.__status ~= "death" and meta.__status ~= "respawn" then
            self:move(speed, 0)
            meta.__status_horizontal = "right"
        end
    elseif lsfml.keyboard.keyPressed(controls.getControl("move_left")) and meta.__health > 0 and meta.__is_sprinting then
        if (meta.__status ~= "run_left") then
            meta.__status = "run_left"
            meta.__pos_rect = {5, 250000 / speed, 0, 3500, 219, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
        if meta.__status ~= "death" and meta.__status ~= "respawn" then
            self:move(-speed, 0)
            meta.__status_horizontal = "left"
        end
    elseif lsfml.keyboard.keyPressed(controls.getControl("move_right")) and meta.__health > 0 then
        if (meta.__status ~= "right") then
            meta.__status = "right"
            meta.__pos_rect = {15, 250000 / speed, 0, 0, 220, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
        if meta.__status ~= "death" and meta.__status ~= "respawn" then
            meta.__status_horizontal = "right"
            self:move(speed, 0)
        end
    elseif lsfml.keyboard.keyPressed(controls.getControl("move_left")) and meta.__health > 0 then
        if (meta.__status ~= "left") then
            meta.__status = "left"
            meta.__pos_rect = {15, 250000 / speed, 0, 500, 220, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
        if meta.__status ~= "death" and meta.__status ~= "respawn" then
            meta.__status_horizontal = "left"
            self:move(-speed, 0)
        end
    else
        meta.__status_horizontal = "none"
    end
    if meta.__status == "left" and not lsfml.keyboard.keyPressed(controls.getControl("move_left")) and meta.__health > 0 then
        meta.__status = "idle"
        meta.__pos_rect = {4, 150000, 0, 2000, 220, 500}
        meta.__clock:restart()
        meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
    end
    if meta.__status == "right" and not lsfml.keyboard.keyPressed(controls.getControl("move_right")) and meta.__health > 0 then
        meta.__status = "idle"
        meta.__pos_rect = {4, 150000, 0, 2000, 220, 500}
        meta.__clock:restart()
        meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
    end
    if meta.__status_horizontal == "none" and meta.__status_vertical == "none" and meta.__health > 0 then
        if meta.__status ~= "idle" then
            meta.__status = "idle"
            meta.__pos_rect = {4, 150000, 0, 2000, 220, 500}
            meta.__clock:restart()
            meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        end
    end
    meta.__is_sprinting = lsfml.keyboard.keyPressed(controls.getControl("sprint")) and meta.__health > 0 and meta.__stamina > 0
end

function entity_player.draw(self)
    check(self, "entity_player", 1)

    local meta = getmetatable(self)
    time = meta.__pos_rect[2]

    if meta.__is_sprinting == true and meta.__status ~= "idle" then
        time = time * 1.25
    end
    if meta.__clock:getEllapsedTime() > time * DeltaTime then
        if meta.__status ~= "respawn" then
            meta.__pos_rect[3] = meta.__pos_rect[3] + meta.__pos_rect[5]
            if meta.__pos_rect[3] > meta.__pos_rect[5] * (meta.__pos_rect[1] - 1) and  meta.__status ~= "death" then
                meta.__pos_rect[3] = 0
            end
        elseif meta.__status == "respawn" then
            meta.__pos_rect[3] = meta.__pos_rect[3] - meta.__pos_rect[5]
            if meta.__pos_rect[3] < 0 then
                meta.__status = "idle"
                meta.__pos_rect = {4, 150000, 0, 2000, 220, 500}
            end
        end
        meta.__sprite:setTextureRect(table.unpack(meta.__pos_rect, 3))
        meta.__clock:restart()
    end
    window:draw(meta.__sprite)
end

function entity_player.getUUID(self)
    check(self, "entity_player", 1)

    local meta = getmetatable(self)
    return meta.__uuid
end