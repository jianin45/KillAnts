
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    --[[cc.ui.UILabel.new({
            UILabelType = 2, text = "Hello, World", size = 64})
        :align(display.CENTER, display.cx, display.cy)
        :addTo(self)]]
    display.newSprite("img/cover.jpg")
        :pos(display.cx,display.cy)
        :addTo(self)

    display.newSprite("img/bug1_01.png")
        :pos(display.cx,display.cy)
        :addTo(self)
    cc.ui.UIPushButton.new("img/play_button.png")
        :pos(display.cx,display.cy-200)
        :addTo(self)
        :onButtonClicked(function ( ... )
            -- body
            print("PLAY BUTTON CLICKED")
            app:enterScene("PlayScene",nil,"Random",1.0)
        end)

end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
