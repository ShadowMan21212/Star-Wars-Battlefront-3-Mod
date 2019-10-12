
hook.Add( "KeyPress", "keypress_use_hi", function( ply, key )
	local active = ply:GetActiveWeapon():GetClass()
		for k, v in pairs(ents.FindInSphere( ply:GetPos(), 60 )) do
			if ( key == IN_ATTACK )  and ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_1" or ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_2"  or ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_3" then
				if v:IsPlayer() == false then
			v:TakeDamage(1000)

		end
		end
	end
	if ( key == IN_ATTACK ) and ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_anakin" or ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_1"then
		RunConsoleCommand("+forward")
		timer.Simple(.1,function()
			RunConsoleCommand("-forward")
		ply:SelectWeapon("weapon_lightsaber_form_2_2")
		print( "hi" )
	end)
	elseif ( key == IN_ATTACK ) and ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_2" then
		
		RunConsoleCommand("+forward")
	
		timer.Simple(.2,function()
		RunConsoleCommand("-forward")
	
		ply:SelectWeapon("weapon_lightsaber_form_2_3")
		print( "hi" )
	end)
	
		elseif ( key == IN_ATTACK ) and ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_3" then
		RunConsoleCommand("+forward")
		timer.Simple(.2,function()
		RunConsoleCommand("-forward")
		ply:SelectWeapon("weapon_lightsaber_form_2_1")
		print( "hi" )
	end)
	end


end )

hook.Add( "CanLightsaberDamageEntity", "my_unqiue_hook_name_here", function( victim, lightsaber, trace )
	return 100000 -- Makes the damage twice as high for the weapon
end )

hook.Add("ScalePlayerDamage","ferrodahealth",function( ply, hitgroup, dmginfo) 
	if ply:GetModel() == "models/ferroda/ferroda_2.mdl" then
		dmginfo:ScaleDamage( .05 )
 	
	end
end)

