local jediind = "true"

hook.Add( "KeyPress", "keypress_use_hi", function( ply, key )
		local active = ply:GetActiveWeapon():GetClass()
if ( key == IN_ATTACK2 ) and ply:GetModel() != "models/ferroda/ferroda_2.mdl" then
RunConsoleCommand("thirdperson_etp_offset_x",-60)
  RunConsoleCommand("thirdperson_etp_offset_y",18.56)
  RunConsoleCommand("thirdperson_etp_offset_z",0)
	end

end)

hook.Add("KeyRelease", "yolo", function( player, key )
	if ( key == IN_ATTACK2 ) and player:GetModel() != "models/ferroda/ferroda_2.mdl" then
		  RunConsoleCommand("thirdperson_etp_offset_x",-102.06)
  RunConsoleCommand("thirdperson_etp_offset_y",18.56)
  RunConsoleCommand("thirdperson_etp_offset_z",0)
	elseif player:GetModel() == "models/ferroda/ferroda_2.mdl" then

		  RunConsoleCommand("thirdperson_etp_offset_x",-150)
  			RunConsoleCommand("thirdperson_etp_offset_y",0)
 			 RunConsoleCommand("thirdperson_etp_offset_z",9.28)
 
	end
end)

