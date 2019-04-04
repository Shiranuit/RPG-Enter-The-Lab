local o_lsfml = lsfml
local o_type = _G.type

function type(val)
    local meta = getmetatable(val)
    if meta then
        if meta.__type then
            return meta.__type
        end
    end
    return o_type(val)
end

local clock = {}

function clock.new()
    return setmetatable({}, {__index = clock, __type = "clock", __ptr = o_lsfml.clock_create()})
end

function clock.destroy(var)
    if (type(var) == "clock") then
        local meta = getmetatable(var)
        o_lsfml.clock_destroy(meta.__ptr)
    else
        error("Wrong Argument #1, got "..type(var)..", Expected clock", 2)
    end
end

function clock.restart(var)
    if (type(var) == "clock") then
        local meta = getmetatable(var)
        o_lsfml.clock_restart(meta.__ptr)
    else
        error("Wrong Argument #1, got "..type(var)..", Expected clock", 2)
    end
end

function clock.time(var)
    if (type(var) == "clock") then
        local meta = getmetatable(var)
        return o_lsfml.clock_getEllapsedTime(meta.__ptr)
    else
        error("Wrong Argument #1, got "..type(var)..", Expected clock", 2)
    end
end

















































local myclock = clock.new()
function draw()
    print(myclock:time())
    myclock:restart()
end