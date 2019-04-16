-- =========================================
-- =               ITEMSTACK               =
-- =========================================

itemstack = {}

function itemstack.create(item, count)
    check(item, "item", 1)
    cassert(type(count) == "nil" or type(count) == "number", "count must be a number", 3)

    return setmetatable({}, {
        __index = itemstack,
        __type = "itemstack",
        __item = item,
        __eq = itemstack.equals,
        __count = count or 0,
    })
end

function itemstack.getItem(self)
    check(self, "itemstack", 1)

    local meta = getmetatable(self)
    return meta.__item
end

function itemstack.setStackSize(self, size)
    check(self, "itemstack", 1)
    check(size, "number", 2)
    if size < 0 then
        error("Size must be positive", 2)
    end

    local meta = getmetatable(self)
    local max = self:getMaxStackSize()
    if size > max then
        meta.__count = max
        return size - max
    else
        meta.__count = size
        return 0
    end
end

function itemstack.getUserdata(self)
    check(self, "itemstack", 1)

    return self:getItem():getUserdata()
end

function itemstack.getStackSize(self)
    check(self, "itemstack", 1)

    local meta = getmetatable(self)
    return meta.__count
end

function itemstack.getMaxStackSize(self)
    check(self, "itemstack", 1)

    local meta = getmetatable(self)
    return meta.__item:getMaxStackSize()
end

function itemstack.equals(self, itemstack)
    check(self, "itemstack", 1)
    check(itemstack, "itemstack", 2)

    return self:getStackSize() > 0 and itemstack:getStackSize() > 0 and self:getItem():getName() == itemstack:getItem():getName()
end

function itemstack.pack(self, itemstack)
    check(self, "itemstack", 1)
    check(itemstack, "itemstack", 2)

    itemstack:setStackSize(self:setStackSize(self:getStackSize() + itemstack:getStackSize()))
end