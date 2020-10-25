local Dispatcher = require("dispatcher");

local DotaWarmupGameMode = class({});

function DotaWarmupGameMode:InitGameMode()
	print( "Template addon is loaded." );
    -- GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
    
    self.dispatcher = Dispatcher();

    -- dispatcher:Listen(testHandler, self);
    -- dispatcher:Dispatch(testAction);
end

-- Evaluate the state of the game
function DotaWarmupGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end

return DotaWarmupGameMode