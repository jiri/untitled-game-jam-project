local renderer = require('renderer')
local state_manager = require('state_manager')
local cursor = {}

is_mouse_down = false
mouse_contents = nil

local is_position_in_box = function(x,y,box)
  local bx,by,bw,bh = box[1],box[2],box[3],box[4]
  return x > bx and y > by and
  x < bx+bw and y < by+bh
end

local find_colliding_from_boxes = function(x,y,things)
  for _, thing in ipairs(things) do
    if is_position_in_box(x,y,thing.box) then
      return thing
    end
  end
  return nil
end

cursor.mousepressed = function(state,x,y,button)
  if button == 1 then
    local items = renderer.get_item_bounding_boxes(state)
    local colliding_box = find_colliding_from_boxes(x,y,items)
    is_mouse_down = true
    print("mouse pressed")
    if mouse_contents == nil and colliding_box then
      mouse_contents = colliding_box
    end
  end
end

cursor.mousereleased = function(state,x,y,button)
  if button == 1 then
    local enemies = renderer.get_enemy_bounding_boxes(state)
    local colliding_box = find_colliding_from_boxes(x,y,enemies)
    is_mouse_down = false
    print("mouse released")
    if mouse_contents and colliding_box then
      print("used "..mouse_contents.item.name.." on "..colliding_box.enemy.name)
      state_manager.use_item(state,mouse_contents.item,colliding_box.enemy)
      mouse_contents = nil
    elseif mouse_contents then
      mouse_contents = nil
    end
  end
end

cursor.draw_hover = function(item,color)
  love.graphics.setColor(color)
  love.graphics.rectangle('line',item.box[1]-3,item.box[2]-3,item.box[3]+6,item.box[4]+6)
  love.graphics.setColor(255,255,255)
end

cursor.draw = function(state)
  local mx,my = love.mouse.getPosition()
  if mouse_contents == nil then
    local items = renderer.get_item_bounding_boxes(state)
    local colliding_box = find_colliding_from_boxes(mx,my,items)
    if colliding_box then
      --draw highlight if hovering an items
      cursor.draw_hover(colliding_box,{255,125,0})
    end
  else
    local enemies = renderer.get_enemy_bounding_boxes(state)
    local colliding_box = find_colliding_from_boxes(mx,my,enemies)
    if colliding_box then
      --draw highlight if hovering enemy
      cursor.draw_hover(colliding_box,{255,125,0})
    end

    --draw contents of hand
  end
end

return cursor