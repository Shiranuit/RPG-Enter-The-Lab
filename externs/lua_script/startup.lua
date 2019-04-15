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
    player_hud:open()
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

local owindow = window
dofile("lib/lsfml.lua")
dofile("tools/button.lua")
dofile("tools/hud.lua")
dofile("entity/entity_player.lua")

-- =========================================
-- =             LOADING ASSETS            =
-- =========================================

dofile("assets.lua")

-- =========================================
-- =               LOAD HUD                =
-- =========================================

player_hud = hud.createFromFile("hud/player_hud.lua")

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
    speed = 5
})

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
        for i=1, #hudorder do
            if hudorder[i]:isOpen() then
                hudorder[i]:draw()
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
        for i=1, #hudorder do
            if hudorder[i]:isOpen() then
                hudorder[i]:update()
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
    if scenes[scene_name] then
        scenes[scene_name].event(...)
        for i=1, #hudorder do
            hudorder[i]:event(...)
        end
    else
        error("Scene not found '"..scene_name.."'", 2)
    end
end