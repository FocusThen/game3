function distanceBetween(x1, y1, x2, y2)
	return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function setWhite()
	love.graphics.setColor(1, 1, 1, 1)
end

function deepCopy(original)
	local copy = {}
	for key, value in pairs(original) do
		if type(value) == "table" then
			copy[key] = deepCopy(value) -- Recursively copy nested tables
		else
			copy[key] = value
		end
	end
	return copy
end
