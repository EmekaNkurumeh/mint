export G = {
  title:"mint"
  width: 128
  height: 128
  scale: 4
  font: juno.Font.fromEmbedded 16
  gravity: 1.5
  friction: 4
  background: {}
  foreground: {}
  solid: {}
  lib: {
   lume: require "lib.lume"
   coil: require "lib.coil"
   flux: require "lib.flux"
   tick: require "lib.tick"
  }
}
{
  title: G.title
  width: G.width * G.scale
  height: G.height * G.scale
}
