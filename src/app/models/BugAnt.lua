local BugBase = import(".BugBase")

local BugAnt = class("BugAnt",BugBase)

function BugAnt:ctor( ... )
	-- body
	--这里的super有问题？
	BugAnt.super.ctor(self)
	self.type_  = BugBase.BUG_TYPE_ANT
	self.speed_ = 2
	self.touchRange_ = 70
end

return BugAnt