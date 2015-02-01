local Game = class("Game")

Game.HOLE_POSITION = cc.p(display.cx - 30, display.cy - 75)

local BugAnt = import(".BugAnt")

function Game:ctor( stage )
	-- body
		---[[
	--添加虫子
	local bug = BugAnt.new()
	bug:setInitPosition(Game.HOLE_POSITION,math.random(0,360),200)

	local bugSprite = display.newSprite("img/bug1_01.png")
		:pos(bug:getPosition())
		:rotation(bug:getRotation())
		:addTo(self)
	--]]
	
end


return Game