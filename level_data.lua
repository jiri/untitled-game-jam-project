local enemies = require("enemies")

local level_data = {}

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
  },
}

return level_data