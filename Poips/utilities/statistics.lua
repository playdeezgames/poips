local data = {}
data.gamesPlayed = 0
data.totalMoves = 0
data.totalTime = 0

local module = {}

function module.addStatistics(moves,gameTime)
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

function module.getGamesPlayed()
	return data.gamesPlayed
end

function module.setGamesPlayed(value)
	data.gamesPlayed = value
end

function module.getTotalMoves()
	return data.totalMoves
end

function module.setTotalMoves(value)
	data.totalMoves = value
end

function module.getTotalTime()
	return data.totalTime
end

function module.setTotalTime(value)
	data.totalTime = value
end

function module.getBestTime()
	return data.bestTime
end

function module.setBestTime(value)
	data.bestTime = value
end

function module.getBestMoves()
	return data.bestMoves
end

function module.setBestMoves(value)
	data.bestMoves = value
end

return module