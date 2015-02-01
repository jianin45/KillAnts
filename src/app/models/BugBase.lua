
local BugBase = class("BugBase")

BugBase.BUG_TYPE_ANT = 1
BugBase.BUG_TYPE_SPIDER = 2

function BugBase:ctor( ... )
	-- body
	self.position_ = cc.p(0,0)
	self.rotation_ = 0
	self.type_ = BugBase.BUG_TYPE_ANT

	self.dist_ = 0
	self.distPositon_ = cc.p(0,0)
	self.speed_ = 1

end

function BugBase:setInitPosition(holePosition,rotation,dist)
	-- body
	--确定虫子从洞的哪个角度出现
	local rotation = rotation or math.random(0,360)
	--转为弧度
	local radians =  math.rad(rotation)

	-- 确定虫子与洞的初始距离
    -- 这里偷懒确定初始距离总是比半个屏幕的宽度多一些，避免虫子一出来时就在屏幕上
    -- 严格的算法应该是屏幕四周与指定角度射线的交点距离
    local dist = dist or math.random(display.width / 2 + 200, display.width / 2 + 500)

    -- 计算虫子的初始位置和角度
    self.position_ = cc.p(holePosition.x + math.cos(radians) * dist,
                          holePosition.y - math.sin(radians) * dist)
    -- 因为需要虫子的头对着洞，所以虫子的方向实际上要旋转 180 度
    self.rotation_ = rotation - 180


    --设置目的地位置
    self.setDistPosition(holePosition)

    print("虫子来袭！！！")
    return self

    --cocos2dx 里，0 度正对右方，所以虫子图片里虫子的头部也是正对右方
end

--移动方法
function BugBase:step( ... )
	-- body
	--每执行一次，虫子会向目的地的方向移动一小步
	self.distPositon_ = self.distPositon_ - self.speed_

	local radians = math.rad((self.rotation_+180))
	self.position_ = cc.p(self.distPositon_.x+math.cos(radians)*self.dist_,
		self.distPositon_.y-math.sin(radians))
	return self

end

function BugBase:getPosition( ... )
	-- body
	return self.position_.x,self.position_.y
end

function BugBase:getRotation( ... )
	-- body
	return self.rotation_
end

function BugBase:getType( ... )

	return self.type_
end

function BugBase:getDist( ... )
	-- body
	return self.dist_
end

function BugBase:setDistPosition( holePosition )
	-- body
	self.disPosition = clone(holePosition)
	return self
end


return BugBase



















