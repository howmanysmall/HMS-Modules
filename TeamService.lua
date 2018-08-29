local TeamService = { }
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")

local Resources = require(ReplicatedStorage:WaitForChild("Resources"))
local Make = Resources:LoadLibrary("Make")

local BalanceTable = { }
local LengthTable = { }

local MAX = math.max
local MIN = math.min
local RANDOM = math.random
local REMOVE = table.remove
local TICK = tick

math.randomseed(TICK() % 1 * 1E7)

function TeamService.new(Properties)
	local Team = Make("Team")(Properties)
	Team.Parent = Teams
	return Team
end

function TeamService:GetSmallestTeam(TeamsTable)
	local NumberPlayers, SmallestTeam = 1 / 0
	for Team, Players in next, TeamsTable do
		if #Players < NumberPlayers then
			NumberPlayers = #Players
			SmallestTeam = Team
		end
	end
	return SmallestTeam
end

function TeamService:BalanceTeams()
	local AllTeams = Teams:GetTeams()
	local AllPlayers = Players:GetPlayers()

	BalanceTable = { }
	LengthTable = { }

	for Index = 1, #AllPlayers do
		local Player = AllPlayers[Index]
		if not BalanceTable[Player.TeamColor.Name] then
			BalanceTable[Player.TeamColor.Name] = { }
		end
		BalanceTable[Player.TeamColor.Name][#BalanceTable[Player.TeamColor.Name] + 1] = Player
		LengthTable[Player.TeamColor.Name] = #BalanceTable[Player.TeamColor.Name]
	end

	local Max = MAX(unpack(LengthTable))
	local Min = MIN(unpack(LengthTable))

	for _, Team in next, BalanceTable do
		for Index, Value in next, Team do
			if #BalanceTable[Value.TeamColor.Name] == Max and #BalanceTable[Value.TeamColor.Name] ~= Min then
				REMOVE(Team, Index)
				Value.TeamColor = AllTeams[RANDOM(#AllTeams)].TeamColor
				BalanceTable[Value.TeamColor.Name][#BalanceTable[Value.TeamColor.Name] + 1] = Value
			end
		end
	end

	return LengthTable, BalanceTable, Min, Max
end

return TeamService
