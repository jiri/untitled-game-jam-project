local renderer = require("renderer")
local state_manager = require("state_manager")
local mouse_cursor = require("mouse_cursor")

local state

function love.load()
  state = state_manager.create()
  state_manager.set_level(state, 6)
end

function love.draw()
  renderer.render_state(state)
  mouse_cursor.draw()
end

function love.mousepressed(x,y,button)
  mouse_cursor.mousepressed(x,y,button)
end

function love.mousereleased(x,y,button)
  mouse_cursor.mousereleased(x,y,button)
end