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
        if entities[i].getUUID and uuid == entities[i]:getUUID() then
            table.remove(entities, i)
            break
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

function world.getEntitiesInRect(x, y, w, h)
    local ent = {}
    for i = 1, #entities do
        local nx, ny = entities[i]:getPosition()
        if nx > x and nx < x + w and ny > y and ny < y + h then
            ent[#ent + 1] = entities[i]
        end
    end
    return ent
end

function world.draw()
    depth_sort()
    for i=1, #entities do
        if entities[i] and entities[i].draw then
            entities[i]:draw()
        end
    end
end

function world.update()
    for i=1, #entities do
        if entities[i] and entities[i].update then
            entities[i]:update()
        end
    end
end

function world.event(...)
    for i=1, #entities do
        if entities[i] and entities[i].event then
            entities[i]:event(...)
        end
    end
end