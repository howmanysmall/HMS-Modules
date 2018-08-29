local Resources = require(game:GetService("ReplicatedStorage"):WaitForChild("Resources"))
local Debug = Resources:LoadLibrary("Debug")

local GeneralMath = { }

GeneralMath.Factorial = setmetatable({ [0] = 1 }, {
	__call = function(Table, Number)
		if Number < 0 then return 0 end
		if not Table[Number] then Table[Number] = Number * Table(Number - 1) end
		return Table[Number]
	end
})

function GeneralMath.Cbrt(Number)
	return Number ^ 0.33333333333333
end

function GeneralMath.Hypot(X, Y)
	return (X * X + Y * Y) ^ 0.5
end

function GeneralMath.IsFinite(Number)
	return Number == Number and Number ~= 1 / 0 and Number ~= -1 / 0
end

function GeneralMath.GCD(X, Y)
	return X == 0 and Y or GeneralMath.GCD(Y % X, X)
end

function GeneralMath.Factors(Number)
	local Factors = { }
	for Index = 1, Number / 2 do
		if Number % Index == 0 then
			Factors[#Factors + 1] = Index
		end
	end
	Factors[#Factors + 1] = Number
	return Factors
end

function GeneralMath.IsEven(Number)
	return Number % 2 == 0
end

function GeneralMath.Mid2D(VectorOne, VectorTwo)
	Debug.Assert(typeof(VectorOne) == "Vector2", "\"VectorOne\" is not a \"Vector2\"; instead got a: %s", typeof(VectorOne))
	Debug.Assert(typeof(VectorTwo) == "Vector2", "\"VectorTwo\" is not a \"Vector2\"; instead got a: %s", typeof(VectorTwo))
	local MidX = (VectorOne.X + VectorTwo.X) / 2
	local MidY = (VectorOne.Y + VectorTwo.Y) / 2
	return Vector2.new(MidX, MidY)
end

function GeneralMath.Mid3D(VectorOne, VectorTwo)
	Debug.Assert(typeof(VectorOne) == "Vector3", "\"VectorOne\" is not a \"Vector3\"; instead got a: %s", typeof(VectorOne))
	Debug.Assert(typeof(VectorTwo) == "Vector3", "\"VectorTwo\" is not a \"Vector3\"; instead got a: %s", typeof(VectorTwo))
	local MidX = (VectorOne.X + VectorTwo.X) / 2
	local MidY = (VectorOne.Y + VectorTwo.Y) / 2
	local MidZ = (VectorOne.Z + VectorTwo.Z) / 2
	return Vector3.new(MidX, MidY, MidZ)
end

return GeneralMath
