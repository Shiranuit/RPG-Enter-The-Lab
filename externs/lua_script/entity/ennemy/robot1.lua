Class "EntityRobot1" extends "EntityLiving" [{

    local function initHitboxes()
        local box = new(Hitbox("soft", {takeDamage=true, doDamage=true}))
        box.setPoints({{0, 0}, {540, 0}, {540, 460}, {0, 460}})
        box.setScale(0.25, 0.25)
        box.setOrigin(270, 462)
        box.setPosition(super.getPosition())
        super.addHitbox(box)
    end

    function __EntityRobot1(x, y)
        super(x, y)
        super.setMaximumHealth(100)
        super.setHealth(100)
        this.sprite = animation.create(assets["robot1"], {0, 0, 540, 462})
        this.sprite:setPosition(x, y)
        this.sprite:setOrigin(270, 462)
        this.sprite:scale(0.25, 0.25)

        this.attack = animation.create(assets["laser"], {0, 0, 45, 19})
        this.attack:setPosition(800, 800)
        this.attack:setOrigin(0, 0)
        this.attack:scale(5, 5)

        this.clock = lsfml.clock.create()
        this.clock_attack = lsfml.clock.create()
        this.status = "right"
        this.speed = 2
        this.max_distance = 300
        this.last_animation = false
        this.is_attack = false
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
        end
    end

    function draw()
        if super.isAlive() then
            if this.clock:getEllapsedTime() > 100000 then
                this.clock:restart()
                this.sprite:next()
                if this.sprite:getAnimationFrame() == 4 then
                    this.sprite:restart()
                end
            end
            this.sprite:draw()
            super.drawHitbox()

            if this.is_attack then
                if this.clock_attack:getEllapsedTime() > 100000 then
                    this.clock_attack:restart()
                    this.attack:next()
                    if this.attack:hasEnded() then
                        this.attack:restart()
                        this.is_attack = false
                    end
                end
                this.attack:draw()
            end

        elseif not this.last_animation then
            this.sprite:changeRect({0, 2000, 455, 455})
            this.last_animation = true
            this.clock:restart()
        end
        if this.last_animation then
            if this.clock:getEllapsedTime() > 100000 then
                this.clock:restart()
                this.sprite:next()
                if this.sprite:hasEnded() then
                    world.spawnEntity(new(EntityItem(itemstack.create(items.metal_scrap, 5)))).setPosition(super.getPosition())
                    world.removeEntityByUUID(this.getUUID())
                end
            end
            this.sprite:draw()
            super.drawHitbox()
        end
    end

    function update()
        local x, y = player.getPosition()
        local sprite_x, sprite_y = super.getPosition()
        local dir_x, dir_y
        local hitbox = super.getHitboxs()

        if this.is_attack then
            return
        end
        sprite_y = sprite_y
        dir_x = x - sprite_x
        dir_y = y - sprite_y
        if math.abs(dir_x) > math.abs(dir_y) then
            if dir_x > 0 and this.status ~= "right" then
                this.status = "right"
                this.sprite:changeRect({0, 0, 540, 462})
                this.sprite:setOrigin(270, 462)
                hitbox[1].setScale(0.25, 0.25)
                hitbox[1].setOrigin(270, 462)
            elseif dir_x < 0 and this.status ~= "left" then
                this.status = "left"
                this.sprite:changeRect({0, 462, 540, 462})
                this.sprite:setOrigin(270, 462)
                hitbox[1].setScale(0.25, 0.25)
                hitbox[1].setOrigin(270, 462)
            end
        else
            if dir_y > 0 and this.status ~= "down" then
                this.status = "down"
                this.sprite:changeRect({0, 1460, 341, 540})
                this.sprite:setOrigin(170, 540)
                hitbox[1].setScale(0.17, 0.30)
                hitbox[1].setOrigin(270, 440)
            elseif dir_y < 0 and this.status ~= "up" then
                this.status = "up"
                this.sprite:changeRect({0, 920, 341, 540})
                this.sprite:setOrigin(170, 540)
                hitbox[1].setScale(0.17, 0.30)
                hitbox[1].setOrigin(270, 440)
            end
        end
        local total = math.abs(dir_x) + math.abs(dir_y)
        if total > this.max_distance then
            move((dir_x / total) * this.speed, (dir_y / total) * this.speed)
        elseif (total < this.max_distance - this.speed) then
            move((-dir_x / total) * this.speed, (-dir_y / total) * this.speed)
        elseif not this.is_attack then
            this.clock_attack:restart()
            --this.is_attack = true
        end
    end 

    function event(e)

    end

}]