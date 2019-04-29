-- =========================================
-- =              ENTITY ITEM              =
-- =========================================

Class "EntityItem" extends "Entity" [{
    function __EntityItem(itemstack)
        check(itemstack, "itemstack", 1)
        super(0, 0)

        this.sprite = lsfml.sprite.create()
        this.sprite:setPosition(0, 0)
        this.sprite:setTexture(itemstack:getItem():getTexture(), false)
        this.sprite:scale(1, 1)
        this.sprite:setOrigin(32, 32)
        this.itemstack = itemstack
        this.anim = 0
        this.status = "up"
    end

    function setPosition(x, y)

        this.sprite:setPosition(x, y)
        super.setPosition(x, y)
    end

    function getItemStack()
        return this.itemstack
    end

    function setItemStack(itemstack)
        check(itemstack, "itemstack", 2)

        this.itemstack = itemstack
        this.sprite:setTexture(itemstack:getItem():getTexture(), false)
    end

    function draw()
        window:draw(this.sprite)
    end

    function update()
        if this.status == "up" then
            this.anim = this.anim + math.floor(DeltaTime)
            if this.anim > 40 then
                this.status = "down"
            end
        elseif this.status == "down" then
            this.anim = this.anim - math.floor(DeltaTime)
            if this.anim < 0 then
                this.status = "up"
            end
        end
        local x, y = super.getPosition()
        this.sprite:setPosition(x, y - this.anim)
    end
}]