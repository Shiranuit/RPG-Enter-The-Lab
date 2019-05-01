Class "EntityLiving" extends "Entity" [{

    function __EntityLiving(x, y)
        super(x, y)
        this.max_health = 100
        this.health = 100
        this.alive = true
        this.stats = new(Stats())
        this.lvl = 1
    end

    function getStats()
        return this.stats
    end

    function setLevel(lvl)
        check(lvl, "number", 1)

        cassert(lvl >= 0, "Level must be positive", 3)
        this.lvl = lvl
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

    function getLevel()
        return this.lvl
    end

    function getMaximumHealth()
        return this.max_health
    end

    function setMaximumHealth(health)
        check(health, "number", 1)

        if (health > 0) then
            this.max_health = health
        else
            error("Health must be superior to 0", 2)
        end
    end

    function getHealth()
        return this.health
    end

    function setHealth(health)
        check(health, "number", 1)

        if (health <= 0) then
            this.alive = false
            this.health = math.max(health, 0)
        elseif this.alive then
            this.health = math.min(health, this.max_health)
        end
    end

    function isAlive()
        return this.alive
    end

    function isDead()
        return not this.alive
    end

    function kill()
        this.setHealth(-2147483647)
    end

    function respawn()
        this.alive = true
        this.health = this.max_health
    end

    function hit(damage)
        check(damage, "number", 1)

        if (damage >= 0) then
            this.setHealth(this.health - damage)
        else
            error("Damage can not be negative", 2)
        end
    end

    function heal(damage)
        check(damage, "number", 1)

        if (damage >= 0) then
            this.setHealth(this.health + damage)
        end
    end

    function canBePushed()
        return true
    end

    function update()
        super.update()
        -- if this.isAlive() and final.canBePushed() then
        --     local mvx, mvy = 0, 0
        --     local nx, ny = super.getPosition()
        --     for i=1, #push_rays do
        --         local success = hitbox.rayhitSimple(nx, ny, push_rays[i][1] * 10, push_rays[i][2] * 10, "push")
        --         if success then
        --             mvx, mvy = mvx - push_rays[i][1] * 10, mvy - push_rays[i][2] * 10
        --         end
        --     end
        --     final.move(mvx, mvy)
        -- end
    end

}]