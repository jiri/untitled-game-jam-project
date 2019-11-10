love.graphics.setDefaultFilter("nearest", "nearest", 1)

local items =
{
  magic_key = {
    id = "magic_key",
    name = "Magic Key",
    sprite = love.graphics.newImage("gfx/magic_key.png"),
  },
  laser_sword = {
    id = "laser_sword",
    name = "Laser Sword",
    sprite = love.graphics.newImage("gfx/sword.png"),
  },
  water = {
    id = "water",
    name = "Water",
    sprite = love.graphics.newImage("gfx/water.png"),
  },
  rocket_launcher = {
    id = "rocket_launcher",
    name = "Rocket Launcher",
    sprite = love.graphics.newImage("gfx/bazooka.png"),
  },
  fire_bomb = {
    id = "fire_bomb",
    name = "Fire Bomb",
    sprite = love.graphics.newImage("gfx/fire_bomb.png"),
  },
  tazer = {
    id = "tazer",
    name = "Tazer",
    sprite = love.graphics.newImage("gfx/tazer.png"),
  },
  gun = {
    id = "gun",
    name = "Gun",
    sprite = love.graphics.newImage("gfx/gun.png"),
  },
  spanner = {
    id = "spanner",
    name = "Spanner",
    sprite = love.graphics.newImage("gfx/spanner.png"),
  },
  carrot = {
    id = "carrot",
    name = "Carrot",
    sprite = love.graphics.newImage("gfx/carrot.png"),
  },
  rock = {
    id = "rock",
    name = "Rock",
    sprite = love.graphics.newImage("gfx/rock.png"),
  }
}

return items