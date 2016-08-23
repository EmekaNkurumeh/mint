import player,npc from require "entity"

juno.onLoad = (dt) ->
  G.canvas = juno.Buffer.fromBlank 128,128
  export mc = player "Josh",G.canvas,0,0,8,8,false
  export npc1 = npc "Mr.Red",G.canvas,15,19,8,8,true
  export npc2 = npc "Mr.Blue",G.canvas,24,13,8,8,true
  return 0


juno.onUpdate = (dt) ->
  mc\update dt
  npc1\update dt
  npc2\update dt
  return 0


juno.onDraw = (dt) ->
  mc\draw dt
  npc1\draw dt
  npc2\draw dt
  juno.graphics.copyPixels G.canvas,0,0,nil,G.scale
  G.canvas\clear!
  return 0
