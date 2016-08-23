class entity
  new: (@name,@screen,@x,@y,@w,@h,@static) =>
    @x *= G.scale
    @y *= G.scale
    if not @static
      @speed = 15
    @xvel = 0
    @yvel = 0
    @canvas = juno.Buffer.fromBlank @w,@h
  update: (dt) =>
    G.lib.coil.update dt
    G.lib.tick.update dt
    G.lib.flux.update dt
    @x = (@x + @xvel)
    @y = (@y + @yvel) + G.gravity
    @xvel = @xvel * (1 - math.min(dt*G.friction, 1))
    @yvel = @yvel * (1 - math.min(dt*G.friction, 1))
  draw: (dt) =>
    @canvas\drawRect 0,0,@w*G.scale,@h*G.scale
    @screen\copyPixels @canvas,@x,@y,nil
    return 0

class player extends entity
  new:(color,...) =>
    super ...
    @canvas\setColor unpack color
  update: (dt) =>
    @dt = dt
    super dt
    if juno.keyboard.isDown("right") and @xvel < 100 then @xvel = @xvel + @speed * dt
    if juno.keyboard.isDown("left") and @xvel > -100 then @xvel = @xvel - @speed * dt
  draw: (dt) =>
    super dt
  key: (k) =>
    if k == "x" and @yvel > -100 then @yvel -= (300 + @speed)*@dt
class npc extends entity
  new:(color,...) =>
    super ...
    @canvas\setColor unpack color
  update: (dt) =>
    super dt
  draw: (dt) =>
    super dt
  talk: (str = "Hello I'm #{@name}") =>

{:player,:npc}
