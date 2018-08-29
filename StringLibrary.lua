local StringLibrary = { }
local MATCH = string.match
local GSUB = string.gsub

-- Credit to Crazyman32 for these next two functions.
function StringLibrary.GetNumberFromString(String)
	if not String or type(String) ~= "string" then return String and type(String) == "number" and String or 0 end
	return tonumber(String) or tonumber(MATCH(String, "%-?%d+%.?%d*")) or 0
end

function StringLibrary.PositiveInteger(String)
	return GSUB(String, "%D+", "")
end

function StringLibrary.ClampNumber(String, Min, Max)
	if type(Min) == "number" and type(Max) == "number" then
		local Number = StringLibrary.GetNumberFromString(String)
		return tostring(math.clamp(Number, Min, Max))
	end
end

return StringLibrary
