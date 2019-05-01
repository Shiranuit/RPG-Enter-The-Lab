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