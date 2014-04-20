States = class("States"):include(Stateful)

function States:initialize()
end

function States:exitedState()
	love.audio.stop()
end

function States:drawCalls()
	self:draw()
	if self.drawOverlay then self:drawOverlay() end
end