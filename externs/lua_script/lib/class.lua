class = {}

function class.createFromFile(filename)
    local handle = io.open("./externs/lua_script/"..filename, "r")
    if handle then
        local code = handle:read("*all")
        handle:close()
        local env = setmetatable({}, {__index = _G})
        local func, err = load(code, filename, "t", env)
        if func then
            local success, errmsg = pcall(func)
            if success then

            else
                error(errmsg, 2)
            end
        else
            error("[ERROR LOADING CLASS] "..err, 2)
        end
    end
end

function class.isInstanceOf(obj, _type)
    if type(obj) == _type then
        return true
    else
        local meta = getmetatable(obj)
        while (meta) do
            if meta and not meta.__superclass then
                return false
            end
            if meta.__superclass == _type then
                return true
            else
                if _G[meta.__superclass] then
                    meta = getmetatable(_G[meta.__superclass])
                else
                    return false
                end
            end
        end
    end
    return false
end

function class.isNew(obj)
    if class.isInstanceOf(obj, "Class") then
        local meta = getmetatable(obj)
        if meta.__isNew then
            return true
        else
            return false
        end
    end
end

function Class(className)
    _G.extends = function(superclass)
        return setmetatable({}, {
                __call=function(self, code)
                    local super = {}
                    for func_name, func_f in pairs(_G[superclass]) do
                        super[func_name] = func_f
                    end
                    local env = setmetatable({}, {__index = function(self, key)
                        if key == "super" then
                            return super
                        elseif key == "this" then
                            return self
                        else
                            return _G[key]
                        end
                    end})
                    local func, err = load(code, className, "t", env)
                    if func then
                        local success, err = pcall(func)
                        if success then
                            local cpenv = {}
                            for func_name, func_f in pairs(_G[superclass]) do
                                cpenv[func_name] = func_f
                            end
                            for k, v in pairs(env) do
                                if type(v) == "function" then
                                    cpenv[k] = v
                                end
                            end
                        _G[className] = setmetatable(cpenv, {
                            __call = function(self, ...)
                                return setmetatable({className=className, superclass=superclass, code=code, params={...}}, {__type = className, __superclass=superclass, code=code, params={...}, __isNew = true})
                            end,
                            __index = function(self, key)
                                if class[key] then
                                    return class[key]
                                else
                                    return rawget(self, key)
                                end
                            end,
                            __type = className,
                            __superclass = superclass,
                            })
                        else
                            error(err, 2)
                        end
                    else
                        error(err, 2)
                    end
                end
            })
    end
    return setmetatable({}, {
        __call=function(self, code)
            local env = setmetatable({}, {__index = _G})
            local func, err = load(code, className, "t", env)
            if func then
                local success, err = pcall(func)
                if success then
                    local cpenv = {}
                    for k, v in pairs(env) do
                        cpenv[k] = v
                    end
                    _G[className] = setmetatable(cpenv, {
                        __code = code,
                        __type = className,
                        __superclass = "Class",
                        __index = function(self, key)
                            if class[key] then
                                return class[key]
                            else
                                return rawget(self, key)
                            end
                        end,
                        __call = function(self, ...)
                            return setmetatable({className=className, superclass="Class", code=code, params={...}}, {__type = className, __superclass="Class", code=code, params={...}, __isNew = true})
                        end,
                        })
                else
                    error(err, 2)
                end
            else
                error(err, 2)
            end
        end
    })
end

function new(clazz)
    if clazz and class.isInstanceOf(clazz, "Class") and class.isNew(clazz) then
        if clazz.superclass then
            local super = setmetatable({}, {__call = function(self, ...)
                local meta = getmetatable(self)

                meta.__super = new(_G[clazz.superclass](...))
                if not meta.__super then
                    error("Failed to Initialized Superclass '"..clazz.superclass.."', Missing Constructor for '"..clazz.superclass.."'", 3)
                end
                return meta.__super
            end,
            __index = function(self, key)
                local meta = getmetatable(self)

                if meta.__super then
                    return meta.__super[key]
                else
                    error("Unable to find '"..key.."' from Superclass, Superclass '"..clazz.superclass.."' may not have been initialized", 3)
                end
            end})
            local env = setmetatable({}, {__index = function(self, key)
                if key == "super" then
                    return super
                elseif key == "this" then
                    return self
                else
                    return _G[key]
                end
            end})
            local func, err = load(clazz.code, clazz.className, "t", env)
            if func then
                local success, err = pcall(func)
                if success then
                    local cpenv = {}
                    for k, v in pairs(env) do
                        if type(v) == "function" then
                            cpenv[k] = v
                        end
                    end
                local cl = setmetatable(cpenv, {
                    __index = function(self, key)
                        local meta = getmetatable(self)
                        if class[key] then
                            return class[key]
                        elseif rawget(self, key) then
                            return rawget(self, key)
                        else
                            return meta.__super[key]
                        end
                    end,
                    __type = clazz.className,
                    __superclass = clazz.superclass,
                    __super = super,
                    })
                    if cl[clazz.className] then
                        cl[clazz.className](table.unpack(clazz.params))
                    else
                        error("Failed to Initialized Superclass '"..clazz.superclass.."', Missing Constructor for '"..clazz.superclass.."'", 3)
                    end
                    return cl
                else
                    error(err, 2)
                end
            else
                error(err, 2)
            end
        end
        local env = setmetatable({}, {__index = _G})
        local func, err = load(clazz.code, clazz.className, "t", env)
        if func then
            local success, err = pcall(func)
            if success then
                local cpenv = {}
                for k, v in pairs(env) do
                    cpenv[k] = v
                end
                local cl = setmetatable(cpenv, {
                    __code = clazz.code,
                    __type = clazz.className,
                    __superclass = "Class",
                    __index = function(self, key)
                        if class[key] then
                            return class[key]
                        else
                            return rawget(self, key)
                        end
                    end,
                    })
                if cl[clazz.className] then
                    cl[clazz.className](table.unpack(clazz.params))
                end
                return cl
            else
                error(err, 2)
            end
        else
            error(err, 2)
        end
    end
end