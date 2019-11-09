local items = require("items")

local enemies =
{
  fire_boss = {
    id = "fire_boss",
    name = "Fire Boss",
    drops = {
      default = nil,
    }
  },
  fire_boss_weak = {
    id = "fire_boss_weak",
    name = "Fire Boss (Weak)",
    drops = {
      laser_sword = items.magic_key,
      default = nil,
    }
  },
  snowman = {
    id = "snowman",
    name = "Snowman",
    drops = {
      fire_bomb = items.water_bucket,
      default = items.carrot,
    }
  },

  -- TODO: this
  shield_sword_guy = {
    id = "shield_sword_guy",
    name = "Shield + Sword Guy",
  },
  metal_android = {
    id = "metal_android",
    name = "Metal Android",
  },
  rocket_guy = {
    id = "rocket_guy",
    name = "Rocket Guy",
  },
  security_guard = {
    id = "security_guard",
    name = "Security Guard",
  },
}

return enemies