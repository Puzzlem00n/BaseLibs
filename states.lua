States = class("States"):include(Stateful)

function States:initialize()
end

function States:exitedState()
	love.audio.stop()
end