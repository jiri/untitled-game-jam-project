local items = require("items")

love.graphics.setDefaultFilter("nearest", "nearest", 1)

local enemies =
{
  fire_boss = {
    id = "fire_boss",
    name = "Fire Boss",
    sprite = love.graphics.newImage("gfx/fire_boss.png"),
    drops = {
      default = nil,
    }
  },
  fire_boss_weak = {
    id = "fire_boss_weak",
    name = "Fire Boss (Weak)",
    sprite = love.graphics.newImage("gfx/fire_boss_weak.png"),
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
  shield_sword_guy = {
    id = "shield_sword_guy",
    name = "Shield + Sword Guy",
    drops = {
      rocket_launcher = items.laser_sword,
      default = nil
    }
  },
  metal_android = {
    id = "metal_android",
    name = "Metal Android",
    drops = {
      tazer = items.fire_bomb,
      default = nil,
    }
  },
  rocket_guy = {
    id = "rocket_guy",
    name = "Rocket Guy",
    drops = {
      gun = items.rocket_launcher,
      default = nil,
    }
  },
  security_guard = {
    id = "security_guard",
    name = "Security Guard",
    sprite = love.graphics.newImage("gfx/guard.png"),
    drops = {
      spanner = items.tazer,
      default = nil,
    }
  },
}

return enemies