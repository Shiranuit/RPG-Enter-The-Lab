-- =========================================
-- =                  WORLD                =
-- =========================================

world = {}
local entities = {}

function world.spawnEntity(entity)
    entities[#entities + 1] = entity
    return entity
end

function world.removeEntityByUUID(uuid)
    check(uuid, "string", 1)

    for i=1, #entities do
        if uuid == entities[i]:getUUID() then
            table.remove(entities, i)
        end
    end
end

function world.getEntityByUUID(uuid)
    check(uuid, "string", 1)

    for i=1, #entities do
        if uuid == entities[i]:getUUID() then
            return entities[i]
        end
    end
end

function world.getEntities()
    return entities
end

function world.clearEntities()
    entities = nil
    entities = {}
end

local function depth_sort()
    table.sort(entities, function(a, b)
        local x, y = a:getPosition()
        local nx, ny = b:getPosition()
        return ny > y
    end)
end

function world.draw()
    depth_sort()
    for i=1, #entities do
        if entities[i].draw then
            entities[i]:draw()
        end
    end
end

function world.update()
    for i=1, #entities do
        if entities[i].update then
            entities[i]:update()
        end
    end
end

function world.event(...)
    for i=1, #entities do
        if entities[i].event then
            entities[i]:event(...)
        end
    end
end