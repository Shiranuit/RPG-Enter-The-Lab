Class "Vector2D" [{
    function Vector2D(x, y)
        this.x = x
        this.y = y
    end

    function getX()
        return this.x
    end

    function getY()
        return this.y
    end

    function setX(x)
        check(x, "number", 1)

        this.x = x
    end

    function setY(y)
        check(y, "number", 1)

        this.y = y
    end
}]

Class "Line" [{
    function Line(_start, _End)
        check(_start, "Vector2D", 1)
        check(_End, "Vector2D", 2)

        this._start = start
        this._End = _End
    end

    function getStart()
        return this._start
    end

    function getEnd()
        return this._End
    end

    function setStart(_start)
        check(_start, "Vector2D", 1)

        this._start = _start
    end

    function setEnd(_End)
        check(_End, "Vector2D", 1)

        this._End = _End
    end
}]

Class "RayCast" [{
    function intersectLine(line1, line2)
        local b = {line1[2][1] - line1[1][1], line1[2][2] - line1[1][2]}
        local d = {line2[2][1] - line2[1][1], line2[2][2] - line2[1][2]}
        local bDotDPerp = b[1] * d[2] - b[2] * d[1]
        if (bDotDPerp == 0) then
            return false
        end

        local c = {line2[1][1] - line1[1][1], line2[1][2] - line1[1][2]}
        local t = (c[1] * d[2] - c[2] * d[1]) / bDotDPerp
        if (t < 0 or t > 1) then
            return false
        end

        local u = (c[1] * b[2] - c[2] * b[1]) / bDotDPerp
        if (u < 0 or u > 1) then
            return false
        end

        local intersection = {line1[1][1] + t * b[1], line1[1][2] + t * b[2]}

        return true, intersection
    end
}]