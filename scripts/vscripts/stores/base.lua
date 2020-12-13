local BaseStore = class({});

function BaseStore:setDispatcher(dispatcher)
    print("BaseStore:setDispatcher");

    if self.dispatcher ~= nil then
        print("store error: dispatcher is already set");
        return;
    end

    self.dispatcher = dispatcher;
    self.dispatcher:listenTo("action", self, self.onAction);

    print("BaseStore:setDispatcher END");
end

function BaseStore:onAction(action)
   print("BaseStore:onAction START: action : " .. tostring(action));
   print("BaseStore:onAction END");
end

return BaseStore;