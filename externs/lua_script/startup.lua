-- =========================================
-- =           MYRPG VARIABLES             =
-- =========================================

assets = {}
local scenes = {}
local scene_name = "main_menu"

-- =========================================
-- =                 LOADING               =
-- =========================================

local odofile = dofile
function dofile(filename)
    if filename then
        return odofile("./externs/lua_script/"..filename)
    else
        return odofile()
    end
end

local function loadScene(name)
    check(name, "string", 1)
    local handle = io.open("./externs/lua_script/"..name)
    if handle then
        local code = handle:read("*all")
        local env = setmetatable({}, {__index = _G})
        local func, err = load(code, name, "t", env)
        if func then
            local s, e = pcall(func)
            if s then
                local name = name:match("([^/]+).lua$")
                scenes[name] = {}
                for k, v in pairs(env) do
                    scenes[name][k] = v
                end
            else
                print(name..({e:match(":.+")})[1])
            end
        else
            error("[SCENE LOADER ERROR] "..err, 2)
        end
        handle:close()
    else
        error("File not found '"..name.."'", 2)
    end
end

function setScene(name)
    if name ~= "main_menu" then
        player_hud:open()
    end
    if scenes[scene_name] and scenes[scene_name].unload then
        scenes[scene_name].unload()
    end
    scene_name = name
    if scenes[name] and scenes[name].load then
        scenes[name].load()
    end
end

function getScene()
    return scene_name
end

math.randomseed(os.time())
local owindow = window
dofile("tools/keyboard.lua")
transform = dofile("tools/transform.lua")
dofile("lib/class.lua")
dofile("lib/lsfml.lua")
dofile("tools/animation.lua")
dofile("tools/event.lua")
dofile("tools/uuid.lua")
dofile("world/world.lua")
class.createFromFile("hitboxs/hitbox.lua")
dofile("hitboxs/hitboxs.lua")
dofile("controls.lua")
dofile("tools/button.lua")
dofile("spells/spell.lua")
dofile("tools/hud.lua")
dofile("tools/item.lua")
dofile("tools/itemstack.lua")
dofile("tools/inventory_slot.lua")

-- =========================================
-- =             LOADING CLASSES           =
-- =========================================

class.createFromFile("helpers/ray_caster.lua")
class.createFromFile("entity/entity.lua")
class.createFromFile("stats/stats.lua")
class.createFromFile("entity/entity_living.lua")
class.createFromFile("entity/entity_item.lua")
class.createFromFile("entity/entity_player.lua")
class.createFromFile("entity/ennemy/boss/entity_scythe.lua")
class.createFromFile("entity/spell/entity_spell.lua")
class.createFromFile("entity/spell/rayon_spell.lua")

-- =========================================
-- =             LOADING SPELLS            =
-- =========================================

spells_tab = {
    healSpell = spell.createFromFile("spells/heal.lua"),
    bouleelecSpell = spell.createFromFile("spells/bouleelec.lua"),
    douleurSpell = spell.createFromFile("spells/douleur.lua"),
    dashSpell = spell.createFromFile("spells/dash.lua"),
    elecSpell = spell.createFromFile("spells/elec.lua"),
    picSpell = spell.createFromFile("spells/pic.lua"),
    rayonSpell = spell.createFromFile("spells/rayon.lua"),
    repulsionSpell = spell.createFromFile("spells/repulsion.lua"),
    shieldSpell = spell.createFromFile("spells/shield.lua"),
    tempSpell = spell.createFromFile("spells/temp.lua"),
}

-- =========================================
-- =             LOADING ASSETS            =
-- =========================================

dofile("assets.lua")

-- =========================================
-- =        LOADING SPELL ANIMATION        =
-- =========================================

animationSpell = {
    rayonSpell = new(EntitySpell({
        spell = assets["rayonAnimation"],
        rect = {0, 0, 19, 114},
        ox = 6.5,
        oy = 10,
        follow_player = true,
        one_animation = true,
        scale = 3,
        time = 100000,
    })),
    shieldSpell = new(EntitySpell({
        spell = assets["shieldAnimation"],
        rect = {0, 0, 686, 655},
        ox = 343,
        oy = 555,
        time = 200000,
        scale = 0.25,
        follow_player = false,
        one_animation = true,
    })),
    healSpell = new(EntitySpell({
        spell = assets["healAnimation"],
        rect = {0, 0, 192, 192},
        ox = 96,
        oy = 0,
        time = 100000,
        scale = 1.5,
        follow_player = true,
        one_animation = true,
        pos_x_tp = 0,
        pos_y_tp = -240,
    })),
    picSpell = new(EntitySpell({
        spell = assets["picAnimation"],
        rect = {0, 0, 457, 224},
        ox = 420,
        oy = 112,
        time = 80000,
        scale = 1,
        follow_player = true,
        one_animation = true,
        pos_x_tp = 0,
        pos_y_tp = -60,
    })),
    elecSpell = new(EntitySpell({
        spell = assets["elecAnimation"],
        rect = {0, 0, 83, 249},
        ox = 41.5,
        oy = 0,
        time = 80000,
        scale = 1.25,
        follow_player = true,
        one_animation = true,
        pos_x_tp = 15,
        pos_y_tp = -60,
    })),
    bouleelecSpell = new(EntitySpell({
        spell = assets["bouleelecAnimation"],
        rect = {0, 0, 71, 281},
        ox = 0,
        oy = 0,
        time = 80000,
        pos_y = 600,
        pos_x = 600,
        scale = 1,
        follow_player = false,
        one_animation = false,
        pos_x_tp = 0,
        pos_y_tp = 0,
    })),
    repulsionSpell = new(EntitySpell({
        spell = assets["repulsionAnimation"],
        rect = {0, 0, 900, 900},
        ox = 450,
        oy = 900,
        time = 80000,
        pos_y = 0,
        pos_x = 0,
        scale = 0.5,
        follow_player = true,
        one_animation = true,
        pos_x_tp = 0,
        pos_y_tp = 200,
    }))

}

-- =========================================
-- =              LOADING ITEMS            =
-- =========================================

dofile("items.lua")

-- =========================================
-- =               LOAD HUD                =
-- =========================================

player_hud = hud.createFromFile("hud/player_hud.lua", nil, false)
all_sort = hud.createFromFile("hud/sort.lua", nil, false)
menu_spell = hud.createFromFile("hud/spell_menu.lua", nil, true)

-- =========================================
-- =                 SCENES                =
-- =========================================

loadScene("menu/main_menu.lua")
loadScene("menu/options_menu.lua")
loadScene("scenes/test_player.lua")

-- =========================================
-- =           MYRPG GAME-LOGIC            =
-- =========================================

player = new(EntityPlayer({
    pos_x = 100,
    pos_y = 100,
    texture = assets["player"],
    speed = 5,
}))

world.spawnEntity(new(EntityScytheBoss(500, 510)))

world.spawnEntity(player)
world.spawnEntity(new(EntityItem(itemstack.create(items["core"], 2)))).setPosition(500, 500)

-- Called at the beginning of the program
function init()
    window = setmetatable({}, {
        __index = lsfml.window,
        __gc = lsfml.window.destroy,
        __ptr = owindow,
        __type = "window",
    })
    setScene("main_menu")
end

-- Called each time we need to draw a frame
function draw()
    if scenes[scene_name] then
        scenes[scene_name].draw()
        if world.isRenderEnabled() then
            hitbox.draw()
            world.draw()
            for i=1, #hudorder do
                if hudorder[i]:isOpen() then
                    hudorder[i]:draw()
                end
            end
        end
    else
        error("Scene not found '"..scene_name.."'", 2)
    end
end

-- Called each time we need to update the game-logic
function update()
    if scenes[scene_name] then
        scenes[scene_name].update()
        for i=1, #spells do
            spells[i]:update()
        end
        if world.isUpdateEnabled() then
            world.update()
            for i=1, #hudorder do
                if hudorder[i]:isOpen() then
                    hudorder[i]:update()
                end
            end
        end
    else
        error("Scene not found '"..scene_name.."'", 2)
    end
end

-- Called when an event is produced
function event(...)
    local evt = {...}
    local e = event_helper.create(...)
    if evt[1] == "close" then
        window:close()
        return
    end
    if evt[1] == "key_pressed" then
        keyboard.setKeyPressed(evt[2], true)
    elseif evt[1] == "key_released" then
        keyboard.setKeyPressed(evt[2], false)
    end
    if evt[1] == "key_pressed" and evt[2] == keys.Escape then
        local found = false
        for i=#hudorder, 1, -1 do
            local meta = getmetatable(hudorder[i])
            if hudorder[i]:isOpen() and hudorder[i]:canBeClosed() then
                hudorder[i]:close()
                found = true
                break
            end
        end
        if found == false then
            setScene("main_menu")
        end
    end
    if scenes[scene_name] then
        scenes[scene_name].event(e)
        if world.isEventEnabled() then
            world.event(e)
            local hzindex = {}
            for i=1, #hudorder do
                hzindex[i] = hudorder[i]
            end
            local eHUD = event_helper.create(...)
            if #hudorder > 0 and hudorder[#hudorder]:canBeClosed() then
                hudorder[#hudorder]:event(eHUD)
            end
            for i=1, #huds do
                if not eHUD:isCanceled() then
                    local found = false
                    for j=1, #hzindex do
                        if huds[i]:getUUID() == hzindex[j]:getUUID() and huds[i]:canBeClosed() then
                            found = true
                            break
                        end
                    end
                    if found == false then
                        huds[i]:event(eHUD)
                        if eHUD:isCanceled() then
                            break
                        end
                    end
                end
            end
        end
    else
        error("Scene not found '"..scene_name.."'", 2)
    end
end