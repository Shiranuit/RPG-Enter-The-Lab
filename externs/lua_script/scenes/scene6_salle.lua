-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["labo_pop"], false)

local first = false
local table1
local table2
local table3
local table4
local table5
local table6
local mini_holo1
local mini_holo2
local mini_holo3
local mini_tube1
local mini_tube2
local mini_tp1
local robot1
local door
local canPass = false
local stopwatch = stopwatch.create()
local play_door = false

local entities = {}
local hitb = nil

function load(scene)
    if first == false then
        table1 = new(EntityProps(400, 550, assets["table"], 100, 110, {{0, 102},{0, 127}, {200, 127}, {200, 102}}, 1))
        table2 = new(EntityProps(400, 750, assets["table"], 100, 110, {{0, 102},{0, 127}, {200, 127}, {200, 102}}, 1))
        table3 = new(EntityProps(400, 950, assets["table"], 100, 110, {{0, 102},{0, 127}, {200, 127}, {200, 102}}, 1))
        table4 = new(EntityProps(1670, 550, assets["table"], 100, 110, {{0, 102},{0, 127}, {200, 127}, {200, 102}}, 1))
        table5 = new(EntityProps(1670, 750, assets["table"], 100, 110, {{0, 102},{0, 127}, {200, 127}, {200, 102}}, 1))
        table6 = new(EntityProps(1670, 950, assets["table"], 100, 110, {{0, 102},{0, 127}, {200, 127}, {200, 102}}, 1))
        mini_holo1 = new(EntityProps(575, 600, assets["mini_holo"], 200, 200, {}, 1))
        mini_holo2 = new(EntityProps(550, 1000, assets["mini_holo"], 200, 200, {}, 1))
        mini_holo3 = new(EntityProps(1875, 800, assets["mini_holo"], 200, 200, {}, 1))
        mini_tube1 = new(EntityProps(550, 780, assets["mini_tube"], 200, 200, {}, 1))
        mini_tube2 = new(EntityProps(1825, 980, assets["mini_tube"], 200, 200, {}, 1))
        mini_tp1 = new(EntityProps(1875, 600, assets["mini_tp"], 200, 200, {}, 1))
        robot1 = new(EntityTurret(500, 510))
        door = animation.create(assets["door"], {0, 0 , 400, 351})
        door:setPosition(965, 80)
        door:scale(0.38, 0.38)
        first = true
    end
    if scene == "scene5_intersection_bas" then
        player.setPosition(1050, 210)
    end
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(player)
        world.spawnEntity(table1)
        world.spawnEntity(table2)
        world.spawnEntity(table3)
        world.spawnEntity(table4)
        world.spawnEntity(table5)
        world.spawnEntity(table6)
        world.spawnEntity(mini_holo1)
        world.spawnEntity(mini_holo2)
        world.spawnEntity(mini_holo3)
        world.spawnEntity(mini_tube1)
        world.spawnEntity(mini_tube2)
        world.spawnEntity(mini_tp1)
        world.spawnEntity(robot1)
    end
    if (hitb == nil) then
        HitBoxWall(0, 0, {{0, 0}, {0, 220}, {960, 220}, {960, 190}, {1115, 190}, {1115, 220}, {1920, 220}, {1920, 0}})
        HitBoxWall(0, 0, {{0, 1030}, {1890, 1030}})
        HitBoxWall(0, 0, {{30, 30}, {30, 1050}})
        HitBoxWall(0, 0, {{1880, 1050}, {1880, 40}})
        hitb = hitbox.getHitboxes()
    end
    hitbox.setHitboxes(hitb)
end

function unload()
    entities = world.getEntities()
    hitb = hitbox.getHitboxes()
    world.clearEntities()
    hitbox.clear()
end

function HitBoxWall(x_or, y_or, pts)
    local box = new(Hitbox("hard", {takeDamage=false, doDamage=false}))
    box.setPoints(pts)
    box.setPosition(x_or, y_or)
    hitbox.add(box)
end

function draw()
    window:draw(background)
    if canPass then
        if stopwatch:getEllapsedTime() > 100000 then
            stopwatch:restart()
            door:next()
        end
    end
    door:draw()
end

function update()
    local x, y = player.getPosition()
    canPass = true
    for i=1, #entities do
        if entities[i].getType() == "ennemy" then
            canPass = false
        end
    end
    if canPass then
        if not play_door then
            assets["door_sound"]:play()
            play_door = true
        end
        if y < 200 then
            setScene("scene5_intersection_bas")
        end
        if keyboard.keyPressed(keys.A) then
            player.hit(10 * DeltaTime, "World")
        end
        if keyboard.keyPressed(keys.E) then
            player.respawn()
        end
    end
end


local hitbx = new(Hitbox())
local press = false
local px, py = 0, 0
function event(e)
    local event = e:getEvent()
    if event[1] == "mouse_pressed" and press == false and event[4] == mouse.RIGHT then
        px, py = event[2], event[3]
        press = true
        hitbx.addPoint(px, py)
    elseif event[1] == "mouse_released" and press and event[4] == mouse.RIGHT then
        press = false
    end
    if event[1] == "mouse_pressed" and event[4] == mouse.LEFT then
        if hitbx and #hitbx.getPoints() > 0 then
            local pts = hitbx.getPoints()
            hitbx.setOrigin(hitbx.getMiddlePoint())
            hitbox.add(hitbx)
            hitbx = new(Hitbox())
        end
    end
end
