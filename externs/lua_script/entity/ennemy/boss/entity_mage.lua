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
        this.scale = 1
        this.phase = 1
        this.action = {act = "none"}
        super.setType("ennemy")
    end

    function look(px, py)
        check(px, "number", 1)
        check(py, "number", 2)

        local nx, ny = super.getPosition()
        local dir = vector.new(nx - px, ny - py):normalize()
        local angle = math.deg(math.atan2(0, 1) - math.atan2(dir.y, dir.x))
        if angle > -45 and angle < 45 then
            this.sprite:changeRect({0, 445, 96, 180})
        elseif angle > 45 and angle < 135 then
            this.sprite:changeRect({0, 222, 96, 180})
        elseif angle % 360 > 135 and angle % 360 < 225 then
            this.sprite:changeRect({0, 666, 96, 180})
        elseif angle % 360 > 225 and angle % 360 < 315 then
            this.sprite:changeRect({0, 0, 96, 180})
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
            if super.isDead() then
                -- for i=1, math.random(1, 4) do
                --     world.spawnEntity(new(EntityItem(itemstack.generateEquipment()))).setPosition(super.getPosition())
                -- end
                -- world.spawnEntity(new(EntityItem(itemstack.create(items["scythe"], 1)))).setPosition(super.getPosition())
                world.removeEntityByUUID(this.getUUID())
            end
        end
    end

    function teleport(x, y)
        check(x, "number", 1)
        check(y, "number", 2)

        if this.action.act == "none" then
            this.action.act = "teleport"
            this.action.tp_x = x
            this.action.tp_y = y
            this.action.tp_revert = false
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

    function blackHole()
        this.action.act = "teleport"
        this.action.tp_x = 1920 / 2
        this.action.tp_y = 1080 / 2
        this.action.blackhole = true
    end

    local function doTeleport()
        if this.action.act == "teleport" then
            if not this.action.tp_revert then
                this.scale = math.max(this.scale - 0.1, 0)
            else
                this.scale = math.min(this.scale + 0.1, 1)
            end
            this.sprite:setScale(this.scale, 1)
            if this.scale <= 0 and not this.action.tp_revert then
                this.setPosition(this.action.tp_x, this.action.tp_y)
                this.action.tp_revert = true
            elseif this.action.tp_revert and this.scale >= 1 then
                this.action.act = "none"
                this.action.tp_revert = false
            end
        end
    end

    local function doBlackHole()
        if this.action.blackhole then
            if this.action.act == "none" then
                this.action.act = "blackhole"
                this.action.blackhole_entity = world.spawnEntity(new(EntityBlackHole(20, 15, final)))
            end
            if this.action.act == "blackhole" then
                if this.action.blackhole_entity.asExpired() then
                    this.action.act = "none"
                    this.action.blackhole = false
                end
            end
        end
    end

    function update()
        super.update()
        this.look(player.getPosition())
        doTeleport()
        doBlackHole()
        -- teleport(math.random(200, 1800), math.random(200, 800))
    end

    function event(e)
        local event = e:getEvent()
        if event[1] == "key_pressed" and event[2] == keys.L then
            this.blackHole()
        end
    end
}]