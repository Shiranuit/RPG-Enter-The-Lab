-- =========================================
-- =                 HITBOX                =
-- =========================================

Class "Hitbox" [{
    function __Hitbox(points)
        this.points = points or {}
        this.compute_points = {}
        this.rotation = transform.rotate(0)
        this.position = transform.trans(0, 0)
        this.scale = transform.scale(1, 1)
        this.offset = transform.trans(0, 0)
        this.angle = 0
        this.x = 0
        this.y = 0
        this.scale_x = 1
        this.scale_y = 1
        this.offset_x = 0
        this.offset_y = 0
        this.varray = lsfml.vertexarray.create()
        varray:setPrimitiveType(primitiveType.LineStrip)
        this.modify = true
        this.modify_mesh = true
    end

    function setPoints(points)
        check(points, "table", 1)

        local pts = {}
        for i=1, #pts do
            pts[i] = new(vector2D(points[i][1], points[i][2]))
        end
        this.points = pts
        this.modify = true
        this.modify_mesh = true
    end

    function recompute()
        if this.modify then
            this.compute_points = nil
            this.compute_points = {}
            local matrix = transform.trans(this.offset_x, this.offset_y) * this.position * this.rotation * this.scale *
                           transform.trans(-this.offset_x, -this.offset_y)
            for i=1, #this.points do
                this.compute_points[i] = new(Vector2D(matrix(this.points[i][1], this.points[i][2])))
            end
            this.modify = false
        end
    end

    function recompute_mesh()
        recompute()
        if this.modify_mesh and #this.compute_points > 0 then
            varray:clear()
            for i=1, #this.compute_points do
                varray:append({x=this.compute_points[i][1], y=this.compute_points[i][2], r=255, g=255, b=255, a=255, tx=0, ty=0})
            end
            varray:append({x=this.compute_points[1][1], y=this.compute_points[1][2], r=255, g=255, b=255, a=255, tx=0, ty=0})
            this.modify_mesh = false
        end
    end

    function addPoint(x, y)
        this.points[#this.points + 1] = new(Vector2D(x, y))
        this.modify = true
        this.modify_mesh = true
    end

    function setRotation(angle)
        this.rotation = transform.rotate(math.rad(angle))
        this.angle = angle
        this.modify = true
        this.modify_mesh = true
    end

    function setPosition(x, y)
        this.position = transform.trans(x, y)
        this.x = x
        this.y = y
        this.modify = true
        this.modify_mesh = true
    end

    function setScale(x, y)
        this.scale = transform.scale(x, y)
        this.scale_x = x
        this.scale_y = y
        this.modify = true
        this.modify_mesh = true
    end

    function setOrigin(x, y)
        this.offset = transform.trans(-x, -y)
        this.offset_x = x
        this.offset_y = y
        this.modify = true
        this.modify_mesh = true
    end

    function clearPoints()
        this.points = {}
        this.modify = true
        this.modify_mesh = true
    end

    function getOrigin()
        return this.offset_x, this.offset_y
    end

    function getPosition()
        return this.x, this.y
    end

    function getRotation()
        return this.angle
    end

    function getScale()
        return this.scale_x, this.scale_y
    end

    function reset()
        this.matrix = transform.trans(0, 0)
        this.modify = true
    end

    function getMiddlePoint()
        recompute()
        local nx, ny = 0, 0
        for i=1, #this.compute_points do
            nx = nx + this.compute_points[i][1]
            ny = ny + this.compute_points[i][2]
        end
        return math.floor(nx / #this.compute_points), math.floor(ny / #this.compute_points)
    end

    function getPoints()
        recompute()
        return this.compute_points
    end

    function draw()
        recompute_mesh()
        window:draw(this.varray)
    end
}]