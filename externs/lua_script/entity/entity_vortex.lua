Class "EntityVortex" extends "Entity" [{
    function __EntityVortex(x, y, dir, damage, speed, func)
        check(x, "number", 1)
        check(y, "number", 2)
        check(dir, "Vector2D", 3)
        check(damage, "number", 4)
        check(speed, "number", 5)
        check(func, "function", 5)

        super(x, y)
        this.angle = 0
        this.count = 0
        this.sprite = lsfml.sprite.create()
        this.sprite:setTexture(assets["vortex"], false)
        this.sprite:setPosition(x, y)
        this.sprite:scale(0.25, 0.25)
        this.sprite:setOrigin(194, 202)
        this.dir = dir:normalize()
        this.damage = damage
        this.speed = speed
        this.hit = false
        this.before = 0
        this.func = func
        local box = new(Hitbox("soft"))
        box.setPoints({{0, 0}, {386, 0}, {386, 393}, {0, 393}})
        box.setOrigin(194, 202)
        box.setPosition(super.getPosition())
        box.setRotation(this.angle)
        box.setScale(0.25, 0.25)
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
        this.count = this.count + 1
        this.angle = this.angle + 1
        this.sprite:setRotation(this.angle)
        local amount = this.func(this.count) - this.before
        this.before = amount
        local perp = this.dir:perp()
        this.move((this.dir.x + perp.x * amount) * this.speed * DeltaTime, (this.dir.y + perp.y * amount) * this.speed * DeltaTime)
        local nx, ny = super.getPosition()
        if nx < 0 or nx > 1920 or ny < 0 or ny > 1920 then
            world.removeEntityByUUID(super.getUUID())
            return
        end
        if not this.hit then
            if hitbox.rectIntersect(super.getHitboxs()[1].getBoundingBox(), player.getHitboxs()[1].getBoundingBox()) then
                player.hit(this.damage)
                this.hit = true
            end
        end
    end
}]