local Column={}
local MazeCell = require("Maze.MazeCell")

function Column.new(maze,column,rows)
	local instance={}

	local cells = {}

	function instance:getMaze()
		return maze
	end

	function instance:getColumn()
		return column
	end

	for row=1,rows do
		cells[row] = MazeCell.new(instance,row)
	end

	function instance:getCell(row)
		return cells[row]
	end

	function instance:flagify(directions)
		local result = {}
		for row=1,rows do
			result[#result+1]=self:getCell(row):flagify(directions)
		end
		return result
	end

	function instance:deflagify(values,directions)
		for row=1,rows do
			self:getCell(row):deflagify(values[row],directions)
		end
	end

	return instance
end

return Column