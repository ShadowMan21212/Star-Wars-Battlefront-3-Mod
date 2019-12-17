if game.GetMap() != "rp_venator_exaatensive" then
RunConsoleCommand("thirdperson_etp","0")
end
if game.GetMap() != "rp_venator_extensive" then
	timer.Simple(1,function()
		include("modules/cl_side_select_menu.lua")
include( "bf3_main_files/cmdinteraction.lua" )

--include( "bf3_main_files/killpoints.lua" )
include( "bf3_main_files/deathmatch_cl.lua" )
include("bf3_main_files/cl_hero_option_hud.lua")
end)
end