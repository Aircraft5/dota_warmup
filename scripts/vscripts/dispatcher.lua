local Dispatcher = class({
    constructor = function (self)
        print("Dispatcher constructor");
        self._listeners = {};
    end
});

function Dispatcher:Dispatch(action)
    print("Dispatch Action");
    print(action);

    if action == nil or type(action) ~= "table" then
        print("Dispatcher:Dispatch Error: action is undefined");
        return;
    end

    for _, listener in ipairs(self._listeners) do
        listener.handler(listener.context, action);
    end
end

function Dispatcher:Listen(storeHandler, storeContext)
    print("Register Listen Handler");
    print(storeHandler);
    print(storeContext);

    if storeHandler == nil or type(storeHandler) ~= "function" then
        print("Dispatcher:Listen Error: storeHandler is incorrect");
        print(storeHandler);
        return;
    end

    if storeContext == nil or type(storeContext) ~= "table" then
        print("Dispatcher:Listen Error: storeContext is incorrect");
        print(storeContext);
        return;
    end

    local listenersAmount = #self._listeners;

    local listener = {
        handler = storeHandler,
        context = storeContext
    };

    table.insert(self._listeners, listenersAmount + 1, listener);

    return self;
end

return Dispatcher;