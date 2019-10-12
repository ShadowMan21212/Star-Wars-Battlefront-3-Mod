hook.Add("PlayerButtonDown","Testinput",function(ply,button)
	for k, v in pairs(ents.FindInSphere( ply:GetPos(), 200 )) do
	if button == KEY_E and v:GetClass() == "rvb_control_point" then
	include("bf3_main_files/televgui.lua")
	print("yo")
	end
end
		end)

hook.Add( "KeyPress", "keypress_use_hi", function( ply, key )
	for k, v in pairs(ents.FindInSphere( ply:GetPos(), 200 )) do

	if ( key == IN_USE ) and v:GetClass() == "rvb_control_point" then
		print(v.Owner)
		print( "hi" )
		include("bf3_main_files/televgui.lua")
	end
end
end )

