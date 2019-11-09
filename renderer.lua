local renderer = {}

renderer.render_state = function(state)
  local x = 100
  for _, enemy in pairs(state.enemies) do
    love.graphics.draw(enemy.sprite, x, 300 - 48, 0, 2, 2)
    love.graphics.print(enemy.name, x, 300)

    x = x + 50
  end
end

return renderer