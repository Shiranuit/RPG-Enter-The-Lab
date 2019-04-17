-- =========================================
-- =              OPTION MENU              =
-- =========================================

local background = lsfml.sprite.create()
background:setTexture(assets["background"], false)
local textRender = lsfml.text.create()
local offset = 1
textRender:setFont(assets["fsys"])

function load()
    world.renderDisable()
    world.updateDisable()
    world.eventDisable()
    hud.renderDisable()
end

function unload()
    world.eventEnable()
    world.updateEnable()
    world.renderEnable()
    hud.renderEnable()
end

function draw()
    window:draw(background)
    local shortcuts = controls.getControls()
    for i=offset, math.min(offset + 5, #shortcuts) do
        textRender:setString(shotcuts[i].text)
        textRender:setPosition(100, 200 + (i - offset) * 200)
        window:draw(textRender)
    end
end

function update()

end

function event()

end
