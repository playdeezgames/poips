local data = {}
data.gamesPlayed = 0
data.totalMoves = 0
data.totalTime = 0

local module = {}

module.addStatistics = function(moves,gameTime)
	data.gamesPlayed = data.gamesPlayed + 1
	data.totalMoves = data.totalMoves + moves
	data.totalTime = data.totalTime + gameTime
	if data.gamesPlayed==1 then
		data.bestMoves = moves
		data.bestTime = gameTime
	end
	if moves < data.bestMoves then
		data.bestMoves = moves
	end
	if gameTime < data.bestTime then
		data.bestTime = gameTime
	end
end

return module