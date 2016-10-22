local typeof
typeof = function(val)
  local xval = type(val) == "table"
  xpcall(function()
    if xval and val.__class.__name then
      xval = val.__class.__name
    else
      xval = type(val)
    end
  end, function()
    xval = "table"
  end)
  return xval
end
local vec2
do
  local _class_0
  local _base_0 = {
    __add = function(self, v)
      if typeof(v) == "vec2" then
        return vec2(self.x + v.x, self.y + v.y)
      else
        return vec2(self.x + v, self.y + v)
      end
    end,
    __sub = function(self, v)
      if typeof(v) == "vec2" then
        return vec2(self.x - v.x, self.y - v.y)
      else
        return vec2(self.x - v, self.y - v)
      end
    end,
    __mul = function(self, v)
      if typeof(v) == "vec2" then
        return vec2(self.x * v.x, self.y * v.y)
      else
        return vec2(self.x * v, self.y * v)
      end
    end,
    __div = function(self, v) end,
    __mod = function(self, v)
      if typeof(v) == "vec2" then
        return vec2(self.x % v.x, self.y % v.y)
      else
        return vec2(self.x % v, self.y % v)
      end
    end,
    __unm = function(self)
      return vec2(-self.x, -self.y)
    end,
    __eq = function(self, v)
      if typeof(v) == "vec2" then
        if self.x == v.x and self.y == v.y then
          return true
        else
          return false
        end
      else
        if self.x + self.y == v then
          return true
        else
          return false
        end
      end
    end,
    __lt = function(self, v)
      if typeof(v) == "vec2" then
        if self.x < v.x and self.y < v.y then
          return true
        else
          return false
        end
      else
        if self.x + self.y < v then
          return true
        else
          return false
        end
      end
    end,
    __le = function(self, v)
      if typeof(v) == "vec2" then
        if self.x <= v.x and self.y <= v.y then
          return true
        else
          return false
        end
      else
        if self.x + self.y <= v then
          return true
        else
          return false
        end
      end
    end,
    __concat = function(self, v)
      if typeof(v) == "vec2" then
        return vec2(tonumber(tostring(self.x) .. tostring(v.x)), tonumber(tostring(self.y) .. tostring(v.y)))
      else
        return vec2(tonumber(tostring(self.x) .. tostring(v)), tonumber(tostring(self.y) .. tostring(v)))
      end
    end,
    __len = function(self)
      return self.x + self.y
    end,
    __tostring = function(self)
      return "(" .. tostring(self.x) .. "," .. tostring(self.y) .. ")"
    end,
    distance = function(self, v)
      return math.sqrt(((self.x - v.x) ^ 2) + ((self.y - v.y) ^ 2))
    end,
    middle = function(self, v)
      return vec2((self.x + v.x) / 2, (self.y + v.y) / 2)
    end,
    clone = function(self)
      return self
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, x, y)
      self.x, self.y = x, y
    end,
    __base = _base_0,
    __name = "vec2"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  if typeof(v) == "vec2" then
    vec2(self.x / v.x, self.y / v.y)
  else
    vec2(self.x / v, self.y / v)
  end
  vec2 = _class_0
end
return {
  vec2 = vec2
}
