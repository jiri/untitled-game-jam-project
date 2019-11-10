local enemies = require("enemies")

local level_data = {}

level_data.levels =
{
  {
    enemies = {enemies.fire_boss},
  },
  {
    enemies = {enemies.snowman},
  },
  {
    enemies = {enemies.shield_sword_guy},
  },
  {
    enemies = {enemies.metal_android},
  },
  {
    enemies = {enemies.rocket_guy, enemies.minion, enemies.minion, enemies.minion, enemies.minion},
  },
  {
    enemies = {enemies.security_guard, enemies.security_guard, enemies.minion, enemies.minion, enemies.minion},
  },
}

return level_data