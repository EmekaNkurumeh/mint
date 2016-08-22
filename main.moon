import player,npc from require "entity"

juno.onLoad = (dt) ->
  G.canvas = juno.Buffer.fromBlank 128,128
  export mc = player name:"Josh",x:16,y:16,screen:G.canvas,static:false
  export npc1 = npc name:"Mr.Red",x:64,y:32,screen:G.canvas,static:true
  export npc2 = npc name:"Mr.Blue",x:32,y:64,screen:G.canvas,static:true
  return 0
  

juno.onUpdate = (dt) ->
  mc\update dt
  npc1\update dt
  npc2\update dt
  return 0
  

juno.onDraw = (dt) ->
  --juno.graphics.copyPixels G.canvas,0,0,nil,G.scale
  mc\draw dt
  npc1\draw dt
  npc2\draw dt
  return 0