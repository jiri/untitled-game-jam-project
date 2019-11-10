local items = require("items")

love.graphics.setDefaultFilter("nearest", "nearest", 1)

local enemies =
{
  fire_boss = {
    id = "fire_boss",
    name = "Fire Boss",
    sprite = love.graphics.newImage("gfx/fire_boss.png"),
    immune_to = {
      'rock',
      'laser_sword'
    },
    drops = {
      default = nil,
    }
  },
  fire_boss_weak = {
    id = "fire_boss_weak",
    name = "Fire Boss (Weak)",
    sprite = love.graphics.newImage("gfx/fire_boss_weak.png"),
    immune_to = {
      'rock'
    },
    drops = {
      laser_sword = items.magic_key,
      default = nil,
    }
  },
  snowman = {
    id = "snowman",
    name = "Snowman",
    sprite = love.graphics.newImage("gfx/snowman.png"),
    drops = {
      fire_bomb = items.water_bucket,
      default = items.carrot,
    }
  },
  shield_sword_guy = {
    id = "shield_sword_guy",
    name = "Shield + Sword Guy",
    sprite = love.graphics.newImage("gfx/sword_guy.png"),
    immune_to = {
      'fist',
      'tazer',
      'gun',
    },
    drops = {
      rocket_launcher = items.laser_sword,
      default = nil
    }
  },
  metal_android = {
    id = "metal_android",
    name = "Metal Android",
    sprite = love.graphics.newImage("gfx/android.png"),
    immune_to = {
      'gun',
      'spanner',
    },
    drops = {
      rocket_launcher = items.fire_bomb,
      tazer = items.fire_bomb,
      default = nil,
    }
  },
  rocket_guy = {
    id = "rocket_guy",
    name = "Rocket Guy",
    immune_to = {
      'rock',
      'spanner',
      'tazer',
    },
    sprite = love.graphics.newImage("gfx/rocket_guy.png"),
    drops = {
      gun = items.rocket_launcher,
      default = nil,
    }
  },
  security_guard = {
    id = "security_guard",
    name = "Security Guard",
    immune_to = {
      'rock'
    },
    sprite = love.graphics.newImage("gfx/guard.png"),
    drops = {
      spanner = items.tazer,
      gun = items.tazer,
      rock = items.rock,
      default = nil,
    }
  },
  minion = {
    id = "minion",
    name = "Minion",
    sprite = love.graphics.newImage("gfx/minion.png"),
    drops = {
      rock = items.rock,
      default = nil
    }
  }
}

return enemies