local MazeGenerator = {}

function MazeGenerator.generate(maze,directions)
	local cell = maze:getCell(math.random(maze:getColumns()),math.random(maze:getRows()))
	cell.inside = true
	local frontier = {}
	for i,direction in ipairs(directions) do
		local nextCell = cell:getNeighbor(direction:getId())
		if nextCell~=nil then
			nextCell.frontier = true
			frontier[#frontier+1]=nextCell
		end
	end
	while #frontier > 0 do
		local index = math.random(#frontier)
		cell = frontier[index]
		frontier[index]=frontier[#frontier]
		frontier[#frontier]=nil

		local choices = {}
		for i,direction in ipairs(directions) do
			local nextCell = cell:getNeighbor(direction:getId())
			if nextCell~=nil and nextCell.inside then
				choices[#choices+1]=direction:getId()
			end
		end

		index=math.random(#choices)
		local direction = choices[index]

		local nextCell = cell:getNeighbor(direction)
		local door = cell:getDoor(direction)

		door:setOpen(true)
		cell.frontier=nil
		cell.inside=true

		for i,direction in ipairs(directions) do
			nextCell = cell:getNeighbor(direction:getId())
			if nextCell~=nil and not nextCell.frontier and not nextCell.inside then
				nextCell.frontier = true
				frontier[#frontier+1]=nextCell
			end
		end
	end
	for column=1,maze:getColumns() do
		for row=1,maze:getRows() do
			maze:getCell(column,row).inside = nil
		end
	end
end

return MazeGenerator