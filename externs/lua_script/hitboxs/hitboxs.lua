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

function hitbox.draw()
    for i=1, #hitboxes do
        -- hitboxes[i].setRotation(hitboxes[i].getRotation() + 1)
        local nx, ny = hitboxes[i].getPosition()
        local w, h = hitboxes[i].getScale()
        -- hitboxes[i].setPosition(nx + 1, ny)
        hitboxes[i].setScale(w + 0.001, h + 0.001)
        hitboxes[i].draw()
    end
end