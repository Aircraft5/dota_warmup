local EventEmitter = class({
  constructor = function(self)
    print("EventEmitter constructor");
    self._listeners = {};
  end
});

function EventEmitter:listenTo(eventName, context, eventHandler)
  print("EventEmitter:listenTo START");

  if eventName == nil or type(eventName) ~= "string" then
    print("EventEmitter:Listen Error: eventName is wrong: " .. tostring(eventHandler));
    return;
  end

  if context == nil or type(context) ~= "table" then
    print("EventEmitter:Listen Error: context is wrong: " .. tostring(context));
    return;
  end

  if eventHandler == nil or type(eventHandler) ~= "function" then
    print("EventEmitter:Listen Error: eventHandler is wrong: " .. tostring(eventHandler));
    return;
  end

  print(eventName);
  print(context);
  print(eventHandler);

  if self._listeners[eventName] == nil then
    print("EventEmitter:Listen creating table for the next type of events: " .. eventName);
    self._listeners[eventName] = {};
  end

  local eventListeners = self._listeners[eventName];
    
  local listenersAmount = #eventListeners;

  local listener = {
    handler = eventHandler,
    context = context
  };

  table.insert(eventListeners, listenersAmount + 1, listener);

  print("EventEmitter:listenTo END");
end

function EventEmitter:trigger(eventName, arg)
  print("EventEmitter:trigger : " .. eventName .. " START");
    
  if self._listeners[eventName] == nil or #self._listeners[eventName] == 0 then
    print("EventEmitter:trigger : " .. eventName .. " : no event handlers to execute");
    return;
  end

  local eventListeners = self._listeners[eventName];

  for _, listener in ipairs(eventListeners) do
    listener.handler(listener.context, arg);
  end

  print("EventEmitter:trigger : " .. eventName .. " END");
end

-- ToDo: add removal of event handler

return EventEmitter;