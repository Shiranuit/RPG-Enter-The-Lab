-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["labo_angle_droit"], false)

local first = false
local teleporter
local hologram1
local hologram2
local hologram3
local hologram_break1
local hologram_break2
local torch1
local torch2

local entities = {}
local hitb = nil

function load(scene)
    if first == false then
        teleporter = new(EntityProps(950, 500, assets["teleporter"], 65, 248, {{8, 212},{0, 248}, {130, 248}, {122, 208}}, 1))
        hologram1 = new(EntityProps(1500, 900, assets["hologram"], 77, 155, {{0, 136},{0, 155}, {155, 155}, {155, 136}}, 1))
        hologram2 = new(EntityProps(350, 900, assets["hologram"], 77, 155, {{0, 136},{0, 155}, {155, 155}, {155, 136}}, 1))
        hologram3 = new(EntityProps(1600, 450, assets["hologram"], 77, 155, {{0, 136},{0, 155}, {155, 155}, {155, 136}}, 1))
        hologram_break1 = new(EntityProps(1200, 350, assets["hologram_break"], 77, 39, {{0, 20},{0, 39}, {155, 39}, {155, 20}}, 1))
        hologram_break2 = new(EntityProps(300, 400, assets["hologram_break"], 77, 39, {{0, 20},{0, 39}, {155, 39}, {155, 20}}, 1))
        torch1 = new(EntityProps(1800, 450, assets["torch"], 27, 111, {{0, 95},{0, 111}, {55, 111}, {55, 95}}, 1))
        torch2 = new(EntityProps(1800, 850, assets["torch"], 27, 111, {{0, 95},{0, 111}, {55, 111}, {55, 95}}, 1))
        first = true
    end
    if (scene == "scene12_salle") then
        player.setPosition(980, 1050)
    end
    if (scene == "scene10_intersection_haut") then
        player.setPosition(1900, 630)
    end
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(player)
        world.spawnEntity(teleporter)
        world.spawnEntity(hologram1)
        world.spawnEntity(hologram2)
        world.spawnEntity(hologram3)
        world.spawnEntity(hologram_break1)
        world.spawnEntity(hologram_break2)
        world.spawnEntity(torch1)
        world.spawnEntity(torch2)
    end
    if (hitb == nil) then
        HitBoxWall(0, 0, {{0, 0}, {0, 220}, {1920, 220}, {1920, 0}})
        HitBoxWall(0, 0, {{30, 30}, {30, 1050}})

        HitBoxWall(0, 0, {{1880, 0}, {1880, 530}, {1920, 530}, {1920, 0}})
        HitBoxWall(0, 0, {{1880, 690}, {1880, 1080}, {1920, 1080}, {1920, 690}})

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
    if y > 1100 then
        setScene("scene12_salle")
    end
    if x > 1910 then
        setScene("scene10_intersection_haut")
    end
    if keyboard.keyPressed(keys.A) then
        player.hit(10 * DeltaTime)
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