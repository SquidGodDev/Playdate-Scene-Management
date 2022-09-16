import "gameScene"

local pd <const> = playdate
local gfx <const> = playdate.graphics

class('GameOverScene').extends(gfx.sprite)

function GameOverScene:init(text)
    -- local text = "Game Over"
    local gameOverImage = gfx.image.new(gfx.getTextSize(text))
    gfx.pushContext(gameOverImage)
        gfx.drawText(text, 0, 0)
    gfx.popContext()
    local gameOverSprite = gfx.sprite.new(gameOverImage)
    gameOverSprite:moveTo(200, 120)
    gameOverSprite:add()

    self:add()
end

function GameOverScene:update()
    if pd.buttonJustPressed(pd.kButtonA) then
        SCENE_MANAGER:switchScene(GameScene)
    end
end