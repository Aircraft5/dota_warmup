local EventEmitter = require("event_emitter");

local BaseStore = class({
  constructor = function (self)
    print("BaseStore: constructor");
    EventEmitter.constructor(self);
  end
}, {}, EventEmitter);

function BaseStore:onAction(action)
  print("BaseStore:onAction START: action : " .. tostring(action));

  -- ToDo: Add logic for checking type of action and calling appropriate method
  -- if action relates to current store
  self:trigger("onUpdate");

  print("BaseStore:onAction END");
end

return BaseStore;