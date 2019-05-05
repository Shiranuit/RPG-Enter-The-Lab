Class "EntityMageBoss" extends "EntityLiving" [{

    local function initHitboxes()
        local box = new(Hitbox("enemy"))
        box.setPoints({{0, 0}, {96, 0}, {96, 180}, {0, 180}})
        box.setPosition(super.getPosition())
        box.setOrigin(45, 192)
        super.addHitbox(box)
    end

    function __EntityMageBoss(x, y)
        super(x, y)
        initHitboxes()
        super.setMaximumHealth(10000)
        super.setHealth(10000)
        this.sprite = animation.create(assets["mage"], {0, 0, 96, 180})
        this.sprite:setOrigin(45, 192)
        this.sprite:setPosition(x, y)
        this.anim = stopwatch.create()
        this.phase = 1
    end

    function look(px, py)
        check(px, "number", 1)
        check(py, "number", 2)

        local nx, ny = super.getPosition()
        local dir = vector.new(nx - px, ny - py):normalize()
        local angle = -math.deg(math.atan2(0, 1) - math.atan2(dir.y, dir.x))
        if dir.x >= 0 and dir.y <= 1 and dir.y >= -1 then
            this.sprite:changeRect({0, 445, 96, 180})
        elseif dir.x < 0 and dir.y <= 1 and dir.y >= -1 then
            this.sprite:changeRect({0, 666, 96, 180})
        elseif dir.y >= 0 and dir.x < 1 and dir.x > -1 then
            this.sprite:changeRect({0, 0, 96, 180})
        elseif dir.x < 0 and dir.y < 1 and dir.x > -1 then
            this.sprite:changeRect({0, 222, 96, 180})
        end
    end


    function hit(damage, source)
        if super.isAlive() then
            super.hit(damage, source)
            local mx = this.getMaximumHealth()

            if this.getHealth() < mx * 0.15 and this.phase < 5 then
                this.phase = 5
                bosshealth:setPhase(this.phase)
            elseif this.getHealth() < mx * 0.33 and this.phase < 4 then
                this.phase = 4
                bosshealth:setPhase(this.phase)
            elseif this.getHealth() < mx * 0.50 and this.phase < 3 then
                this.phase = 3
                bosshealth:setPhase(this.phase)
            elseif this.getHealth() < mx * 0.75 and this.phase < 2 then
                this.phase = 2
                bosshealth:setPhase(this.phase)
            end
            -- if super.isDead() then
            --     for i=1, math.random(1, 4) do
            --         world.spawnEntity(new(EntityItem(itemstack.generateEquipment()))).setPosition(super.getPosition())
            --     end
            --     world.spawnEntity(new(EntityItem(itemstack.create(items["scythe"], 1)))).setPosition(super.getPosition())
            --     world.removeEntityByUUID(this.getUUID())
            -- end
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

    function draw()
        if this.isAlive() then
            if this.sprite:hasEnded() then
                this.sprite:restart()
            end
            this.sprite:draw()
            if this.anim:getEllapsedTime() > 100000 then
                this.sprite:next()
                this.anim:restart()
            end
            super.drawHitbox()
        end
    end

    function update()
        super.update()
        this.look(player.getPosition())
    end

    function event(e)

    end
}]