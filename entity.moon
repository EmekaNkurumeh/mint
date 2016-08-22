class entity
  new: (inf) =>
    @name = inf.name
    @screen = inf.screen
    @static = inf.static
    @x = inf.x
    @y = inf.y

  update: (dt) =>
    
class player extends entity
  new:(...) =>
    super ...
class npc extends entity
  new:(...) =>
    super ...
  talk: (str = "Hello I'm #{@name}") =>
{player,npc}