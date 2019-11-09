local enemies = require("enemies")
local level_data = require("level_data")

local remove_str_from_table = function(str, t)
  local index_of_str

  for i, entry in pairs(t) do
    if entry == str then
      index_of_str = i
      break
    end
  end

  if index_of_str then
    table.remove(t, index_of_str)
  end
end

function deepcopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[deepcopy(orig_key)] = deepcopy(orig_value)
    end
    setmetatable(copy, deepcopy(getmetatable(orig)))
  else -- number, string, boolean, etc
    copy = orig
  end
  return copy
end

local game_state = {}

game_state.create = function()
  return
  {
    level_number = 1,
    enemies = {},
    items = {water = 1, sword = 1, rock = 1}
  }
end

game_state.set_level = function(state, level_number)
  state.level_number = level_number
  state.enemies = deepcopy(level_data.levels[level_number].enemies)
end

game_state.use_item = function(state, item, enemy)
  assert(state.items[item] and state.items[item] > 0)

  state.items[item] = state.items[item] - 1
  drop = enemy.drops[item]
  if drop then
    state.items[drop.id] = state.items[drop.id] + 1
  end

  remove_str_from_table(enemy, state.enemies)

  if enemy.id == "fire_boss" and item.id == "water" then
    table.insert(state, "fire_boss_weak")
  end
end

return game_state