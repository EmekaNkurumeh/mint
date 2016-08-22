export G = {
  title:"mint"
  width: 128
  height: 128
  scale: 4
  font: juno.Font.fromEmbedded 16
}
{
  title: G.title
  width: G.width * G.scale
  height: G.height * G.scale
}