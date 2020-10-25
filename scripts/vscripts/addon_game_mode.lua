local DotaWarmupGameAddon = require("dota_warmup_game_addon");

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

-- Create the game mode when we activate
function Activate()
	print("Activate")
	GameRules.AddonTemplate = DotaWarmupGameAddon()
	GameRules.AddonTemplate:InitGameMode()
end
