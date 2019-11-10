local renderer = {}

renderer.get_enemy_bounding_boxes = function(state)
  local bounding_boxes = {}

  local x = 100
  local y = 300 - 48

  local width = 100
  local height = 100

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


renderer.get_item_bounding_boxes = function(state)
  local bounding_boxes = {}

  local x = 100
  local y = love.graphics.getHeight() - 150

  local width = 100
  local height = 100

  for item, quantity in pairs(state.items) do
    table.insert(bounding_boxes,
      {
        box = {x, y, width, height},
        item = item,
        quantity = quantity
      })
    x = x + 50 + width
  end

  return bounding_boxes
end


renderer.render_state = function(state)
  for _, enemy_data in pairs(renderer.get_enemy_bounding_boxes(state)) do
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("fill", enemy_data.box[1], enemy_data.box[2], enemy_data.box[3], enemy_data.box[4])
    love.graphics.draw(enemy_data.enemy.sprite, enemy_data.box[1], enemy_data.box[2], 0, 2, 2)
    love.graphics.print(enemy_data.enemy.name, enemy_data.box[1], enemy_data.box[2] + enemy_data.box[3])
  end

  for _, item_data in pairs(renderer.get_item_bounding_boxes(state)) do
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("fill", item_data.box[1], item_data.box[2], item_data.box[3], item_data.box[4])
    love.graphics.print(item_data.item .. "  " .. item_data.quantity, item_data.box[1], item_data.box[2] + item_data.box[3])
  end
end

return renderer