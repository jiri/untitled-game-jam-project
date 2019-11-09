local renderer = require("renderer")
local state_manager = require("state_manager")

local state

function love.load()
  state = state_manager.create()
  state_manager.set_level(state, 1)
end

function love.draw()
  renderer.render_state(state)
end
