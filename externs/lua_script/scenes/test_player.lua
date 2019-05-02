-- =========================================
-- =                MAP LABO               =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["labo_pop"], false)

local scythe = new(EntityScytheBoss(500, 510))
local item1 = new(EntityItem(itemstack.create(items["core"], 2)))
item1.setPosition(500, 500)

local tube_bleu_casser = new(EntityProps(600, 700, assets["tube_bleu_casser"], 126, 156, {{8, 148},{0, 248}, {162, 248}, {162, 148}}, 1))
local tube_bleu_transform = new(EntityProps(200, 900, assets["tube_bleu_transform"], 65, 204, {{6, 153},{0, 204}, {131, 204}, {125, 153}}, 1.2))
local tube_bleu_homme = new(EntityProps(300, 300, assets["tube_bleu_homme"], 78, 244, {{8, 183},{0, 244}, {157, 244}, {150, 183}}, 1))

local entities = {}
local hitbx = nil

function load(scene)
    if (scene ~= nil) and (scene == "scene2_angle_g") then
        player.setPosition(1050, 240)
    else
        player.setPosition(700, 730)
        assets["ambiance_music"]:setLoop(true)
        assets["ambiance_music"]:setVolume(30)
        assets["ambiance_music"]:play()
    end
    world.setEntities(entities)
    if #entities == 0 then
        world.spawnEntity(scythe)
        world.spawnEntity(player)
        world.spawnEntity(item1)
        world.spawnEntity(tube_bleu_casser)
        world.spawnEntity(tube_bleu_transform)
        world.spawnEntity(tube_bleu_homme)
    end
    if (hitbx == nil) then
        HitBoxWall(0, 0, {{0, 0}, {0, 220}, {960, 220}, {960, 190}, {1115, 190}, {1115, 220}, {1920, 220}, {1920, 0}})
        hitbx = hitbox.getHitboxes()
    end
    hitbox.setHitboxes(hitbx)
end

function HitBoxWall(x_or, y_or, pts)
    local box = new(Hitbox("hard", {takeDamage=false, doDamage=false}))
    box.setPoints(pts)
    box.setPosition(x_or, y_or)
    hitbox.add(box)
end

function unload()
    entities = world.getEntities()
    hitbx = hitbox.getHitboxes()
    world.clearEntities()
    hitbox.clear()
end

function draw()
    window:draw(background)
end

function update()
    local x, y = player.getPosition()
    if x > 930 and x < 1100 and y < 210 then
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