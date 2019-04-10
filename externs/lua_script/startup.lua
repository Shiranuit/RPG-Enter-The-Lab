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
    local handle = io.open("./externs/lua_script/"..name)
    if handle then
        local code = handle:read("*all")
        local env = setmetatable({}, {__index = _G})
        local func, err = load(code, "loadScene", "t", env)
        if func then
            local s, e = pcall(func)
            if s then
                local name = name:gsub(".lua", "")
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
dofile("lsfml.lua")
dofile("tools/button.lua")
dofile("entity/player.lua")

-- =========================================
-- =             LOADING ASSETS            =
-- =========================================

assets["background"] = lsfml.texture.createFromFile("./assets/menu/BG.png", {0, 0, 1920, 1080})
assets["button_idle"] = lsfml.texture.createFromFile("./assets/menu/button_idle.png", {0, 0, 421, 171})
assets["button_pressed"] = lsfml.texture.createFromFile("./assets/menu/button_pressed.png", {0, 0, 421, 171})
assets["button_hover"] = lsfml.texture.createFromFile("./assets/menu/button_hover.png", {0, 0, 421, 171})
assets["player"] = lsfml.texture.createFromFile("./assets/player/AllSprite.png", {0, 0, 3299, 2498})
assets["fsys"] = lsfml.font.createFromFile("./assets/fonts/fsys.ttf")
assets["menu_music"] = lsfml.music.createFromFile("./assets/music/main_menu.ogg")
assets["ambiance_music"] = lsfml.music.createFromFile("./assets/music/ambiance_game.ogg")


-- =========================================
-- =                 SCENES                =
-- =========================================

loadScene("main_menu.lua")
loadScene("test_player.lua")

-- =========================================
-- =           MYRPG GAME-LOGIC            =
-- =========================================


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
    else
        error("Scene not found '"..scene_name.."'", 2)
    end
end

-- Called each time we need to update the game-logic
function update()
    if scenes[scene_name] then
        scenes[scene_name].update()
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
    else
        error("Scene not found '"..scene_name.."'", 2)
    end
end