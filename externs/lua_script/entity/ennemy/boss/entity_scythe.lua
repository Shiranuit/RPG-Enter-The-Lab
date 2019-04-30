Class "EntityScytheBoss" extends "EntityLiving" [{
    function __EntityScytheBoss(x, y)
        super(x, y)
        super.setMaximumHealth(1000)
        super.setHealth(1000)
        this.sprite = lsfml.sprite.create()
        this.sprite:setPosition(x, y)
        this.sprite:setTexture(assets["scythe"], false)
        this.sprite:setOrigin(264, 565)
        this.sprite:scale(0.5, 0.5)
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
    end

    function update()
        local success, mvx, mvy = super.compute_push()
        if success then
            this.move(mvx, mvy)
        end
    end

    function event(e)

    end

}]