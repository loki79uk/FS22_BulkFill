StartFillingEvent = {}
StartFillingEvent_mt = Class(StartFillingEvent, Event)
InitEventClass(StartFillingEvent, "StartFillingEvent")

function StartFillingEvent.emptyNew()
	local self = Event.new(StartFillingEvent_mt)
	return self
end

function StartFillingEvent.new(myObject, myID)
	local self = StartFillingEvent.emptyNew()
	self.object = myObject
	self.id = myID
	return self
end

function StartFillingEvent:readStream(streamId, connection)
	self.object = NetworkUtil.readNodeObject(streamId)
	self.object.spec_bulkFill.isFilling = streamReadBool(streamId)
	self.object.spec_bulkFill.selectedIndex = streamReadInt32(streamId)
	self.id = streamReadInt32(streamId)
	
	self:run(connection)
end

function StartFillingEvent:writeStream(streamId, connection)
	NetworkUtil.writeNodeObject(streamId, self.object)
	streamWriteBool(streamId, self.object.spec_bulkFill.isFilling)
	streamWriteInt32(streamId, self.object.spec_bulkFill.selectedIndex)
	streamWriteInt32(streamId, self.id)
end

function StartFillingEvent:run(connection)
	if not connection:getIsServer() then
		--print("StartFillingEvent: server")
		self.object:startFilling(self.id, true)
	else
		--print("StartFillingEvent: client")
		self.object:startFilling(self.id, true)
	end
end