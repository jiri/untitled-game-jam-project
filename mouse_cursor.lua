local renderer = require('renderer')
local cursor = {}

is_mouse_down = false
mouse_contents = nil

local find_colliding_from_boxes = function(x,y,boxes)
  for _, box in ipairs(boxes) do
    if is_position_in_box(x,y,box) then
      return true
    end
  end
  return false
end

local is_position_in_box = function(x,y,box)
  return x > box.x and y > box.y and
  x < box.x+box.w and y < box.y+box.h
end

cursor.mousepressed = function(x,y,button)
  if button == 1 then
    local items = renderer.get_item_bounding_boxes()
    is_mouse_down = true
    print("mouse pressed")
  end
end

cursor.mousereleased = function(x,y,button)
  if button == 1 then
    local enemies = renderer.get_enemy_bounding_boxes()
    is_mouse_down = false
    print("mouse released")
  end
end

cursor.draw_hover = function(box)
  love.graphics.setColor(255,125,0)
  love.graphics.rectangle('line',box.x-2,box.y-2,box.w+4,box.h+4)
  love.graphics.setColor(255,255,255)
end

cursor.draw = function()
  local mx,my = love.mouse.getPosition()
  if mouse_contents == nil then
    local items = renderer.get_item_bounding_boxes()
    local colliding_box = find_colliding_from_boxes(mx,my,items)
    if colliding_box then
      --draw highlight if hovering an items
      cursor.draw_hover(colliding_box)
    end
  else
    --draw highlight if hovering enemy
    --draw contents of hand
  end
end

return cursor