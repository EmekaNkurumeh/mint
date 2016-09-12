class entity
  new: (@name,@screen,@xy,@w,@h,@static) =>
    @xy *= G.scale
    if not @static
      @speed = 15
      @xvel = 0
      @yvel = 0
    @canvas = juno.Buffer.fromBlank @w,@h
  update: (dt) =>
    G.coil.update dt
    G.tick.update dt
    G.flux.update dt
    if not @static
      @xy.x += @xvel
      @xy.y += @yvel + G.gravity
      @xvel = @xvel * (1 - math.min(dt*G.friction, 1))
      @yvel = @yvel * (1 - math.min(dt*G.friction, 1))
      if @xy.x > G.width-@w then @xy.x = G.width-@w elseif @xy.x <= 0 then @xy.x = 0
      if @xy.y > G.height-@h then
        @xy.y = G.height-@h
      elseif @xy.y <= 0 then
        @xy.y = 0
        @yvel = 0
  draw: () =>
    @canvas\drawRect 0,0,@w,@h
    @screen\copyPixels @canvas,@xy.x,@xy.y,nil
    return 0

class player extends entity
  new:(color,@health,...) =>
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
  attack: (amount,critical,e) =>
    if math.random(100) > math.random(100)
      amount *= critical
    e.health -= amount

  key: (k) =>
    if k == "x" and @yvel > -100 then @yvel -= (300 + @speed)*@dt
    for _ in *G.background do
      if (@xy.x >= _.xy.x and @xy.x < _.xy.x+_.w) or (@xy.x+@w >= _.xy.x and @xy.x+@w < _.xy.x+_.w)
        if (@xy.y >= _.xy.y and @xy.y < _.xy.y+_.h) or @xy.y+@h >= _.xy.y and @xy.y+@h < _.xy.y+_.h
          if k == "down" then _\talk @@talkw[math.random #@@talkw]

class enemy extends entity
  new:(color,@health,@sight,...)=>
    super ...
    @canvas\setColor unpack color
  update: (dt,p) =>
    super dt
    if @xy\distance(p.xy) < @sight
      @attack(5,0.3,p)

  draw: () =>
    super!
  attack: (amount,critical,e) =>
    if math.random(100) > math.random(100)
      amount *= critical
    e.health -= amount


class npc extends entity
  new:(color,...) =>
    super ...
    @canvas\setColor unpack color
  update: (dt) =>
    super dt
  draw: () =>
    super!
  talk: (str = "Hello I'm #{@name}") =>
    G.coil.add( ->
      for i=1,#"#{str}"
        c = str\sub i,i
        print c
        G.coil.wait 0.35
    )

{:entity,:player,:npc}
