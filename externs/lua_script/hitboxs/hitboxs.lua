-- =========================================
-- =                 HITBOXS               =
-- =========================================

hitbox = {}
local hitboxes = {}
local hitbox_vertexs = {}

function hitbox.add(points)
    check(points, "table", 1)

    for i=1, #points do
        if type(points[i]) == "table" and #points >= 2 then
            if not points[i][1] or not points[i][2] then
                error("Point must have {x, y}")
            end
        else
            error("Hitbox Points must be tables", 2)
        end
    end
    hitboxes[#hitboxes + 1] = points
    local varray = lsfml.vertexarray.create()
    varray:setPrimitiveType(primitiveType.LineStrip)
    for i=1, #points do
        varray:append({x=points[i][1], y=points[i][2], r=255, g=255, b=255, a=255, tx=0, ty=0})
    end
    varray:append({x=points[1][1], y=points[1][2], r=255, g=255, b=255, a=255, tx=0, ty=0})
    hitbox_vertexs[#hitbox_vertexs + 1] = varray
end

function hitbox.clear()
    hitboxes = {}
    for i=1, #hitbox_vertexs do
        hitbox_vertexs[i] = nil
    end
    hitbox_vertexs = nil
    hitbox_vertexs = {}
end

local function isInHitbox(box, x, y)
    return x >= box.x and x <= box.w and y >= box.y and y <= box.h
end

function hitbox.get(x, y)
    check(x, "number", 1)
    check(y, "number", 2)

    for i=1, #hitboxes do
        if isInHitbox(hitboxes[i], x, y) then
            return hitboxes[i]
        end
    end
end

function hitbox.collide(x, y)
    check(x, "number", 1)
    check(y, "number", 2)

    for i=1, #hitboxes do
        if isInHitbox(hitboxes[i], x, y) then
            return true
        end
    end
    return false
end

function hitbox.rayhit(x, y, dx, dy)
    check(x, "number", 1)
    check(y, "number", 2)
    check(dx, "number", 3)
    check(dy, "number", 4)

    local ray = {{x, y}, {x + dx, y + dy}}
    for i=1, #hitboxes do
        local success, point = RayCast.intersectPolygon(ray, hitboxes[i])
        if success then
            return true, point
        end
    end
    return false
end

function hitbox.draw()
    for i=1, #hitbox_vertexs do
        window:draw(hitbox_vertexs[i])
    end
end