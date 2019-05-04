-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
local boss_start = false
background:setTexture(assets["boss"], false)

local entities = {}
local hitb = nil

function load(scene)
    if (scene == "scene17_right_start") then
        player.setPosition(950, 1050)
    end
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(player)
    end
    if (hitb == nil) then
        HitBoxWall(0, 0, {{0, 0}, {0, 330}, {1920, 330}, {1920, 0}})
        HitBoxWall(0, 0, {{30, 30}, {30, 1050}})
        HitBoxWall(0, 0, {{1910, 30}, {1910, 1050}})

        HitBoxWall(0, 0, {{0, 1030}, {880, 1030}, {880, 1100}, {0, 1100}})
        HitBoxWall(0, 0, {{1020, 1030}, {1920, 1030}, {1920, 1100}, {1020, 1100}})
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
end

function update()
    local x, y = player.getPosition()
    if x > 900 and x < 1000 and y > 1050 and boss_start == false then
        setScene("scene17_right_start")
    end
    if keyboard.keyPressed(keys.A) then
        player.hit(10 * DeltaTime, "World")
        print(player.getHealth())
    end
    if keyboard.keyPressed(keys.E) then
        player.respawn()
        print(player.getHealth())
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