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
    if not @static
      @x = (@x + @xvel)
      @y = (@y + @yvel) + G.gravity
      @xvel = @xvel * (1 - math.min(dt*G.friction, 1))
      @yvel = @yvel * (1 - math.min(dt*G.friction, 1))
      if @x > G.width-@w then @x = G.width-@w elseif @x <= 0 then @x = 0
      if @y > G.height-@h then
        @y = G.height-@h 
      elseif @y <= 0 then
        @y = 0
        @yvel = 0
  draw: () =>
    @canvas\drawRect 0,0,@w,@h
    @screen\copyPixels @canvas,@x,@y,nil
    return 0

class player extends entity
  new:(color,...) =>
    super ...
    @canvas\setColor unpack color
    math.randomseed os.time!
    @@talkw =  {"Hi","Hello","What?","Bye"}
  update: (dt) =>
    @dt = dt
    super dt
    if juno.keyboard.isDown("right") and @xvel < 100 then @xvel = @xvel + @speed * dt
    if juno.keyboard.isDown("left") and @xvel > -100 then @xvel = @xvel - @speed * dt
  draw: () =>
    super!
  key: (k) =>
    if k == "x" and @yvel > -100 then @yvel -= (300 + @speed)*@dt
    for _ in *G.background do
      if (@x >= _.x and @x < _.x+_.w) or (@x+@w >= _.x and @x+@w < _.x+_.w)
        if (@y >= _.y and @y < _.y+_.h) or @y+@h >= _.y and @y+@h < _.y+_.h
          if k == "down" then _\talk @@talkw[math.random #@@talkw]
class npc extends entity
  new:(color,...) =>
    super ...
    @canvas\setColor unpack color
  update: (dt) =>
    super dt
  draw: () =>
    super!
  talk: (str = "Hello I'm #{@name}") =>
    print "[#{@name}]:#{str}"

{:entity,:player,:npc}
