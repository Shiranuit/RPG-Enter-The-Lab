-- =========================================
-- =             ENTITY PLAYER             =
-- =========================================

Class "EntityPlayer" extends "EntityLiving" [{
    function __EntityPlayer(info)
        check(info, "table", 1)

        super(info.pos_x or 0, info.pos_y or 0)

        this.sprite = lsfml.sprite.create()
        this.sprite:setTexture(info.texture, false)
        this.sprite:setPosition(info.pos_x or 0, info.pos_y or 0)
        this.sprite:setScale(0.25, 0.25)
        this.sprite:setOrigin(220 / 2, 500)
        this.sprite:setTextureRect(0, 2000, 220, 500)
        this.clock = stopwatch.create()
        this.pos_rect = {4, 150000, 0, 2000, 220, 500}
        super.setMaximumHealth(info.max_health or 100)
        super.setHealth(info.health or 100)
        super.getStats().setDefense(info.defense or 1)
        super.getStats().setAttack(info.attack or 1)
        super.getStats().setParade(info.parade or 1)
        super.getStats().setSpeed(info.speed or 20)
        super.setLevel(info.level or 1)
        this.stamina = info.stamina or 100
        this.max_stamina = info.max_stamina or 100
        this.mana = info.mana or 250
        this.max_mana = info.max_mana or 250
        this.experience = info.experience or 0
        this.luck = info.luck or 1
        this.base_health = super.getMaximumHealth()
        this.status = "idle"
        this.status_idle = "down"
        this.status_vertical = "none"
        this.status_horizontal = "none"
        this.inventory = hud.createFromFile("hud/inventory_hud.lua")
        this.is_sprinting = false
        this.is_damageable = true
        local box = new(Hitbox("player"))
        box.setPoints({{0, 0}, {220, 0}, {220, 500}, {0, 500}})
        box.setOrigin(220 / 2, 500)
        box.setScale(0.25, 0.25)
        box.setPosition(super.getPosition())
        super.addHitbox(box)
    end

    function damageable(bool)
        this.is_damageable = bool
    end
    function activateSpell()
        if this.status == "spell" then
            return
        end
        this.is_sprinting = false
        if this.status_horizontal == "left" then
            this.pos_rect = {4, 150000, 0, 4992, 300, 500}
            this.clock:restart()
            this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
        elseif this.status_horizontal == "right" then
            this.pos_rect = {4, 150000, 0, 4492, 300, 500}
            this.clock:restart()
            this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
        elseif this.status_vertical == "up" or (this.status == "idle" and this.status_idle == "up") then
            this.pos_rect = {4, 150000, 0, 5992, 199, 500}
            this.clock:restart()
            this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
        elseif this.status_vertical == "down" or (this.status == "idle" and this.status_idle == "down") then
            this.pos_rect = {4, 150000, 0, 5492, 199, 500}
            this.clock:restart()
            this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
        end
        this.status = "spell"
    end

    function desactivateSpell()
        if this.status == "spell" then
            this.status = "idle"
            this.status_idle = "down"
            this.pos_rect = {4, 150000, 0, 2000, 220, 500}
            this.clock:restart()
            this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
        end
    end

    function getMana()
        return math.max(this.mana, 0)
    end

    function getMaximumMana()
        local equipment = this.getEquipement()
        local mana = 0
        for i=1, 4 do
            if equipment[i] and equipment[i]:getStackSize() > 0 then
                mana = mana + (equipment[i]:getStats() and equipment[i]:getStats().max_mana or 0)
            end
        end
        return this.max_mana + mana
    end

    function getStatus()
        -- this.status -> the actual animation   (idle, run_right, run_left, left, right, up, down, death)
        -- this.status_horizontal -> the horizontal direction   (right, left, none)
        -- this.status_vertical -> the vertical direction   (up, down, none)
        return this.status, this.status_horizontal, this.status_vertical, this.status_idle
    end

    function setMana(mana)
        check(mana, "number", 1)

        cassert(mana >= 0, "The mana must be positive", 3)
        cassert(mana < this.max_mana, "The mana cant exceed the max mana", 3)
        this.mana = mana
    end

    function addMana(mana)
        check(mana, "number", 1)

        cassert(mana >= 0, "The added mana must be positive", 3)
        this.mana = this.mana + mana
        if this.mana > this.max_mana then this.mana = this.max_mana end
    end

    function removeMana(mana)
        check(mana, "number", 1)

        cassert(mana >= 0, "The removed mana must be positive", 3)
        this.mana = this.mana - mana
        if this.mana < 0 then this.mana = 0 end
    end

    function getMaximumStamina()
        local equipment = this.getEquipement()
        local stamina = 0
        for i=1, 4 do
            if equipment[i] and equipment[i]:getStackSize() > 0 then
                stamina = stamina + (equipment[i]:getStats() and equipment[i]:getStats().max_stamina or 0)
            end
        end
        return this.max_stamina + stamina
    end

    function setMaximumStamina(stamina)
        check(life ,"number", 1)

        assert(life > 0, "The Maximum stamina must be positive", 3)
        this.max_stamina = life
        if this.stamina > this.max_stamina then this.stamina = this.max_stamina end
    end

    function getStamina()
        return math.max(this.stamina, 0)
    end

    function setStamina(stamina)
        check(stamina, "stamina", 1)

        cassert(stamina > 0, "The stamina must be positive", 3)
        cassert(stamina < this.max_stamina, "The stamina cant exceed the max stamina", 3)
        this.stamina = stamina
    end

    function addStamina(stamina)
        check(stamina, "stamina", 1)

        cassert(life > 0, "The added stamina must be positive", 3)
        this.stamina = this.stamina + stamina
        if this.stamina > this.max_stamina then this.stamina = this.max_stamina end
    end

    function removeStamina(stamina)
        check(stamina, "stamina", 1)

        cassert(life > 0, "The removed stamina must be positive", 3)
        this.stamina = this.stamina - stamina
        if this.stamina < 0 then this.stamina = 0 end
    end

    ---------------------------------

    function getInventory(self)
        return this.inventory
    end

    function getEquipement()
        return {this.inventory:getItemInSlot(29), this.inventory:getItemInSlot(30),
                this.inventory:getItemInSlot(31), this.inventory:getItemInSlot(32)}
    end
    ---------------------------------

    function hit(damage, source)
        if this.is_damageable then
            local defense = this.getDefense()
            super.hit(damage * (1 - (defense - 1)), source)
        end
    end

    function getDefense()
        local equipment = this.getEquipement()
        local defense = 0
        for i=1, 4 do
            if equipment[i] and equipment[i]:getStackSize() > 0 then
                defense = defense + (equipment[i]:getStats() and equipment[i]:getStats().defense or 0)
            end
        end
        return defense / 100 + this.getStats().getDefense()
    end

    function getAttack()
        local equipment = this.getEquipement()
        local damage = 0
        for i=1, 4 do
            if equipment[i] and equipment[i]:getStackSize() > 0 then
                damage = damage + (equipment[i]:getStats() and equipment[i]:getStats().damage or 0)
            end
        end
        return damage / 100 + this.getStats().getDefense()
    end

    function getParade()
        local equipment = this.getEquipement()
        local parade = 0
        for i=1, 4 do
            if equipment[i] and equipment[i]:getStackSize() > 0 then
                parade = parade + (equipment[i]:getStats() and equipment[i]:getStats().parade or 0)
            end
        end
        return parade / 100 + this.getStats().getParade()
    end

    function getSpeed()
        local equipment = this.getEquipement()
        local speed = 0
        for i=1, 4 do
            if equipment[i] and equipment[i]:getStackSize() > 0 then
                speed = speed + (equipment[i]:getStats() and equipment[i]:getStats().speed or 0)
            end
        end
        return speed + this.getStats().getSpeed()
    end

    function getExperience()
        return this.experience
    end

    function respawn()
        if super.isDead() then
            this.status = "respawn"
            super.respawn()
            print(super.getPosition())
            setScene("test_player")
            this.setPosition(1037, 684)
            this.stamina = this.max_stamina
            this.pos_rect = {12, 30000, 2640, 2500, 220, 500}
            this.clock:restart()
            this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
        end
    end

    function setPosition(x, y)
        check(x ,"number", 1)
        check(y ,"number", 2)

        super.setPosition(x, y)
        this.sprite:setPosition(x, y)
    end

    function move(x, y)
        check(x ,"number", 1)
        check(y ,"number", 2)

        local success, nx, ny = super.move(x, y)
        if success then
            this.sprite:move(nx, ny)
        end
    end

    function isSprinting()
        return this.is_sprinting
    end

    function event(e)
        super.event()
        local event = e:getEvent()
        if event[1] == "key_pressed" then
            if event[2] == controls.getControl("action") then
                local x, y = super.getPosition()
                local w, h = 50, 50
                local entities = world.getEntitiesInRect(x - w, y - h, w * 2,h * 2)
                for i=1, #entities do
                    if type(entities[i]) == "EntityItem" then
                        if this.getInventory():insertItemStack(entities[i].getItemStack()) then
                            world.removeEntityByUUID(entities[i].getUUID())
                            break
                        end
                    end
                end
            end
        end
    end

    function computeMaxHealth()
        local equipment = this.getEquipement()
        local health = 0
        for i=1, 4 do
            if equipment[i] and equipment[i]:getStackSize() > 0 then
                health = health + (equipment[i]:getStats() and equipment[i]:getStats().max_health or 0)
            end
        end
        this.setMaximumHealth(health + this.base_health)
    end

    function update()
        super.update()
        computeMaxHealth()
        if this.status == "respawn" then
            return
        end
        local speed = this.getStats().getSpeed() * DeltaTime
        if this.is_sprinting == true and this.status ~= "idle" then
            this.stamina = this.stamina - 1 * DeltaTime
            speed = speed * 2
        elseif this.max_stamina > this.stamina and (not keyboard.keyPressed(controls.getControl("sprint")) or this.status == "idle") then
            this.stamina = this.stamina + 1 * DeltaTime
        end
        if this.max_mana > this.mana and this.status ~= "spell" then
            this.mana = this.mana + 0.1 * DeltaTime
        end
        if super.isDead() then
            if (this.status ~= "death") then
                this.status = "death"
                this.pos_rect = {12, 30000, 0, 2500, 220, 500}
                this.clock:restart()
                this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
            end
        end
        if this.status == "spell" then
            return
        end
        if keyboard.keyPressed(controls.getControl("move_up")) and this.getHealth() > 0 then
            if (this.status ~= "up" and this.status ~= "left" and this.status ~= "right" and this.status ~= "run_right" and this.status ~= "run_left") then
                this.status = "up"
                this.pos_rect = {7, 250000 / speed, 0, 1000, 220, 500}
                this.clock:restart()
                this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
            end
            if this.status ~= "death" and this.status ~= "respawn" then
                this.move(0, -speed)
                this.status_vertical = "up"
            end
        elseif keyboard.keyPressed(controls.getControl("move_down")) and this.getHealth() > 0 then
            if (this.status ~= "down" and this.status ~= "left" and this.status ~= "right" and this.status ~= "run_right" and this.status ~= "run_left") then
                this.status = "down"
                this.pos_rect = {7, 250000 / speed, 0, 1500, 220, 500}
                this.clock:restart()
                this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
            end
            if this.status ~= "death" and this.status ~= "respawn" then
                this.move(0, speed)
                this.status_vertical = "down"
            end
        else
            this.status_vertical = "none"
        end
        if keyboard.keyPressed(controls.getControl("move_right")) and this.getHealth() > 0 and this.is_sprinting then
            if (this.status ~= "run_right") then
                this.status = "run_right"
                this.pos_rect = {5, 250000 / speed, 0, 3000, 219, 500}
                this.clock:restart()
                this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
            end
            if this.status ~= "death" and this.status ~= "respawn" then
                this.move(speed, 0)
                this.status_horizontal = "right"
            end
        elseif keyboard.keyPressed(controls.getControl("move_left")) and this.getHealth() > 0 and this.is_sprinting then
            if (this.status ~= "run_left") then
                this.status = "run_left"
                this.pos_rect = {5, 250000 / speed, 0, 3500, 219, 500}
                this.clock:restart()
                this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
            end
            if this.status ~= "death" and this.status ~= "respawn" then
                this.move(-speed, 0)
                this.status_horizontal = "left"
            end
        elseif keyboard.keyPressed(controls.getControl("move_right")) and this.getHealth() > 0 then
            if (this.status ~= "right") then
                this.status = "right"
                this.pos_rect = {15, 250000 / speed, 0, 0, 220, 500}
                this.clock:restart()
                this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
            end
            if this.status ~= "death" and this.status ~= "respawn" then
                this.status_horizontal = "right"
                this.move(speed, 0)
            end
        elseif keyboard.keyPressed(controls.getControl("move_left")) and this.getHealth() > 0 then
            if (this.status ~= "left") then
                this.status = "left"
                this.pos_rect = {15, 250000 / speed, 0, 500, 220, 500}
                this.clock:restart()
                this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
            end
            if this.status ~= "death" and this.status ~= "respawn" then
                this.status_horizontal = "left"
                this.move(-speed, 0)
            end
        else
            this.status_horizontal = "none"
        end
        if (this.status == "left" or this.status == "run_left") and not keyboard.keyPressed(controls.getControl("move_left")) and this.getHealth() > 0 then
            this.status = "idle"
            this.status_idle = "down"
            if this.status_idle == "down" then
                this.pos_rect = {4, 150000, 0, 2000, 220, 500}
            else
                this.pos_rect = {4, 150000, 0, 3992, 220, 500}
            end
            this.clock:restart()
            this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
        end
        if (this.status == "right" or this.status == "run_right") and not keyboard.keyPressed(controls.getControl("move_right")) and this.getHealth() > 0 then
            this.status = "idle"
            this.status_idle = "down"
            if this.status_idle == "down" then
                this.pos_rect = {4, 150000, 0, 2000, 220, 500}
            else
                this.pos_rect = {4, 150000, 0, 3992, 220, 500}
            end
            this.clock:restart()
            this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
        end
        if this.status_horizontal == "none" and this.status_vertical == "none" and this.getHealth() > 0 then
            if this.status ~= "idle" then
                if (this.status == "up") then
                    this.status_idle = "up"
                else
                    this.status_idle = "down"
                end
                this.status = "idle"
                if this.status_idle == "down" then
                    this.pos_rect = {4, 150000, 0, 2000, 220, 500}
                else
                    this.pos_rect = {4, 150000, 0, 3992, 220, 500}
                end
                this.clock:restart()
                this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
            end
        end
        this.is_sprinting = keyboard.keyPressed(controls.getControl("sprint")) and this.getHealth() > 0 and this.stamina > 0
    end

    function draw()
        super.draw()
        time = this.pos_rect[2]

        if this.is_sprinting == true and this.status ~= "idle" then
            time = time * 1.25
        end
        if this.clock:getEllapsedTime() > time * DeltaTime then
            if this.status ~= "respawn" then
                this.pos_rect[3] = this.pos_rect[3] + this.pos_rect[5]
                if this.pos_rect[3] > this.pos_rect[5] * (this.pos_rect[1] - 1) and  this.status ~= "death" then
                    this.pos_rect[3] = 0
                end
            elseif this.status == "respawn" then
                this.pos_rect[3] = this.pos_rect[3] - this.pos_rect[5]
                if this.pos_rect[3] < 0 then
                    this.status = "idle"
                    this.status_idle = "down"
                    this.pos_rect = {4, 150000, 0, 2000, 220, 500}
                end
            end
            this.sprite:setTextureRect(table.unpack(this.pos_rect, 3))
            this.clock:restart()
        end
        window:draw(this.sprite)
        this.drawHitbox()
    end
}]