local EventEmitter = require("event_emitter");

local BaseStore = class({
  constructor = function (self)
    print("BaseStore: constructor");
    EventEmitter.constructor(self);
  end
}, {}, EventEmitter);

function BaseStore:onAction(action)
  print("BaseStore:onAction START: action : " .. tostring(action));
  print("BaseStore:onAction END");
end

return BaseStore;