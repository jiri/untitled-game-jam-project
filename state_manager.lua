local enemies = require("enemies")
local level_data = require("level_data")
local items = require("items")

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
    items = {}
  }
end

game_state.set_level = function(state, level_number)
  state.level_number = level_number
  state.enemies = deepcopy(level_data.levels[level_number].enemies)
  if level_data.levels[level_number].items then
    state.items = deepcopy(level_data.levels[level_number].items)

  end
end

game_state.use_item = function(state, item, enemy)
  assert(state.items[item.id] and state.items[item.id] > 0)

  state.items[item.id] = state.items[item.id] - 1
  local drop = enemy.drops[item.id]
  if drop == nil then drop = enemy.drops['default'] end
  --print(drop.id)
  if drop and state.items[drop.id] then
    state.items[drop.id] = state.items[drop.id] + 1
    print("got dropped item "..drop.id)
  elseif drop then
    state.items[drop.id] = 1
    print("got dropped item "..drop.id)
  end
  if state.items[item.id] == 0  then
    state.items[item.id] = nil
  end


  local killed = true
  if enemy.immune_to then
    for _, immunity in ipairs(enemy.immune_to) do
      if immunity == item.id then
        killed = false
      end
    end
  end

  if killed then
    if enemy.id == "fire_boss" and item.id == "water_bucket" then
      table.insert(state.enemies, enemies.fire_boss_weak)
      print("boss extinguished")
    else
      print("killed target")
    end
    remove_str_from_table(enemy, state.enemies)

    if #state.enemies == 0 and state.level_number + 1 < 6 then
      print("Next Level")
      game_state.set_level(state,state.level_number + 1)
    end
  end

  local item_count = 0
  for _, item in pairs(state.items) do
    item_count = item_count + 1
  end

  if item_count == 0 then
    print("Game Over")
    game_state.set_level(state,1)
  end

end

return game_state