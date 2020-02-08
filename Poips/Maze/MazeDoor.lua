local Door = {}

function Door.new()
	local instance = {}

	local open = false

	function instance:isOpen()
		return open
	end

	function instance:setOpen(value)
		open = value
	end

	return instance
end

return Door