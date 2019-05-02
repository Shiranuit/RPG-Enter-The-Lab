Class "EntityScytheBoss" extends "EntityLiving" [{

    local function initHitboxes()
        local box = new(Hitbox("soft", {takeDamage=true, doDamage=true}))
        box.setPoints({{73, 130}, {164, 52}, {272, 15}, {377, 4}, {537, 22}, {657, 75}, {666, 172}, {632, 196}})
        box.setScale(0.5, 0.5)
        box.setOrigin(264, 565)
        box.setPosition(super.getPosition())
        super.addHitbox(box)
        local box2 = new(Hitbox("soft", {takeDamage=true}))
        box2.setPoints({{14, 337}, {85, 271}, {445, 280}, {514, 344}, {530, 443}, {264, 609}, {4, 430}})
        box2.setScale(0.5, 0.5)
        box2.setOrigin(264, 565)
        box2.setPosition(super.getPosition())
        super.addHitbox(box2)
    end

    function __EntityScytheBoss(x, y)
        super(x, y)
        super.setMaximumHealth(1000)
        super.setHealth(1000)
        this.sprite = lsfml.sprite.create()
        this.sprite:setPosition(x, y)
        this.sprite:setTexture(assets["scythe"], false)
        this.sprite:setOrigin(264, 565)
        this.sprite:scale(0.5, 0.5)
        this.attack = "idle"
        this.hit_entity = false
        this.revert = false
        this.dir = 0
        initHitboxes()
    end

    function hit(damage)
        if super.isAlive() then
            super.hit(damage)
            if super.isDead() then
                local equipmentItems = {}
                for k, v in pairs(items) do
                    if v:getUserdata().type == "equipement" then
                        equipmentItems[#equipmentItems + 1] = v
                    end
                end
                for i=1, math.random(1, 4) do
                    local item = equipmentItems[math.random(1, #equipmentItems)]
                    item:getUserdata().defense = math.random(1, 20)
                    item:getUserdata().rarity = rarity[math.floor(item:getUserdata().defense / 5)]
                    world.spawnEntity(new(EntityItem(itemstack.create(item, 1)))).setPosition(super.getPosition())
                end
                -- world.spawnEntity(new(EntityItem(itemstack.create(items["scythe"], 1)))).setPosition(super.getPosition())
                world.removeEntityByUUID(this.getUUID())
            end
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
        window:draw(this.sprite)
        super.drawHitbox()
    end

    function slash()
        if this.dir == 0 then
            local nx, ny = player.getPosition()
            local px, py = super.getPosition()
            this.dir = nx - px > 0 and 1 or -1
        end
        if this.dir == -1 then
            this.sprite:setScale(-0.5, 0.5)
            super.setScale(-0.5, 0.5)
        else
            this.sprite:setScale(0.5, 0.5)
            super.setScale(0.5, 0.5)
        end
        local angle = super.getRotation()
        if angle % 360 == 180 then
            this.revert = true
        elseif angle % 360 == 0 then
            if this.revert == true then
                this.attack = "idle"
                super.setRotation(0)
                this.sprite:setRotation(0)
                this.revert = false
                this.hit_entity = false
                this.dir = 0
                return
            end
        end
        local step = this.dir == 1 and 10 or -10
        if this.revert then
            step = -step
        end
        super.setRotation(angle + step)
        this.sprite:setRotation(angle + step)
        local hit = super.getHitboxs()
        for i=1, #hit do
            local success, dist, axis = hitbox.SAT(hit[i], player.getHitboxs()[1])
            if success then
                local pos = axis * dist
                player.move(pos.x, pos.y)
                if not this.hit_entity then
                    player.hit(20 * DeltaTime)
                    this.hit_entity = true
                end
                return
            end
        end
    end


    function slash_entity()
        if this.dir == 0 then
            local nx, ny = player.getPosition()
            local px, py = super.getPosition()
            this.dir = nx - px > 0 and 1 or -1
        end
        if this.dir == -1 then
            this.sprite:setScale(-0.5, 0.5)
            super.setScale(-0.5, 0.5)
        else
            this.sprite:setScale(0.5, 0.5)
            super.setScale(0.5, 0.5)
        end
        local angle = super.getRotation()
        if angle % 360 == 180 then
            this.revert = true
        elseif angle % 360 == 0 then
            if this.revert == true then
                this.attack = "idle"
                super.setRotation(0)
                this.sprite:setRotation(0)
                this.revert = false
                this.hit_entity = false
                this.dir = 0
                return
            end
        elseif angle % 360 == 90 or angle % 360 == 270 then
            if not this.revert then
                local matrix = super.getHitboxs()[1].getTransform()
                local px, py = matrix(392, 0)
                local pos1 = vector.new(px, py)
                local pos2 = vector.new(player.getPosition())
                local dir = pos2 - pos1
                world.spawnEntity(new(EntitySlash(px, py, dir, 20, 20)))
            end
        end
        local step = this.dir == 1 and 10 or -10
        if this.revert then
            step = -step
        end
        super.setRotation(angle + step)
        this.sprite:setRotation(angle + step)
        local hit = super.getHitboxs()
        for i=1, #hit do
            local success, dist, axis = hitbox.SAT(hit[i], player.getHitboxs()[1])
            if success then
                local pos = axis * dist
                player.move(pos.x, pos.y)
                if not this.hit_entity then
                    player.hit(20 * DeltaTime)
                    this.hit_entity = true
                end
                return
            end
        end
    end
    function update()
        super.update()
        if super.isAlive() then
            if this.attack == "slash" then
                slash()
            elseif this.attack == "slash_entity" then
                slash_entity()
            end
        end
    end

    function event(e)
        local event = e:getEvent()
        if event[1] == "key_pressed" and event[2] == keys.L then
            this.attack = "slash_entity"
        end
    end

}]