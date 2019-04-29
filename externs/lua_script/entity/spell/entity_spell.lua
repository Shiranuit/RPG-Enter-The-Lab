-- =========================================
-- =             ENTITY SPELL              =
-- =========================================

Class "EntitySpell" extends "Entity" [{
    function EntitySpell(info)
        check(info, "table", 1)

        super(info.pos_x or 0, info.pos_y or 0)

        this.sprite = animation.create(info.spell, info.rect)
        this.sprite:setPosition(info.pos_x or 0, info.pos_y or 0)
        this.sprite:setScale(info.scale or 1, info.scale or 1)
        this.sprite:setOrigin(info.ox or 0, info.oy or 0)
        this.timeAnimation = info.time
        this.clock = lsfml.clock.create()
    end

    function draw()
        if this.clock:getEllapsedTime() > this.timeAnimation then
            if (this.sprite:hasEnded()) then
                this.sprite:restart()
            end
            this.clock:restart()
            this.sprite:next()
        end
        this.sprite:draw()
    end

    function setPosition(x, y)
        super.setPosition(x, y)
        this.sprite:setPosition(x, y)
    end

    function restart()
        this.clock:restart()
        this.sprite:restart()
    end

    function hasEnded()
        return this.sprite:hasEnded()
    end
}]

