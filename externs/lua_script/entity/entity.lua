Class "Entity" [[
    function Entity(x, y)
        this.x = x
        this.y = y
        this.uuid = uuid.randomUUID()
    end

    function getPosition()
        return this.x, this.y
    end

    function setPosition(x, y)
        check(x, "number", 1)
        check(y, "number", 2)

        this.x = x
        this.y = y
    end

    function getUUID()
        return this.uuid
    end

    function draw()

    end

    function update()

    end

    function event()

    end
]]