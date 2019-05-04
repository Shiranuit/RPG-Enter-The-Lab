-- =========================================
-- =               DIALOGUE                =
-- =========================================

local dial = lsfml.sprite.create()
local dialogue = lsfml.text.create()
local file_dial = io.open("./assets/dialogue_script/dialogue_script.txt", "r")
local nb_dialogue = 0
local line = {}
local already_aff = {false}

for i = 1, 3 do
    line[i] = file_dial:read()
end
--local line1 = file_dial:read()
--local line2 = file_dial:read()
--local line3 = file_dial:read()
local lines = line[1].."\n"..line[2].."\n"..line[3]
local can_aff = false

dialogue:setFont(assets["fsys"])
dialogue:setCharacterSize(30)
dialogue:setScale(1, 1)

dial:setPosition(500, 500)
dial:setTexture(assets["case_dial"], false)
dial:setScale(1, 1)

function load(self)

end

function open(self)

end

function close(self)
    hud.close(self)
end

function set_Position(self, x, y)
    dial:setPosition(x, y)
end

function next()
    nb_dialogue = nb_dialogue + 1
end

function draw(self)
    window:draw(dial)
    if can_aff then
        window:draw(dialogue)
    end
end

function restart_dialogue()
    file_dial = io.open("./assets/dialogue_script/dialogue_script.txt", "r")
    nb_dialogue = 0
    line = {}
    already_aff = {false}
nb = 0
end

function update(self)
    local x, y = dial:getPosition()
    local cx, cy = lsfml.text.getCenter(lines, 30)
    dialogue:setPosition(x + 384 / 2.1 - cx / 3, y + 164 / 4 - cy / 1.5)
end

function event(self, e)
    if file_dial then
        if nb_dialogue == 0 then
            dialogue:setString(lines)
            can_aff = true
        end
        if nb_dialogue == 1 and not already_aff[nb_dialogue] then
            for i = 1, 3 do
                
                line[i] = file_dial:read()
            end
            
            lines = line[1].."\n"..line[2].."\n"..line[3]
            dialogue:setString(lines)
            can_aff = true
            already_aff[nb_dialogue] = true
        end
        if nb_dialogue == 2 and not already_aff[nb_dialogue] then
            for i = 1, 3 do
                
                line[i] = file_dial:read()
            end
            
            lines = line[1].."\n"..line[2].."\n"..line[3]
            dialogue:setString(lines)
            can_aff = true
            already_aff[nb_dialogue] = true
        end
        if nb_dialogue == 3 and not already_aff[nb_dialogue] then
            for i = 1, 3 do
                
                line[i] = file_dial:read()
            end
            
            lines = line[1].."\n"..line[2].."\n"..line[3]
            dialogue:setString(lines)
            can_aff = true
            already_aff[nb_dialogue] = true
        end
        if nb_dialogue == 4 and not already_aff[nb_dialogue] then
            for i = 1, 3 do
                
                line[i] = file_dial:read()
            end
            
            lines = line[1].."\n"..line[2].."\n"..line[3]
            dialogue:setString(lines)
            can_aff = true
            already_aff[nb_dialogue] = true
        end
    end


end