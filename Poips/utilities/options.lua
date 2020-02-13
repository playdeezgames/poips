local statistics = require("utilities.statistics")
local saveFile = sys.get_save_file("TGGD_Poips", "options")

local saveOptions = function()
	local data = {}
	data.masterGain = sound.get_group_gain("master")
	data.gamesPlayed = statistics.getGamesPlayed()
	data.totalMoves = statistics.getTotalMoves()
	data.totalTime = statistics.getTotalTime()
	data.bestTime = statistics.getBestTime()
	data.bestMoves = statistics.getBestMoves()
	sys.save(saveFile, data)
end

local loadOptions = function()
	local data = sys.load(saveFile)
	if data.masterGain ~= nil then
		sound.set_group_gain("master", data.masterGain)
	end
	if data.gamesPlayed ~= nil then
		statistics.setGamesPlayed(data.gamesPlayed)
	end
	if data.totalMoves ~= nil then
		statistics.setTotalMoves(data.totalMoves)
	end
	if data.totalTime ~= nil then
		statistics.setTotalTime(data.totalTime)
	end
	if data.bestTime ~= nil then
		statistics.setBestTime(data.bestTime)
	end
	if data.bestMoves ~= nil then
		statistics.setBestMoves(data.bestMoves)
	end
end

local module = {}

module.saveOptions = saveOptions

module.loadOptions = loadOptions

return module