-- =========================================
-- =               SOUNDMANAGER            =
-- =========================================

local sounds = {}
soundmanager = {}

function soundmanager.add(category, soundbuff)
    check(category, "string", 1)
    check(soundbuff, "soundbuffer", 2)

    sounds[category] = sounds[category] or {}
    local sounds_cat = sounds[category]
    local mysound = lsfml.sound.create()
    mysound:setBuffer(soundbuff)
    sounds_cat[#sounds_cat + 1] = mysound
    return mysound
end

function soundmanager.clear(category)
    cassert(type(category) == "nil" or type(category) == "string", "Category must be as string", 3)

    if category then
        sounds[category] = nil
        sounds[category] = {}
    else
        sounds = nil
        sounds = {}
    end
end

function soundmanager.getSounds()
    return sounds
end

function soundmanager.setSounds(sound)
    check(sound, "table", 1)

    sounds = sound
end

function soundmanager.setVolume(value, category)
    check(value, "number", 1)
    cassert(type(category) == "nil" or type(category) == "string", "Category must be as string", 3)

    if category then
        if sounds[category] then
            for i=1, #sounds[category] do
                sounds[category][i]:setVolume(value)
            end
        end
    else
        for k, v in pairs(sounds) do
            for i=1, #v do
                v[i]:setVolume(value)
            end
        end
    end
end

function soundmanager.play(category)
    cassert(type(category) == "nil" or type(category) == "string", "Category must be as string", 3)

    if category then
        if sounds[category] then
            for i=1, #sounds[category] do
                sounds[category][i]:play()
            end
        end
    else
        for k, v in pairs(sounds) do
            for i=1, #v do
                v[i]:play()
            end
        end
    end
end

function soundmanager.pause(category)
    cassert(type(category) == "nil" or type(category) == "string", "Category must be as string", 3)

    if category then
        if sounds[category] then
            for i=1, #sounds[category] do
                sounds[category][i]:pause()
            end
        end
    else
        for k, v in pairs(sounds) do
            for i=1, #v do
                v[i]:pause()
            end
        end
    end
end

function soundmanager.stop(category)
    cassert(type(category) == "nil" or type(category) == "string", "Category must be as string", 3)

    if category then
        if sounds[category] then
            for i=1, #sounds[category] do
                sounds[category][i]:stop()
            end
        end
    else
        for k, v in pairs(sounds) do
            for i=1, #v do
                v[i]:stop()
            end
        end
    end
end

function soundmanager.setLoop(bool, category)
    check(bool, "boolean", 1)
    cassert(type(category) == "nil" or type(category) == "string", "Category must be as string", 3)

    if category then
        if sounds[category] then
            for i=1, #sounds[category] do
                sounds[category][i]:setLoop(bool)
            end
        end
    else
        for k, v in pairs(sounds) do
            for i=1, #v do
                v[i]:setLoop(bool)
            end
        end
    end
end

function soundmanager.setPitch(value, category)
    check(value, "number", 1)
    cassert(type(category) == "nil" or type(category) == "string", "Category must be as string", 3)

    if category then
        if sounds[category] then
            for i=1, #sounds[category] do
                sounds[category][i]:setPitch(value)
            end
        end
    else
        for k, v in pairs(sounds) do
            for i=1, #v do
                v[i]:setPitch(value)
            end
        end
    end
end