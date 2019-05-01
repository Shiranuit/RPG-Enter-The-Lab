-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["labo_pop"], false)

local scythe = new(EntityScytheBoss(500, 510))
local item1 = new(EntityItem(itemstack.create(items["core"], 2)))
item1.setPosition(500, 500)

local entities = {}

function load(scene)
    if (scene ~= nil) and (scene == "scene2_angle_g") then
        player.setPosition(1050, 210)
    else
        player.setPosition(1045, 616)
    end
    assets["ambiance_music"]:setLoop(true)
    assets["ambiance_music"]:setVolume(30)
    assets["ambiance_music"]:play()
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(scythe)
        world.spawnEntity(player)
        world.spawnEntity(item1)
    end
end

function unload()
    assets["ambiance_music"]:stop()
    entities = world.getEntities()
    world.clearEntities()
end

function draw()
    window:draw(background)
end

function update()
    local x, y = player.getPosition()
    if x > 930 and x < 1100 and y < 200 then
        setScene("scene2_angle_g")
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
            hitbx.setOrigin(pts[1][1], pts[1][2])
            hitbx.setPosition(pts[1][1], pts[1][2])
            hitbox.add(hitbx)
            hitbx = new(Hitbox())
        end
    end
end