States = class("States"):include(Stateful)

require "pause"
require "menu"
require "game"

function States:initialize()
end

function States:exitedState()
	love.audio.stop()
end

function States:drawCalls()
	self:draw()
	if self.drawOver then self:drawOver() end
	if self.drawPause then self:drawPause() end
end

function sign(x)
	return x < 0 and -1 or (x > 0 and 1 or 0)
end