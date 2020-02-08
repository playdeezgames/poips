local Cell = {}

function Cell.new(mazeColumn,row)
	local instance = {}

	local doors = {}
	local neighbors = {}

	function instance:getRow()
		return row
	end

	function instance:getColumn()
		return mazeColumn:getColumn()
	end

	function instance:getMaze()
		return mazeColumn:getMaze()
	end

	function instance:getDoor(direction)
		return doors[direction]
	end

	function instance:getOpenDoors()
		local result = {}
		for k,v in pairs(doors) do
			if v:isOpen() then
				result[#result+1]=k
			end
		end
		return result
	end

	function instance:setDoor(direction,door)
		doors[direction]=door
	end

	function instance:getNeighbor(direction)
		return neighbors[direction]
	end

	function instance:hasNeighbor(direction)
		return self:getNeighbor(direction)~=nil
	end

	function instance:setNeighbor(direction,neighbor)
		neighbors[direction]=neighbor
	end

	function instance:flagify(directions)
		local flags = 0
		for i,direction in ipairs(directions) do
			local door = self:getDoor(direction:getId())
			if door~=nil and door:isOpen() then
				flags = flags + direction:flag()
			end

		end
		return flags
	end

	function instance:deflagify(value,directions)
		--assumption: the directions are sorted prior to hitting this function
		for i,direction in ipairs(directions) do
			if value>=direction:flag() then
				value = value - direction:flag()
				local door = self:getDoor(direction:getId())
				if door~=nil then
					door:setOpen(true)
				end
			else
				local door = self:getDoor(direction:getId())
				if door~=nil then
					door:setOpen(false)
				end
			end
		end
	end

	return instance
end

return Cell