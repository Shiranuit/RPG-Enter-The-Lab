-- =========================================
-- =                 HITBOXS               =
-- =========================================

hitbox = {}
push_rays = {{0, 1}, {0.70, -0.70}, {1, 0}, {0.70, 0.70}, {0, 1}, {-0.70, 0.70}, {-1, 0}, {-0.70, -0.70}}
local hitboxes = {}

function hitbox.add(hbx)
    check(hbx, "Hitbox", 1)

    hitboxes[#hitboxes + 1] = hbx
end

function hitbox.clear()
    hitboxes = {}
    for i=1, #hitbox_vertexs do
        hitbox_vertexs[i] = nil
    end
    hitbox_vertexs = nil
    hitbox_vertexs = {}
end

function hitbox.rayhit(x, y, dx, dy)
    check(x, "number", 1)
    check(y, "number", 2)
    check(dx, "number", 3)
    check(dy, "number", 4)

    local ray = {{x, y}, {x + dx, y + dy}}
    for i=1, #hitboxes do
        local success, point = RayCast.intersectPolygon(ray, hitboxes[i].getPoints())
        if success then
            return true, point
        end
    end
    return false
end

function hitbox.rayhitSimple(x, y, dx, dy)
    check(x, "number", 1)
    check(y, "number", 2)
    check(dx, "number", 3)
    check(dy, "number", 4)

    local ray = {{x, y}, {x + dx, y + dy}}
    for i=1, #hitboxes do
        local success, point = RayCast.simpleIntersectPolygon(ray, hitboxes[i].getPoints())
        if success then
            return true
        end
    end
    return false
end

function hitbox.rayhitCount(x, y, dx, dy)
    check(x, "number", 1)
    check(y, "number", 2)
    check(dx, "number", 3)
    check(dy, "number", 4)

    local count = 0
    local ray = {{x, y}, {x + dx, y + dy}}
    for i=1, #hitboxes do
        count = count + RayCast.intersectPolygonCount(ray, hitboxes[i].getPoints())
    end
    return count
end

function hitbox.draw()
    for i=1, #hitboxes do
        hitboxes[i].draw()
    end
end

local function project(hitbox, axis)
    check(hitbox, "Hitbox", 1)
    check(axis, "Vector2D", axis)

    local vertices = hitbox.getPoints()
    axis = axis.normalize()
    local min = vertices[1].dot(axis)
    local max = min
    for i=1, #vertices do
        if proj < min then min = proj end
        if proj > max then max = proj end
    end
    return {min, max}
end

local function contains(n, range)
    local a, b = range[1], range[2]
    if b < a then
        a = b
        b = range[1]
    end
    return n >= a and n <= b
end

local function overlap(a_, b_)
	if contains(a_[1], b_) then return true
	elseif contains(a_[2], b_) then return true
	elseif contains(b_[1], a_) then return true
	elseif contains(b_[2], a_) then return true
	end
	return false
end

local function SAT(a, b)
    local poly_a = a.getPoints()
    local poly_b = b.getPoints()
    for i=1, #poly_a do
        local edge = poly_a[(i + 1 > #poly_a) and 1 or i + 1] - poly_a[i]
        local axis = edge.perp()
        local a__, b__ = project(a, axis), project(b, axis)
        if not overlap(a__, b__) then
            return false
        end
    end

    for i=1, #poly_b do
        local edge = poly_b[(i + 1 > #poly_b) and 1 or i + 1] - poly_b[i]
        local axis = edge.perp()
        local a__, b__ = project(a, axis), project(b, axis)
        if not overlap(a__, b__) then
            return false
        end
    end
    return true
end

