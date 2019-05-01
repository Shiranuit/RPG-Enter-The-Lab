Class "EntityProps" extends "Entity" [{

    function __EntityProps(x, y)
        super(x, y)
        this.exist = true
    end

    function move(x, y)
        check(x ,"number", 1)
        check(y ,"number", 2)

        local nx, ny = super.getPosition()
        local success1, point1 = hitbox.rayhit(nx, ny, x * 2, y * 2, "hard")
        if not success1 then
            super.move(x, y)
            return true, x, y
        end
        local dir = new(Vector2D(x, y))
        dir = dir.normalize()
        local px, py = (point1[1] - dir.x) - nx, (point1[2] - dir.y) - ny
        super.move(px, py)
        return true, px, py
    end

    function isExist()
        return this.exist
    end

    function kill()
        this.exist = false
    end

    function respawn()
        this.alive = true
        this.health = this.max_health
    end

    function draw()
        if this.exist then
            window:draw(this.sprite)
        end
    end


    function update()

    end
}]