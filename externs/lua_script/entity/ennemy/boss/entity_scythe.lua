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
        initHitboxes()
    end

    function hit(damage)
        if super.isAlive() then
            super.hit(damage)
            if super.isDead() then
                local equipmentItems = {}
                for k, v in pairs(items) do
                    if v:getUserdate().type == "equipment" then
                        equipmentItems[#equipmentItems + 1] = v
                    end
                end
                for i=1, math.random(1, 4) do
                    local item = equipmentItems[math.random(1, #equipmentItems)]
                    item:getUserdata().defense = math.random(1, 20)
                    item:getUserdata().rarity = rarity[math.floor(item:getUserdata().defense / 5)]
                    world.spawnEntity(new(EntityItem(itemstack.create(item, 1))))
                end
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

    function update()
        super.update()
        local angle = super.getRotation()
        super.setRotation(angle + 1)
        this.sprite:setRotation(angle + 1)
        local hit = super.getHitboxs()
        for i=1, #hit do
            local success, dist, axis = hitbox.SAT(hit[i], player.getHitboxs()[1])
            if success then
                local pos = axis * dist
                player.move(pos.x, pos.y)
            end
        end
    end

    function event(e)

    end

}]