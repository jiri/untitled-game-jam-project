local level_data = require("level_data")
local enemies = require("enemies")
local items = require("items")

local renderer = {}

local font = love.graphics.newFont("Vera.ttf")

local sprite_scale = 6
local background_scale = 2

function render_text(text, x, y)
  local txt = love.graphics.newText(font, text)
  local w, h = txt:getDimensions()

  love.graphics.setColor(0,0,0,0.5)
  love.graphics.rectangle("fill", x, y, w, h)
  love.graphics.setColor(1,1,1,1)
  love.graphics.draw(txt, x, y)
end

renderer.get_enemy_bounding_boxes = function(state)
  local bounding_boxes = {}

  local x = 50
  local y = 100 - 48

  local width = 16 * sprite_scale
  local height = 24 * sprite_scale

  for _, enemy in pairs(state.enemies) do
    table.insert(bounding_boxes,
      {
        box = {x, y, width, height},
        enemy = enemy,
      })
    x = x + 50 + width
  end

  return bounding_boxes
end

renderer.draw_contents = function(x,y,item)
  love.graphics.draw(item.sprite,x,y, 0, sprite_scale, sprite_scale)
end

renderer.get_item_bounding_boxes = function(state)
  local bounding_boxes = {}

  local width = 16 * sprite_scale
  local height = 16 * sprite_scale

  local x = 50
  local y = love.graphics.getHeight() - height - 100

  for item_id, quantity in pairs(state.items) do
    table.insert(bounding_boxes,
      {
        box = {x, y, width, height},
        item = items[item_id],
        quantity = quantity
      })
    x = x + 50 + width
  end

  return bounding_boxes
end


renderer.render_state = function(state)
  love.graphics.setColor(1,1,1,1)
  love.graphics.draw(level_data.levels[state.level_number].sprite, 0, 0, 0, background_scale, background_scale)

  for _, enemy_data in pairs(renderer.get_enemy_bounding_boxes(state)) do
    love.graphics.setColor(1,1,1,1)
    --love.graphics.rectangle("fill", enemy_data.box[1], enemy_data.box[2], enemy_data.box[3], enemy_data.box[4])
    love.graphics.draw(enemy_data.enemy.sprite, enemy_data.box[1], enemy_data.box[2], 0, sprite_scale, sprite_scale)

    render_text(enemy_data.enemy.name, enemy_data.box[1], enemy_data.box[2] + enemy_data.box[4])
  end

  for _, item_data in pairs(renderer.get_item_bounding_boxes(state)) do
    love.graphics.setColor(1,1,1,1)
    --love.graphics.rectangle("fill", item_data.box[1], item_data.box[2], item_data.box[3], item_data.box[4])
    love.graphics.draw(item_data.item.sprite, item_data.box[1], item_data.box[2], 0, sprite_scale, sprite_scale)
    render_text(item_data.item.name .. "  " .. item_data.quantity, item_data.box[1], item_data.box[2] + item_data.box[4])
  end
end

return renderer