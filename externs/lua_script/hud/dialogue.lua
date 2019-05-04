-- =========================================
-- =               DIALOGUE                =
-- =========================================

local dial = lsfml.sprite.create()

-- ===============================================
-- =               DIALOGUE_HOMME                =
-- ===============================================
local dialogue = lsfml.text.create()
local file_dial_homme = io.open("./assets/dialogue_script/dialogue_script_homme.txt", "r")
local nb_dialogue_homme = 1
local line_homme = {}
local already_aff_homme = {false}

for i = 1, 3 do
    line_homme[i] = file_dial_homme:read()
end
local line_hommes = line_homme[1].."\n"..line_homme[2].."\n"..line_homme[3]

-- ==============================================
-- =               DIALOGUE_ROBOT               =
-- ==============================================
local file_dial_robot = io.open("./assets/dialogue_script/dialogue_script_robot.txt", "r")
local nb_dialogue_robot = 1
local line_robot = {}
local already_aff_robot = {false}

for i = 1, 3 do
    line_robot[i] = file_dial_robot:read()
end
local line_robots = line_robot[1].."\n"..line_robot[2].."\n"..line_robot[3]

--===============================================
local can_aff = false
local name

dialogue:setFont(assets["fsys"])
dialogue:setCharacterSize(30)
dialogue:setScale(1, 1)

dial:setPosition(500, 500)
dial:setTexture(assets["case_dial"], false)
dial:setScale(1, 1)

function next_homme()
    nb_dialogue_homme = nb_dialogue_homme + 1
end

function next_robot()
    nb_dialogue_robot = nb_dialogue_robot + 1
end

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

function draw(self)
    window:draw(dial)
    if can_aff then
        window:draw(dialogue)
    end
end

function itIsRob()
    name = "robot"
end

function itIsHom()
    name = "homme"
end

function restart_dialogue()
    file_dial_homme = io.open("./assets/dialogue_script/dialogue_script_homme.txt", "r")
    nb_dialogue_homme = 1
    line_homme = {}
    already_aff_homme = {false}

    file_dial_robot = io.open("./assets/dialogue_script/dialogue_script_robot.txt", "r")
    nb_dialogue_robot = 1
    line_robot = {}
    already_aff_robot = {false}
end

function update(self)
    local x, y = dial:getPosition()
    local cx, cy = lsfml.text.getCenter(line_hommes, 30)
    dialogue:setPosition(x + 384 / 2.1 - cx / 3, y + 164 / 4 - cy / 1.5)
end

function event_homme(e)
    if nb_dialogue_homme == 0 then
        dialogue:setString(line_hommes)
        can_aff = true
    end
    if nb_dialogue_homme == 1 and not already_aff_homme[nb_dialogue_homme] then
        for i = 1, 3 do
            
            line_homme[i] = file_dial_homme:read()
        end
        
        line_hommes = line_homme[1].."\n"..line_homme[2].."\n"..line_homme[3]
        dialogue:setString(line_hommes)
        can_aff = true
        already_aff_homme[nb_dialogue_homme] = true
    end
    if nb_dialogue_homme == 2 and not already_aff_homme[nb_dialogue_homme] then
        for i = 1, 3 do
            
            line_homme[i] = file_dial_homme:read()
        end
        
        line_hommes = line_homme[1].."\n"..line_homme[2].."\n"..line_homme[3]
        dialogue:setString(line_hommes)
        can_aff = true
        already_aff_homme[nb_dialogue_homme] = true
    end
    if nb_dialogue_homme == 3 and not already_aff_homme[nb_dialogue_homme] then
        for i = 1, 3 do
            
            line_homme[i] = file_dial_homme:read()
        end
        
        line_hommes = line_homme[1].."\n"..line_homme[2].."\n"..line_homme[3]
        dialogue:setString(line_hommes)
        can_aff = true
        already_aff_homme[nb_dialogue_homme] = true
    end
    if nb_dialogue_homme == 4 and not already_aff_homme[nb_dialogue_homme] then
        for i = 1, 3 do
            
            line_homme[i] = file_dial_homme:read()
        end
        
        line_hommes = line_homme[1].."\n"..line_homme[2].."\n"..line_homme[3]
        dialogue:setString(line_hommes)
        can_aff = true
        already_aff_homme[nb_dialogue_homme] = true
    end
    if nb_dialogue_homme == 5 and not already_aff_homme[nb_dialogue_homme] then
        for i = 1, 3 do
            
            line_homme[i] = file_dial_homme:read()
        end
        
        line_hommes = line_homme[1].."\n"..line_homme[2].."\n"..line_homme[3]
        dialogue:setString(line_hommes)
        can_aff = true
        already_aff_homme[nb_dialogue_homme] = true
    end
    if nb_dialogue_homme == 6 and not already_aff_homme[nb_dialogue_homme] then
        for i = 1, 3 do
            
            line_homme[i] = file_dial_homme:read()
        end
        
        line_hommes = line_homme[1].."\n"..line_homme[2].."\n"..line_homme[3]
        dialogue:setString(line_hommes)
        can_aff = true
        already_aff_homme[nb_dialogue_homme] = true
    end
    if nb_dialogue_homme == 7 and not already_aff_homme[nb_dialogue_homme] then
        for i = 1, 3 do
            
            line_homme[i] = file_dial_homme:read()
        end
        
        line_hommes = line_homme[1].."\n"..line_homme[2].."\n"..line_homme[3]
        dialogue:setString(line_hommes)
        can_aff = true
        already_aff_homme[nb_dialogue_homme] = true
    end
end

function event_robot(e)
    if nb_dialogue_robot == 0 then
        dialogue:setString(line_robots)
        can_aff = true
    end
    if nb_dialogue_robot == 1 and not already_aff_robot[nb_dialogue_robot] then
        for i = 1, 3 do
            
            line_robot[i] = file_dial_robot:read()
        end
        
        line_robots = line_robot[1].."\n"..line_robot[2].."\n"..line_robot[3]
        dialogue:setString(line_robots)
        can_aff = true
        already_aff_robot[nb_dialogue_robot] = true
    end
    if nb_dialogue_robot == 2 and not already_aff_robot[nb_dialogue_robot] then
        for i = 1, 3 do
            
            line_robot[i] = file_dial_robot:read()
        end
        
        line_robots = line_robot[1].."\n"..line_robot[2].."\n"..line_robot[3]
        dialogue:setString(line_robots)
        can_aff = true
        already_aff_robot[nb_dialogue_robot] = true
    end
    if nb_dialogue_robot == 3 and not already_aff_robot[nb_dialogue_robot] then
        for i = 1, 3 do
            
            line_robot[i] = file_dial_robot:read()
        end
        
        line_robots = line_robot[1].."\n"..line_robot[2].."\n"..line_robot[3]
        dialogue:setString(line_robots)
        can_aff = true
        already_aff_robot[nb_dialogue_robot] = true
    end
    if nb_dialogue_robot == 4 and not already_aff_robot[nb_dialogue_robot] then
        for i = 1, 3 do
            
            line_robot[i] = file_dial_robot:read()
        end
        
        line_robots = line_robot[1].."\n"..line_robot[2].."\n"..line_robot[3]
        dialogue:setString(line_robots)
        can_aff = true
        already_aff_robot[nb_dialogue_robot] = true
    end
    if nb_dialogue_robot == 5 and not already_aff_robot[nb_dialogue_robot] then
        for i = 1, 3 do
            
            line_robot[i] = file_dial_robot:read()
        end
        
        line_robots = line_robot[1].."\n"..line_robot[2].."\n"..line_robot[3]
        dialogue:setString(line_robots)
        can_aff = true
        already_aff_robot[nb_dialogue_robot] = true
    end
    if nb_dialogue_robot == 6 and not already_aff_robot[nb_dialogue_robot] then
        for i = 1, 3 do
            
            line_robot[i] = file_dial_robot:read()
        end
        
        line_robots = line_robot[1].."\n"..line_robot[2].."\n"..line_robot[3]
        dialogue:setString(line_robots)
        can_aff = true
        already_aff_robot[nb_dialogue_robot] = true
    end
    if nb_dialogue_robot == 7 and not already_aff_robot[nb_dialogue_robot] then
        for i = 1, 3 do
            
            line_robot[i] = file_dial_robot:read()
        end
        
        line_robots = line_robot[1].."\n"..line_robot[2].."\n"..line_robot[3]
        dialogue:setString(line_robots)
        can_aff = true
        already_aff_robot[nb_dialogue_robot] = true
    end
    if nb_dialogue_robot == 8 and not already_aff_robot[nb_dialogue_robot] then
        for i = 1, 3 do
            
            line_robot[i] = file_dial_robot:read()
        end
        
        line_robots = line_robot[1].."\n"..line_robot[2].."\n"..line_robot[3]
        dialogue:setString(line_robots)
        can_aff = true
        already_aff_robot[nb_dialogue_robot] = true
    end
end

function event(self, e)
    if file_dial_homme and name == "homme" then
        event_homme(e)
    end
    if file_dial_robot and name == "robot" then
        event_robot(e)
    end
end