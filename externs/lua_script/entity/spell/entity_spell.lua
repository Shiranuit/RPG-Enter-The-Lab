-- =========================================
-- =             ENTITY SPELL              =
-- =========================================

Class "EntitySpell" extends "Entity" [{
    function __EntitySpell(info)
        check(info, "table", 1)

        super(info.pos_x or 0, info.pos_y or 0)

        this.sprite = animation.create(info.spell, info.rect)
        this.sprite:setPosition(info.pos_x or 0, info.pos_y or 0)
        this.sprite:setOrigin(info.ox or 0, info.oy or 0)
        this.sprite:setScale(info.scale or 1, info.scale or 1)
        this.timeAnimation = info.time or 10000
        this.pos_x_tp = info.pos_x_tp or 0
        this.pos_y_tp = info.pos_y_tp or 0
        this.clock = lsfml.clock.create()
        this.follow_player = info.follow_player or false
        this.one_animation = info.one_animation or false
    end

    function setTextureRect(rect)
        this.sprite:setTextureRect(table.unpack(rect))
    end

    function setTranslation(x, y)
        this.pos_x_tp = x
        this.pos_y_tp = y
    end

    function setOrigin(x, y)
        this.sprite:setOrigin(x, y)
    end

    function draw()
        if this.follow_player then
            local x, y = player.getPosition()
            this.setPosition(x + this.pos_x_tp, y + this.pos_y_tp)
        end
        
        if this.clock:getEllapsedTime() > this.timeAnimation then
            if this.one_animation and this.sprite:hasEnded() then
                world.removeEntityByUUID(super.getUUID())
                player.desactivateSpell()
                return
            end
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

    function setRotation(angle)
        this.sprite:setRotation(angle)
    end

    function restart()
        this.clock:restart()
        this.sprite:restart()
    end

    function hasEnded()
        return this.sprite:hasEnded()
    end

    function followPlayer(bool)
        this.follow_player = bool
    end

    function one_animation(bool)
        this.one_animation = bool
    end
}]

