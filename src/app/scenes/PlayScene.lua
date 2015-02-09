local PlayScene = class("PlayScene",function ( ... )
	-- body
	return display.newScene("PlayScene")
end)


local Game = import("..models.Game")


function PlayScene:ctor( ... )
	-- body

	--游戏逻辑在Game中
	--self.game_ = Game.new(self)

	print(type(self))
	--背景
	display.newSprite("img/bg.jpg")
		:pos(display.cx,display.cy)
		:addTo(self)
	--红心
	display.newSprite("img/star.png")
        :pos(display.left + 50, display.top - 50)
        :addTo(self)
	--血量
	self.stars_ = 5
	self.starsLabel_ = cc.ui.UILabel.new(
		{
			text = self.stars_,
			x = display.left + 90,
			y = display.top - 50,
			size = 32
		})
		:addTo(self)


end

function PlayScene:onEnter()
	--[[
	--开启定时器
	self.schedule(function ( ... )
		-- body
		bug:step()
		bugSprite:pos(bug:getPosition)
		print(bug:getDis·t())
	end)
	--]]--
end

function PlayScene:onExit()
end

return PlayScene