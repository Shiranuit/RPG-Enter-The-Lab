Class "EntityLaser" extends "Entity" [{
    function __EntityLaser(x, y, dir, damage, speed, mob, scale_x, scale_y)
        check(x, "number", 1)
        check(y, "number", 2)
        check(dir, "Vector2D", 3)
        check(damage, "number", 4)
        check(speed, "number", 5)
        scale_x = scale_x or 3
        scale_y = scale_y or 3
        check(scale_x, "number", 6)
        check(scale_y, "number", 7)

        super(x, y)
        this.angle = -math.deg(math.atan2(0, 1) - math.atan2(dir.y, dir.x))
        this.sprite = lsfml.sprite.create()
        this.sprite:setTexture(assets["laser_projectile"], false)
        this.sprite:setPosition(x, y)
        this.sprite:scale(scale_x, scale_y)
        this.sprite:setOrigin(0, 0)
        this.sprite:setRotation(this.angle)
        this.dir = dir:normalize()
        this.damage = damage
        this.mob = mob
        this.speed = speed
        this.hit = {}
        local box = new(Hitbox("projectile"))
        box.setPoints({{0, 0}, {30, 0}, {30, 8}, {0, 8}})
        box.setOrigin(0, 0)
        box.setPosition(super.getPosition())
        box.setRotation(this.angle)
        box.scale(scale_x, scale_y)
        super.addHitbox(box)
    end

    function draw()
        super.draw()
        window:draw(this.sprite)
        super.drawHitbox()
    end

    function move(x, y)
        super.move(x, y)
        this.sprite:move(x, y)
    end

    function update()
        super.update()
        this.move(this.dir.x * this.speed * DeltaTime, this.dir.y * this.speed * DeltaTime)
        local nx, ny = super.getPosition()
        if nx < 0 or nx > 1920 or ny < 0 or ny > 1920 then
            world.removeEntityByUUID(super.getUUID())
            return
        end
        local entities = world.getEntitiesInHitbox(super.getHitboxs()[1], "player")
        for i=1, #entities do
            if class.isInstanceOf(entities[i], "EntityLiving") and not this.hit[entities[i].getUUID()] then
                entities[i].hit(this.damage, this.mob)
                this.hit[entities[i].getUUID()] = true
            end
        end
    end
}]