import "gameOverScene"

local pd <const> = playdate
local gfx <const> = playdate.graphics

class('GameScene').extends(gfx.sprite)

function GameScene:init()
    local backgroundImage = gfx.image.new("images/background")
    gfx.sprite.setBackgroundDrawingCallback(function()
        backgroundImage:draw(0, 0)
    end)

    local playerSprite = gfx.image.new("images/player")
    self.player = gfx.sprite.new(playerSprite)
    self.player:moveTo(200, 120)
    self.player:add()

    self.playerSpeed = 2

    self:add()
end

function GameScene:update()
    if pd.buttonJustPressed(pd.kButtonA) then
        SCENE_MANAGER:switchScene(GameOverScene, "Score: 100")
    end

    if pd.buttonIsPressed(pd.kButtonUp) then
        self.player:moveBy(0, -self.playerSpeed)
    end
    if pd.buttonIsPressed(pd.kButtonRight) then
        self.player:moveBy(self.playerSpeed, 0)
    end
    if pd.buttonIsPressed(pd.kButtonDown) then
        self.player:moveBy(0, self.playerSpeed)
    end
    if pd.buttonIsPressed(pd.kButtonLeft) then
        self.player:moveBy(-self.playerSpeed, 0)
    end
end