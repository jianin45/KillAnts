local PlayScene = class("PlayScene",function ( ... )
	-- body
	return display.newScene("PlayScene")
end)

local Game = import("..models.Game")
local BugAnt = import("..models.BugAnt")

function PlayScene:ctor( ... )
	-- body

	--背景
	display.newSprite("img/bg.jpg")
		:pos(display.cx,display.cy)
		:addTo(self)
	--血量
	self.stars_ = 5
	self.starsLabel_ = cc.ui.UILabel.new({
			text = self.stars_,
			x = display.left + 90,
			y = display.top - 50,
			size = 32
		})
		:addTo(self)

	--添加虫子
	local bug = BugAnt.new()
	bug:setInitPosition(Game.HOLE_POSITION,math.random(0,360),200)

	local bugSprite = display.newSprite("img/bug1_01.png")
		:pos(bug:getPosition())
		:rotation(bug:getRotation())
		:addTo(self)

	--开启定时器
	self.schedule(function ( ... )
		-- body
		bug:step()
		bugSprite:pos(bug:getPosition)
		print(bug:getDist())
	end)


end

function PlayScene:onEnter()
end

function PlayScene:onExit()
end

return PlayScene