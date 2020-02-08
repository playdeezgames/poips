local Direction = {}

function Direction.new(id,nextDirection,previousDirection,oppositeDirection,step,flag)
	local instance = {}

	function instance:getId()
		return id
	end

	function instance:getNext()
		return nextDirection
	end

	function instance:getPrevious()
		return previousDirection
	end

	function instance:getOpposite()
		return oppositeDirection
	end

	function instance:step(x,y)
		return step(x,y)
	end

	function instance:flag()
		return flag
	end

	return instance
end

return Direction