local Direction=require("Common.Direction")

return {
	Direction.new(1,2,4,3,function(x,y) return x,y+1 end,1),
	Direction.new(2,3,1,4,function(x,y) return x+1,y end,2),
	Direction.new(3,4,2,1,function(x,y) return x,y-1 end,4),
	Direction.new(4,1,3,2,function(x,y) return x-1,y end,8)
}