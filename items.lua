love.graphics.setDefaultFilter("nearest", "nearest", 1)

local items =
{
  magic_key = {
    id = "magic_key",
    name = "Magic Key",
  },
  laser_sword = {
    id = "laser_sword",
    name = "Laser Sword",
    sprite = love.graphics.newImage("gfx/sword.png"),
  },
  water = {
    id = "Water",
    name = "water",
    sprite = love.graphics.newImage("gfx/water.png"),
  },
  rocket_launcher = {
    id = "rocket_launcher",
    name = "Rocket Launcher",
  },
  fire_bomb = {
    id = "fire_bomb",
    name = "Fire Bomb",
  },
  tazer = {
    id = "tazer",
    name = "Tazer",
  },
  gun = {
    id = "gun",
    name = "Gun",
  },
  spanner = {
    id = "spanner",
    name = "Spanner",
  },
  carrot = {
    id = "carrot",
    name = "Carrot",
  },
  rock = {
    id = "rock",
    name = "Rock",
    sprite = love.graphics.newImage("gfx/rock.png"),
  }
}

return items