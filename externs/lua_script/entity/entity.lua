Class "Entity" [{
    function __Entity(x, y)
        this.x = x
        this.y = y
        this.uuid = uuid.randomUUID()
        this.hitbox = new(Hitbox("soft"))
        this.hitbox.setPosition(x, y)
    end

    function getPosition()
        return this.x, this.y
    end

    function setPosition(x, y)
        check(x, "number", 1)
        check(y, "number", 2)

        this.x = x
        this.y = y
        this.hitbox.setPosition(this.x, this.y)
    end

    function move(x, y)
        check(x, "number", 1)
        check(y, "number", 2)

        this.x = this.x + x
        this.y = this.y + y
        this.hitbox.setPosition(this.x, this.y)
    end

    function getUUID()
        return this.uuid
    end

    function drawHitbox()
        this.hitbox.draw()
    end

    function draw()

    end

    function update()

    end

    function event()

    end

    function getHitbox()
        return this.hitbox
    end
}]