function spawn_menu_launch()
	include("modules/cl_spawn_menu_buttons.lua")

end

function team_select_menu()
	include("modules/cl_side_select_menu.lua")
	include("modules/cl_cmd_hud_good.lua")

end

concommand.Add("spawn_menu_launch", spawn_menu_launch)
concommand.Add("team_select_menu", team_select_menu)