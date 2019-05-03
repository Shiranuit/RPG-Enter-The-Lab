-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["start_cave"], false)

local entities = {}
local hitb = nil

function load(scene)
    local status1 = new(EntityProps(600, 600, assets["status"], 50, 150, {{0, 127}, {13, 147}, {23, 174}, {100, 174}, {62, 130}}, 1))
    local status2 = new(EntityProps(1400, 450, assets["status"], 50, 150, {{0, 127}, {13, 147}, {23, 174}, {100, 174}, {62, 130}}, 1))
    local status3 = new(EntityProps(1300, 800, assets["status"], 50, 150, {{0, 127}, {13, 147}, {23, 174}, {100, 174}, {62, 130}}, 1))
    local pot1_1 = new(EntityProps(300, 500, assets["pot1"], 38, 84, {{0, 74}, {0, 84}, {76, 84}, {55, 74}}, 1))
    local pot1_2 = new(EntityProps(400, 800, assets["pot1"], 38, 84, {{0, 74}, {0, 84}, {76, 84}, {55, 74}}, 1))
    local pot1_3 = new(EntityProps(1200, 800, assets["pot1"], 38, 84, {{0, 74}, {0, 84}, {76, 84}, {55, 74}}, 1))
    local pot1_4 = new(EntityProps(1600, 450, assets["pot1"], 38, 84, {{0, 74}, {0, 84}, {76, 84}, {55, 74}}, 1))
    local pot2_1 = new(EntityProps(500, 650, assets["pot2"], 14, 56, {{0, 74}, {0, 56}, {25, 56}, {28, 74}}, 1))
    local pot2_2 = new(EntityProps(300, 400, assets["pot2"], 14, 56, {{0, 74}, {0, 56}, {25, 56}, {28, 74}}, 1))
    local pot2_3 = new(EntityProps(1500, 350, assets["pot2"], 14, 56, {{0, 74}, {0, 56}, {25, 56}, {28, 74}}, 1))
    local pot2_4 = new(EntityProps(300, 800, assets["pot2"], 14, 56, {{0, 74}, {0, 56}, {25, 56}, {28, 74}}, 1))
    local pot3_1 = new(EntityProps(414, 488, assets["pot3"], 17, 56, {{0, 49}, {0, 56}, {35, 56}, {24, 49}}, 1))
    local pot3_2 = new(EntityProps(1654, 344, assets["pot3"], 17, 56, {{0, 49}, {0, 56}, {35, 56}, {24, 49}}, 1))
    local pot3_3 = new(EntityProps(1512, 459, assets["pot3"], 17, 56, {{0, 49}, {0, 56}, {35, 56}, {24, 49}}, 1))
    local pot3_4 = new(EntityProps(1376, 859, assets["pot3"], 17, 56, {{0, 49}, {0, 56}, {35, 56}, {24, 49}}, 1))
    local pot4_1 = new(EntityProps(659, 427, assets["pot4"], 38, 80, {{0, 70}, {0, 80}, {76, 80}, {58, 70}}, 1))
    local pot4_2 = new(EntityProps(387, 411, assets["pot4"], 38, 80, {{0, 70}, {0, 80}, {76, 80}, {58, 70}}, 1))
    local pot4_3 = new(EntityProps(300, 607, assets["pot4"], 38, 80, {{0, 70}, {0, 80}, {76, 80}, {58, 70}}, 1))
    local pot4_4 = new(EntityProps(408, 617, assets["pot4"], 38, 80, {{0, 70}, {0, 80}, {76, 80}, {58, 70}}, 1))
    local pot5_1 = new(EntityProps(507, 534, assets["pot5"], 17, 84, {{0, 74}, {0, 84}, {34, 84}, {31, 74}}, 1))
    local pot5_2 = new(EntityProps(686, 523, assets["pot5"], 17, 84, {{0, 74}, {0, 84}, {34, 84}, {31, 74}}, 1))
    local pot5_3 = new(EntityProps(494, 816, assets["pot5"], 17, 84, {{0, 74}, {0, 84}, {34, 84}, {31, 74}}, 1))
    local pot5_4 = new(EntityProps(404, 905, assets["pot5"], 17, 84, {{0, 74}, {0, 84}, {34, 84}, {31, 74}}, 1))
    if (scene == "scene14_escalier") then
        player.setPosition(990, 250)
    end
    if (scene == "scene16_left_start") then
        player.setPosition(30, 580)
    end
    if (scene == "scene17_right_start") then
        player.setPosition(1900, 580)
    end
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(player)
        world.spawnEntity(status1)
        world.spawnEntity(status2)
        world.spawnEntity(status3)
        world.spawnEntity(pot1_1)
        world.spawnEntity(pot1_2)
        world.spawnEntity(pot1_3)
        world.spawnEntity(pot1_4)
        world.spawnEntity(pot2_1)
        world.spawnEntity(pot2_2)
        world.spawnEntity(pot2_3)
        world.spawnEntity(pot2_4)
        world.spawnEntity(pot3_1)
        world.spawnEntity(pot3_2)
        world.spawnEntity(pot3_3)
        world.spawnEntity(pot3_4)
        world.spawnEntity(pot4_1)
        world.spawnEntity(pot4_2)
        world.spawnEntity(pot4_3)
        world.spawnEntity(pot4_4)
        world.spawnEntity(pot5_1)
        world.spawnEntity(pot5_2)
        world.spawnEntity(pot5_3)
        world.spawnEntity(pot5_4)
    end
    if (hitb == nil) then
        HitBoxWall(0, 0, {{0, 0}, {0, 160}, {940, 160}, {940, 135}, {1030, 135}, {1030, 160}, {1920, 160}, {1920, 0}})
        HitBoxWall(0, 0, {{0, 1030}, {1890, 1030}})
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
    if x < 0 then
        setScene("scene16_left_start")
    end
    if y < 155 then
        setScene("scene14_escalier")
    end
    if x > 1910 then
        setScene("scene17_right_start")
    end
    if keyboard.keyPressed(keys.P) then
        print(lsfml.mouse.getPosition(window))
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