-- =========================================
-- =                stopwatch                  =
-- =========================================

stopwatch = {}
function stopwatch.create()
    local function stringify(self)
        return tostring(self:getEllapsedTime())
    end
    return setmetatable({}, {
        __index = stopwatch,
        __type = "stopwatch",
        __time = 0,
        __clock = lsfml.clock.create(),
        __pause = false,
        __gstate = _G.pause,
        __tostring = stringify,
    })
end

function stopwatch.restart(self)
    check(self, "stopwatch", 1)

    local meta = getmetatable(self)
    meta.__clock:restart()
    meta.__time = 0
    meta.__pause = false
end

function stopwatch.pause(self)
    check(self, "stopwatch", 1)

    local meta = getmetatable(self)
    meta.__time = self:getEllapsedTime()
    meta.__pause = true
end

function stopwatch.start(self)
    check(self, "stopwatch", 1)

    local meta = getmetatable(self)
    if meta.__pause then
        meta.__pause = false
        meta.__clock:restart()
    end
end

function stopwatch.getEllapsedTime(self)
    check(self, "stopwatch", 1)

    local meta = getmetatable(self)
    if meta.__gstate ~= _G.pause then
        if _G.pause then
            if not meta.__pause then
                meta.__time = meta.__time + meta.__clock:getEllapsedTime()
            end
            meta.__pause = true
        else
            meta.__pause = false
            meta.__clock:restart()
        end
    end
    meta.__gstate = _G.pause
    if meta.__pause then
        return meta.__time
    else
        return meta.__time + meta.__clock:getEllapsedTime()
    end
end

function stopwatch.destroy(self)
    check(self, "stopwatch", 1)

    local meta = getmetatable(self)
    meta.__clock:destroy()
end

function stopwatch.copy(stopwatch)
    check(stopwatch, "stopwatch", 1)

    local function stringify(self)
        return tostring(self:getEllapsedTime())
    end
    local meta = getmetatable(stopwatch)
    return setmetatable({}, {
        __index = stopwatch,
        __type = "stopwatch",
        __time = meta.__time,
        __pause = meta.__pause,
        __clock = meta.__clock:copy(),
        __tostring = stringify,
    })
end