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
        this.origin = {info.ox, info.oy}
        this.scale = info.scale or 1
        this.collidebox = info.rect
        this.timeAnimation = info.time or 10000
        this.pos_x_tp = info.pos_x_tp or 0
        this.pos_y_tp = info.pos_y_tp or 0
        this.clock = lsfml.clock.create()
        this.follow_player = info.follow_player or false
        this.one_animation = info.one_animation or true
        this.damage_loop = info.damage_loop or false
        this.once = false
        this.damage = info.damage or 0
        this.matrix = transform.trans(info.ox or 0, info.oy or 0) * transform.scale(info.scale or 1, info.scale or 1)
        this.one_animation = info.one_animation or false
        this.moving_x = 0
        this.moving_y = 0
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

    function moving(x, y)
        this.moving_x = x
        this.moving_y = y
    end

    function draw()
        if this.follow_player then
            local x, y = player.getPosition()
            this.setPosition(x + this.pos_x_tp, y + this.pos_y_tp)
        else
            this.move(this.moving_x, this.moving_y)
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

    function move(x, y)
        super.move(x, y)
        this.sprite:move(x, y)
    end

    function setPosition(x, y)
        super.setPosition(x, y)
        this.sprite:setPosition(x, y)
    end

    function setRotation(angle)
        this.sprite:setRotation(angle)
        this.matrix = this.matrix * transform.rotate(angle)
    end

    function restart()
        this.clock:restart()
        this.sprite:restart()
        this.once = false
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

