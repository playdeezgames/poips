local saveFile = sys.get_save_file("TGGD_Poips", "options")

local saveOptions = function()
	local data = {}
	data.masterGain = sound.get_group_gain("master")
	sys.save(saveFile, data)
end

local loadOptions = function()
	local data = sys.load(saveFile)
	if data.masterGain ~= nil then
		sound.set_group_gain("master", data.masterGain)
	end
end

local module = {}

module.saveOptions = saveOptions

module.loadOptions = loadOptions

return module