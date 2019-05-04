Class "EntityPnj" extends "EntityLiving" [{

    local function initHitboxes(x_or, y_or, pts, scx)
        local box = new(Hitbox("soft", {takeDamage=false, doDamage=false}))
        box.setPoints(pts)
        box.setScale(scx, scx)
        box.setOrigin(x_or, y_or)
        box.setPosition(super.getPosition())
        super.addHitbox(box)
        hitbox.add(box)
    end

    function __EntityPnj(name, x, y, sprite, x_or, y_or, pts, scx, animX, animY)
        this.stopwatch = stopwatch.create()
        super(x, y)
        this.exist = true
        this.scale = scx
        this.isIn = false
        this.name = name
        this.sprite = animation.create(sprite, {0, 0 , animX, animY})
        this.dial_open = false
        this.sprite:setPosition(x, y)
        this.sprite:setOrigin(x_or, y_or)
        this.sprite:scale(scx, scx)
        initHitboxes(x_or, y_or, pts, scx)
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

    function draw()
        if this.exist then
            if stopwatch:getEllapsedTime() > 250000 then
                if this.sprite:hasEnded() then
                    this.sprite:restart()
                end
                stopwatch:restart()
                this.sprite:next()
            end
            this.sprite:draw()
            super.drawHitbox()
        end
    end


    function update()
        local x, y = player.getPosition()
        local nx, ny = super.getPosition()
        if math.abs(x - nx) + math.abs(y - ny) < 100 then
            if not this.isIn then
                this.isIn = true
                player_hud:showInteractTouch(true)
                player_hud:setInteractTouchPosition(nx - 220 * this.scale / 2, ny - 560 * this.scale - 54)
            end
        elseif this.isIn then
            this.isIn = false
            player_hud:showInteractTouch(false)
        else
            dialogue_hud:close()
            dialogue_hud:restart_dialogue()
            dialogue_hud:next()
            this.dial_open = false
        end
    end

    function dialogue_png_homme(event, x, y, nx, ny)
        if event[1] == "key_pressed" and event[2] == controls.getControl("action") and this.dial_open then
            dialogue_hud:next()
        end
        if event[1] == "key_pressed" and event[2] == controls.getControl("action") and not this.dial_open then
            dialogue_hud:open()
            this.dial_open = true
        end
        if event[1] == "key_pressed" and event[2] == controls.getControl("skip_all") and this.dial_open then
            dialogue_hud:close()
            dialogue_hud:restart_dialogue()
            dialogue_hud:next()
            this.dial_open = false
        end
    end

    function event(e)
        local event = e:getEvent()
        local x, y = player.getPosition()
        local nx, ny = super.getPosition()

        dialogue_hud:set_Position(nx / 1.2, ny / 3.4)
        if math.abs(x - nx) + math.abs(y - ny) < 100 then
            if this.name == "homme" then
                dialogue_png_homme(event, x, y, nx, ny)
            end
            if this.name == "robot" then
            end
        end
    end
}]