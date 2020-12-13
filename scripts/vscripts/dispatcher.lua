local EventEmitter = require("event_emitter");

local Dispatcher = class( {
  constructor = function (self)
    print("Dispatcher constructor");
    EventEmitter.constructor(self);
  end
}, {}, EventEmitter);

function Dispatcher:dispatch(action)
  print("Dispatcher:dispatch : action : " .. tostring(action));

  self:trigger("action", action);
end

return Dispatcher;