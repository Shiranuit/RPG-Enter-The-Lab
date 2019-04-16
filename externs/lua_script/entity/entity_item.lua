-- =========================================
-- =              ENTITY ITEM              =
-- =========================================

entity_item = {}

function entity_item.create(itemstack)
    check(itemstack, "itemstack", 1)

    local sprite = lsfml.sprite.create()
    sprite:setPosition(0, 0)
    sprite:setTexture(itemstack:getItem():getTexture(), false)
    sprite:scale(1, 1)
    sprite:setOrigin(32, 32)
    return setmetatable({}, {
        __index = entity_item,
        __type = "entity_item",
        __sprite = sprite,
        __itemstack = itemstack,
        __x = 0,
        __y = 0,
        __uuid = uuid.randomUUID(),
        __anim = 0,
        __status = "up",
    })
end

function entity_item.setPosition(self, x, y)
    check(self, "entity_item", 1)
    check(x, "number", 2)
    check(y, "number", 3)

    local meta = getmetatable(self)
    meta.__x = x
    meta.__y = y
    meta.__sprite:setPosition(x, y)
end

function entity_item.getPosition(self)
    check(self, "entity_item", 1)

    local meta = getmetatable(self)
    return meta.__x, meta.__y
end

function entity_item.getItemStack(self)
    check(self, "entity_item", 1)

    local meta = getmetatable(self)
    return meta.__itemstack
end

function entity_item.setItemStack(self, itemstack)
    check(self, "entity_item", 1)
    check(itemstack, "itemstack", 2)

    local meta = getmetatable(self)
    meta.__itemstack = itemstack
    meta.__sprite:setTexture(itemstack:getItem():getTexture(), false)
end

function entity_item.draw(self)
    check(self, "entity_item", 1)

    local meta = getmetatable(self)
    window:draw(meta.__sprite)
end

function entity_item.update(self)
    check(self, "entity_item", 1)

    local meta = getmetatable(self)
    if meta.__status == "up" then
        meta.__anim = meta.__anim + math.floor(DeltaTime)
        if meta.__anim > 40 then
            meta.__status = "down"
        end
    elseif meta.__status == "down" then
        meta.__anim = meta.__anim - math.floor(DeltaTime)
        if meta.__anim < 0 then
            meta.__status = "up"
        end
    end
    meta.__sprite:setPosition(meta.__x, meta.__y - meta.__anim)
end

function entity_item.getUUID(self)
    check(self, "entity_item", 1)

    local meta = getmetatable(self)
    return meta.__uuid
end