import player,npc from require "entity"

juno.onLoad = (dt) ->
  G.canvas = juno.Buffer.fromBlank 128,128
  juno.debug.setVisible true
  export mc = player {0,1,0},"Josh",G.canvas,0,16,8,8,false
  export npc1 = npc {1,0,0},"Mr.Red",G.canvas,15,19,8,8,true
  export npc2 = npc {0,0,1},"Mr.Blue",G.canvas,24,13,8,8,true
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

juno.onKeyDown = (k) ->
  mc\key k
