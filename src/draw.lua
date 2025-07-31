function drawCamera()
    -- if gameMap.layers["Background"] then
    --     gameMap:drawLayer(gameMap.layers["Background"])
    -- end

    if gameMap.layers["Base"] then
        gameMap:drawLayer(gameMap.layers["Base"])
    end

    player:draw()

    -- if gameMap.dark then
    --     --love.graphics.setShader(shaders.trueLight)
    --     --love.graphics.rectangle("fill", -10, -10, 10000, 10000)
    --     --love.graphics.setShader()
    --     love.graphics.draw(sprites.effects.darkness, player:getX(), player:getY(), nil, nil, nil, sprites.effects.darkness:getWidth()/2, sprites.effects.darkness:getHeight()/2)
    -- end
end

-- function drawAfterCamera()
--     curtain:draw()
--     if gamestate == 0 then return end
--     drawHUD()
--     pause:draw()
-- end
