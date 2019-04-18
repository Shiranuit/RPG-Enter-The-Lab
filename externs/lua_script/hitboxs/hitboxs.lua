-- =========================================
-- =                 HITBOXS               =
-- =========================================

hitbox = {}
local hitboxes = {}

function hitbox.add(box)
    check(box, "table", 1)

    if box.x and box.y and box.w and box.h then
        hitboxes[#hitboxes + 1] = box
    else
        error("Hitbox must be {x=..., y=..., w=..., h=...}", 2)
    end
end

function hitbox.clear()
    hitboxes = {}
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