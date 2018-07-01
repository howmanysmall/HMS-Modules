local Color3A = { }

function Color3A.new(R, G, B, Alpha)
	if R >= 1 then R = R / 255 end
	if G >= 1 then G = G / 255 end
	if B >= 1 then B = B / 255 end
	return Color3.new(R, G, B), Alpha
end

function Color3A.fromRGBA(R, G, B, Alpha)
	return Color3.fromRGB(R, G, B), Alpha
end

return Color3A
