-- =========================================
-- =           MYRPG VARIABLES             =
-- =========================================

assets = {}
spells = {}
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
        local func, err = load(code, "loadScene", "t", env)
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
dofile("lib/lsfml.lua")
dofile("tools/uuid.lua")
dofile("options.lua")
dofile("tools/button.lua")
dofile("tools/hud.lua")
dofile("entity/entity_player.lua")
dofile("tools/inventory_slot.lua")
dofile("tools/item.lua")
dofile("tools/itemstack.lua")
dofile("entity/entity_item.lua")
dofile("world/world.lua")
-- =========================================
-- =             LOADING ASSETS            =
-- =========================================

dofile("assets.lua")

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
loadScene("scenes/test_player.lua")

-- =========================================
-- =           MYRPG GAME-LOGIC            =
-- =========================================

player = entity_player.create ({
    pos_x = 100,
    pos_y = 100,
    texture = assets["player"],
    speed = 5,
})

world.spawnEntity(player)
world.spawnEntity(entity_item.create(itemstack.create(items["core"], 2))):setPosition(500, 500)

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
        if scene_name ~= "main_menu" then
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
        if scene_name ~= "main_menu" then
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
    if evt[1] == "close" then
        window:close()
        return
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
        scenes[scene_name].event(...)
        if scene_name ~= "main_menu" then
            world.event(...)
            for i=1, #hudorder do
                hudorder[i]:event(...)
            end
        end
    else
        error("Scene not found '"..scene_name.."'", 2)
    end
end