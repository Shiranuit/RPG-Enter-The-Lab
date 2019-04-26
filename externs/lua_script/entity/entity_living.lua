Class "EntityLiving" extends "Entity" [{

    function EntityLiving(x, y)
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
        if not hitbox.collide(nx + x, ny + y) then
            super.move(x, y)
            return true
        end
        return false
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

}]