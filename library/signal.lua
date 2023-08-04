local Signal = {}
Signal.__index = Signal

function Signal.new()
	local instance = Instance.new("BindableEvent")
	local argsStorage = {}
	-- Initial connection which will free the args list after all of the other
	-- handlers (which must be called first because handlers are called in reverse
	-- order of connection) have run already.
	instance.Event:Connect(function(argCount, ref)
		argsStorage[ref] = nil
	end)
	return setmetatable({
		_inst = instance,
		-- Must use a separate table for argsStorage so that there's no reference
		-- back from argsStorage to instance, which would cause a memory leak.
		_args = argsStorage,
		_event = instance.Event,
	}, Signal)
end

function Signal:Connect(fn)
	return self._event:Connect(function(argCount, ref)
		fn(unpack(self._args[ref], 1, argCount))
	end)
end

function Signal:DisconnectAll()
	self._inst:Destroy()
	local instance = Instance.new("BindableEvent")
	local argsStorage = {}
	instance.Event:Connect(function(argCount, ref)
		argsStorage[ref] = nil
	end)
	self._inst = instance
	self._args = argsStorage
	self._event = instance.Event
end

function Signal:Fire(...)
	local args = {...}
	local argCount = #args
	-- Abuse the fact that function refs can be passed through BindableEvents intact
	local ref = function() end
	self._args[ref] = args
	self._inst:Fire(argCount, ref)
end

function Signal:Wait()
	local argCount, ref = self._event:Wait()
	return unpack(self._args[ref], 1, argCount)
end

function Signal:Once(fn)
	return self._event:ConnectOnce(function(argCount, ref)
		fn(unpack(self._args[ref], 1, argCount))
	end)
end

return Signal
