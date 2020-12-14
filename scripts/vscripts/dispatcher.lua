local Dispatcher = class({
  constructor = function (self)
    print("Dispatcher: constructor");

    self._stores = {};
  end
});

function Dispatcher:addStore(store)
  local storesAmount = #self._stores;

  table.insert(self._stores, storesAmount + 1, store);
end

function Dispatcher:dispatch(action)
  print("Dispatcher:dispatch : action : " .. tostring(action));

  local storesAmount = #self._stores;

  for _, store in ipairs(self._stores) do
    store:onAction(action);
  end
end

-- ToDo: Add waitFor method

return Dispatcher;