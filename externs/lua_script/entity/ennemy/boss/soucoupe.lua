Class "EntitySoucoupe" extends "EntityLiving" [{

    local function initHitboxes()
        local box = new(Hitbox("enemy", {takeDamage=true, doDamage=true}))
        box.setPoints({{126, 0}, {251, 50}, {126, 88}, {2, 50}})
        box.setScale(2, 2)
        box.setOrigin(124, 86)
        box.setPosition(super.getPosition())
        super.addHitbox(box)
    end

    function __EntitySoucoupe(x, y)
        super(x, y)
        super.setHealthBarVisible(true)
        super.setHealthBarOffset(0, -86 * 2)
        super.setMaximumHealth(1000)
        super.setHealth(1000)
        this.sprite = animation.create(assets["soucoupe"], {0, 0, 249, 86})
        this.sprite:setPosition(x, y)
        this.sprite:setOrigin(124, 86)
        this.sprite:scale(2, 2)

        this.box_verify = new(Hitbox("soft", {takeDamage=false, doDamage=true}))
        this.box_verify.setPoints({{91, 77}, {167, 77}, {167, 121}, {91, 121}})
        this.box_verify.setScale(2, 2)
        this.box_verify.setOrigin(124, 86)
        this.box_verify.setPosition(super.getPosition())

        this.clock = stopwatch.create()
        this.clock_move = stopwatch.create()
        this.speed = 35
        this.move_x = 0
        this.move_y = 0
        this.dir_x = 0
        this.dir_y = 0
        this.time = 2000000
        initHitboxes()
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
            this.box_verify.move(x, y)
        end
    end

    function laser(x, y)
        local px, py = super.getPosition()
        py = py - 86
        local pos2 = vector.new(x, y)
        world.spawnEntity(new(EntityLaser(px, py, pos2, 5, 20, final)))
    end

    function draw()
        if super.isAlive() then
            if this.clock:getEllapsedTime() > 100000 then
                this.clock:restart()
                this.sprite:next()
                if this.sprite:hasEnded() then
                    this.sprite:restart()
                end
            end
            this.sprite:draw()
            super.drawHitbox()
            super.drawHealth()
        else
            world.spawnEntity(new(EntityItem(itemstack.create(items.metal_scrap, 5)))).setPosition(super.getPosition())
            world.removeEntityByUUID(this.getUUID())
        end
    end

    function update()
        local x_player, y_player = player.getPosition()
        local sprite_x, sprite_y = super.getPosition()

        if super.getHealth() > 33.3 and super.getHealth() < 66.6 then
            this.sprite:changeRect({0, 86, 249, 86})
            this.time = 1500000
        elseif super.getHealth() < 33.3 then
            this.time = 1000000
            this.sprite:changeRect({0, 172, 249, 86})
        end

        if (this.move_x > sprite_x -  this.speed and this.move_x < sprite_x + this.speed and this.move_y > sprite_y -  this.speed and this.move_y < sprite_y +  this.speed) or (this.move_x == 0 and this.move_y == 0) then
            if (this.dir_x ~= 0 and this.dir_y ~= 0) then
                this.dir_x = 0
                this.dir_y = 0
                this.clock_move:restart()
                if math.random(1, 5) == 3 then
                    this.box_verify.recompute()
                    local entities = world.getEntitiesInHitbox(this.box_verify, "enemy")
                    if #entities < 2 then
                        world.spawnEntity(new(EntityTurret(sprite_x, sprite_y + 100)))
                    end
                else
                    for angle = 1, 360, 10 do
                        if not(angle > 30 and angle < 60) and not(angle > 120 and angle < 150) and not(angle > 210 and angle < 240) and not(angle > 320 and angle < 350) then
                            laser(math.cos(math.rad(angle)), math.sin(math.rad(angle)))
                        end
                    end
                end
            end
            if (this.clock_move:getEllapsedTime() > this.time) then
                local res_x, res_y = soucoupe_func[math.random(1, #soucoupe_func)]()
                while this.move_x == res_x and res_y == this.move_y do
                    res_x, res_y = soucoupe_func[math.random(1, #soucoupe_func)]()
                end
                this.move_x = res_x
                this.move_y = res_y
                this.dir_x = this.move_x - sprite_x
                this.dir_y = this.move_y - sprite_y
                local total = math.abs(this.dir_x) + math.abs(this.dir_y)
                this.dir_x = (this.dir_x / total) * this.speed
                this.dir_y = (this.dir_y / total) * this.speed
            end
        end
        move(this.dir_x, this.dir_y)
    end

    function event(e)

    end

}]