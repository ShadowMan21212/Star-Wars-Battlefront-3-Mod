
hook.Add( "PlayerInitialSpawn", "some_unique_name", function()
		if game.GetMap() == "rp_venator_extensive" then
			include("map_loaders/sv_load_venator.lua")
		end

		if game.GetMap() != "rp_venator_extensive" then
			
	---RunConsoleCommand("kill")
include( "bf3_main_files/"..game.GetMap().."_cmd.lua" )

include( "bf3_main_files/deathmatchtest.lua" )
--include( "bf3_main_files/killpoints_sv.lua" )
include( "bf3_main_files/tele.lua" )
include( "bf3_main_files/zoomin.lua" )
include( "bf3_main_files/lightsabertest3.lua" )
local entities_max = ents.GetAll()
end
local entities_max = ents.GetAll()
for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v.Blu = true
	end
end

end)
