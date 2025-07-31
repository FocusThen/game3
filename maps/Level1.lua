return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 10,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 8,
  nextobjectid = 2,
  properties = {},
  tilesets = {
    {
      name = "game3",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "../assets/sprites/world_tileset.png",
      imagewidth = 256,
      imageheight = 256,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 256,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 10,
      id = 1,
      name = "Base",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        145, 145, 145, 145, 177, 177, 177, 177, 177, 177, 177, 177, 177, 145, 145, 145, 177, 177, 177, 177, 177, 177, 177, 177, 177, 145, 145, 145, 177, 177,
        161, 161, 161, 161, 177, 177, 177, 145, 145, 145, 177, 177, 177, 161, 161, 161, 177, 177, 177, 145, 145, 145, 177, 177, 177, 161, 161, 161, 177, 177,
        177, 177, 177, 177, 177, 177, 177, 161, 161, 161, 177, 177, 177, 177, 177, 177, 177, 177, 177, 161, 161, 161, 177, 177, 177, 177, 177, 177, 177, 177,
        177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177,
        177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177,
        177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177,
        177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177,
        177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177, 177,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        18, 17, 2, 2, 17, 17, 17, 17, 2, 17, 17, 17, 18, 18, 17, 17, 17, 2, 17, 2, 17, 17, 17, 2, 17, 17, 17, 2, 18, 17
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "Walls",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {
        ["type"] = "ground"
      },
      objects = {
        {
          id = 1,
          name = "Ground",
          type = "ground",
          shape = "rectangle",
          x = 0.793076,
          y = 126.969,
          width = 478.313,
          height = 16.5281,
          rotation = 0,
          visible = true,
          properties = {
            ["type"] = "ground"
          }
        }
      }
    }
  }
}
