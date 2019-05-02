Class "EntityRobot1" extends "EntityLiving" [{

    local function initHitboxes()
        local box = new(Hitbox("soft", {takeDamage=true, doDamage=true}))
        box.setPoints({{0, 0}, {540, 0}, {540, 460}, {0, 460}})
        box.setScale(0.25, 0.25)
        box.setOrigin(231, 270)
        box.setPosition(super.getPosition())
        super.addHitbox(box)
    end

    function __EntityRobot1(x, y)
        super(x, y)
        super.setMaximumHealth(100)
        super.setHealth(100)
        this.sprite = animation.create(assets["robot1"], {0, 0, 540, 462})
        this.sprite:setPosition(x, y)
        this.sprite:setOrigin(231, 270)
        this.sprite:scale(0.25, 0.25)
        this.clock = lsfml.clock.create()
        this.status = "right"
        this.speed = 2
        this.max_distance = 300
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
        if this.clock:getEllapsedTime() > 100000 then
            this.clock:restart()
            this.sprite:next()
            if this.sprite:getAnimationFrame() == 4 then
                this.sprite:restart()
            end
        end
        this.sprite:draw()
        super.drawHitbox()
    end

    function update()
        local x, y = player.getPosition()
        local sprite_x, sprite_y = this.sprite:getPosition()
        local dir_x, dir_y
        local hitbox = super.getHitboxs()

        dir_x = x - sprite_x
        dir_y = y - sprite_y
        if math.abs(dir_x) > math.abs(dir_y) then
            if dir_x > 0 and this.status ~= "right" then
                this.status = "right"
                this.sprite:changeRect({0, 0, 540, 462})
                this.sprite:setOrigin(231, 270)
                hitbox[1].setScale(0.25, 0.25)
                hitbox[1].setOrigin(231, 270)
            elseif dir_x < 0 and this.status ~= "left" then
                this.status = "left"
                this.sprite:changeRect({0, 462, 540, 462})
                this.sprite:setOrigin(231, 270)
                hitbox[1].setScale(0.25, 0.25)
                hitbox[1].setOrigin(231, 270)
            end
        else
            if dir_y > 0 and this.status ~= "down" then
                this.status = "down"
                this.sprite:changeRect({0, 1460, 341, 540})
                this.sprite:setOrigin(170, 270)
                hitbox[1].setScale(0.17, 0.30)
                hitbox[1].setOrigin(270, 230)
            elseif dir_y < 0 and this.status ~= "up" then
                this.status = "up"
                this.sprite:changeRect({0, 920, 341, 540})
                this.sprite:setOrigin(170, 270)
                hitbox[1].setScale(0.17, 0.30)
                hitbox[1].setOrigin(270, 230)
            end
        end
        local total = math.abs(dir_x) + math.abs(dir_y)
        if total > this.max_distance then
            move((dir_x / total) * this.speed, (dir_y / total) * this.speed)
        elseif (total < this.max_distance - this.speed) then
            move((-dir_x / total) * this.speed, (-dir_y / total) * this.speed)
        end
    end 

    function event(e)

    end

}]