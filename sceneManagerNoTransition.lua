
local pd <const> = playdate
local gfx <const> = playdate.graphics

class('SceneManager').extends()

function SceneManager:switchScene(scene, ...)

    self.newScene = scene
    self.sceneArgs = ...

    self:loadNewScene()
end

function SceneManager:loadNewScene()
    self:cleanupScene()
    self.newScene(self.sceneArgs)
end

function SceneManager:cleanupScene()
    gfx.sprite.removeAll()
    self:removeAllTimers()
    gfx.setDrawOffset(0, 0)
end

function SceneManager:removeAllTimers()
    local allTimers = pd.timer.allTimers()
    for _, timer in ipairs(allTimers) do
        timer:remove()
    end
end