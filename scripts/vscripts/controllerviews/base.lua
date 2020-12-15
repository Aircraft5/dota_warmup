local BaseControllerView = class({
  constructor = function (self)
    print("BaseControllerView: constructor");

    self._store = nil;
    self._view = nil;
  end
});

function BaseControllerView:setStore(store)
  print("BaseControllerView: setStore START: store : " .. tostring(store));
  
  if store == nil or type(store) ~= "table" then
    print("BaseControllerView: setStore: Error: store is incorrect");
    return;
  end

  self._store = store;
  self._store:listen("onUpdate", self, self.onUpdate);

  print("BaseControllerView: setStore END");
end

function BaseControllerView:setView(view)
  print("BaseControllerView: setView START: view: " .. tostring(view));

  if view == nil or type(view) ~= "table" then
    print("BaseControllerView: setView: Error: view is incorrect");
    return;
  end

  self._view = view;

  print("BaseControllerView: setView END");
end

function BaseControllerView:onUpdate()
  print("BaseControllerView: onUpdate: START");
  
  print("BaseControllerView: onUpdate: END");
end

return BaseControllerView;