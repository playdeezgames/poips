local Maze = {}

local MazeColumn = require("Maze.MazeColumn")
local MazeDoor = require("Maze.MazeDoor")

function Maze.new(columns,rows,directions)
	local instance = {}

	local mazeColumns = {}

	function instance:getColumns()
		return columns
	end

	function instance:getRows()
		return rows
	end

	for column=1,columns do
		mazeColumns[column]=MazeColumn.new(instance,column,rows)
	end

	function instance:getColumn(column)
		return mazeColumns[column]
	end

	function instance:getCell(column,row)
		if column>=1 and column<=columns and row>=1 and row<=rows then
			return self:getColumn(column):getCell(row)
		else
			return nil
		end
	end

	for column=1,columns do
		for row=1,rows do
			for i,direction in ipairs(directions) do
				local cell = instance:getCell(column,row)
				if not cell:hasNeighbor(direction:getId()) then
					local nextColumn,nextRow = direction:step(column,row)
					local nextCell = instance:getCell(nextColumn,nextRow)
					if nextCell~=nil then
						cell:setNeighbor(direction:getId(),nextCell)
						nextCell:setNeighbor(direction:getOpposite(),cell)
						local door = MazeDoor.new()
						cell:setDoor(direction:getId(),door)
						nextCell:setDoor(direction:getOpposite(),door)
					end
				end
			end
		end
	end

	function instance:flagify(directions)
		local result = {}
		for column=1,self:getColumns() do
			result[#result+1]=self:getColumn(column):flagify(directions)
		end
		return result
	end

	function instance:deflagify(values,directions)
		for column=1,self:getColumns() do
			self:getColumn(column):deflagify(values[column],directions)
		end
	end

	return instance
end

return Maze