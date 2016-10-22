import entity,player,npc from require "entity"

juno.onLoad = (dt) ->
  G.canvas = juno.Buffer.fromBlank 128,128
  juno.debug.setVisible true
  table.insert(G.background,npc({1,0,0},50,"Mr.Red",G.canvas,15,19,8,8,false))
  table.insert(G.background,npc({0,0,1},50,"Mr.Blue",G.canvas,24,13,8,8,false))
  table.insert(G.foreground,player({0,1,0},50,"Josh",G.canvas,0,16,8,8,false))
  return 0

juno.onUpdate = (dt) ->
  for e in *G.background do
    e\update dt
  for e in *G.foreground do
    e\update dt
  return 0


juno.onDraw = () ->
  for e in *G.background do
    e\draw!
  for e in *G.foreground do
    e\draw!
  juno.graphics.copyPixels G.canvas,0,0,nil,G.scale
  G.canvas\clear!
  return 0

juno.onKeyDown = (k) ->
  if k == "escape" then os.exit!
  G.foreground[1]\key k
