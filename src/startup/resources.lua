sprites = {}

sprites.playerSheet = love.graphics.newImage("assets/sprites/knight.png")

-- since fonts are influenced by scale, they need to be re-initialized when the scale changes
function initFonts()
	fonts = {}
	fonts.text = love.graphics.newFont("assets/fonts/PixelOperator8.ttf", 16 * scale)
	fonts.debug = love.graphics.newFont(10 * scale)
end
initFonts()
