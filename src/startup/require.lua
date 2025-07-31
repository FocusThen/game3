function requireAll()
  require("src/startup/collisionClasses")
  createCollisionClasses()

  require("src/startup/resources")

  require("src/utils/cam")
  -- require("src/utils/destroyAll")

  require("src/player")
  require("src/update")
  require("src/draw")


  require("src/levels/loadMap")
  require("src/levels/wall")

  -- require("src/effects/effect")
end
