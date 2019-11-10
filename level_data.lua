local enemies = require("enemies")

local level_data = {}

love.graphics.setDefaultFilter("nearest", "nearest", 1)

level_data.levels =
{
  {
    enemies = {enemies.security_guard, enemies.security_guard, enemies.minion, enemies.minion, enemies.minion},
  },
  {
    enemies = {enemies.rocket_guy, enemies.minion, enemies.minion, enemies.minion, enemies.minion},
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