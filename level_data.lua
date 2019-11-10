local enemies = require("enemies")

local level_data = {}

love.graphics.setDefaultFilter("nearest", "nearest", 1)

level_data.levels =
{
  {
    enemies = {enemies.security_guard, enemies.security_guard, enemies.minion, enemies.minion, enemies.minion},
    sprite = love.graphics.newImage("gfx/levels/first_room.png"),
  },
  {
    enemies = {enemies.rocket_guy, enemies.minion, enemies.minion, enemies.minion, enemies.minion},
    sprite = love.graphics.newImage("gfx/levels/second_room.png"),
  },
  {
    enemies = {enemies.metal_android},
  },
  {
    enemies = {enemies.shield_sword_guy},
  },
  {
    enemies = {enemies.snowman},
  },
  {
    enemies = {enemies.fire_boss},
    sprite = love.graphics.newImage("gfx/levels/fire_boss_room.png"),
  },
}

return level_data