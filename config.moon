export G = {
  title:"mint"
  width: 256
  height: 256
  scale: 4
  font: juno.Font.fromEmbedded 16
  gravity: 1.5
  friction: 7
  background: {}
  foreground: {}
  solid: {}
  lume: require "lib.lume"
  coil: require "lib.coil"
  flux: require "lib.flux"
  tick: require "lib.tick"
  bump: require "lib.bump"
  unpack: table.unpack
  pack: (...) -> {...}
}
{
  title: G.title
  width: G.width * G.scale
  height: G.height * G.scale
}
