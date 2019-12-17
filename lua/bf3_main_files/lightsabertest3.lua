local hero_table = {}
table.insert(hero_table,"models/models/ferroda/ferroda_2.mdl")
table.insert(hero_table,"models/ryan7259/mace_windu/mace_windu_player.mdl")
table.insert(hero_table,"models/player/valley/luke/luke.mdl")
local maximument = ents.GetAll()


hook.Add("PlayerButtonDown", "test_func", function(ply,button)
	if ply:IsValid() == true and ply:Alive() == true then 
if button == KEY_W or KEY_A or KEY_D or KEY_S or MOUSE_FIRST or MOUSE_SECOND then
	print("WHO")
	RunConsoleCommand("minus_health")
end
if button == MOUSE_FIRST then 
	RunConsoleCommand("rb655_lightsaber_hiltonbelt","0")

	local active = ply:GetActiveWeapon():GetClass()
		for k, v in pairs(ents.FindInSphere( ply:GetPos(), 60 )) do
			if button == MOUSE_FIRST  and ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_1" or ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_2"  or ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_3" then
				if v:IsPlayer() == false then
			v:TakeDamage(1000)
			RunConsoleCommand("saber_hit_sound")
			RunConsoleCommand("createKillNumber")

			
		end
		end
	end
	if ( button == MOUSE_FIRST ) and ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_anakin" or ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_1"then
		RunConsoleCommand("+forward")
		timer.Simple(.1,function()
			RunConsoleCommand("-forward")
		ply:SelectWeapon("weapon_lightsaber_form_2_2")
		print( "hi" )
	end)
	elseif ( button == MOUSE_FIRST ) and ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_2" then
		
		RunConsoleCommand("+forward")
	
		timer.Simple(.2,function()
		RunConsoleCommand("-forward")
	
		ply:SelectWeapon("weapon_lightsaber_form_2_3")
		print( "hi" )
	end)
	
		elseif ( button == MOUSE_FIRST ) and ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_3" then
		RunConsoleCommand("+forward")

		timer.Simple(.2,function()
		RunConsoleCommand("-forward")
		ply:SelectWeapon("weapon_lightsaber_form_2_1")
		print( "hi" )
	end)
	end
end
end
end)
hook.Add( "KeyPress", "keypress_use_hi", function( ply, key )



end )

hook.Add( "CanLightsaberDamageEntity", "my_unqiue_hook_name_here", function( victim, lightsaber, trace )
	return 100000 -- Makes the damage twice as high for the weapon
end )

hook.Add("ScalePlayerDamage","ferrodahealth",function( ply, hitgroup, dmginfo) 
		if ply:IsValid() == true then 
	if table.HasValue(hero_table,ply:GetModel()) == false then
		dmginfo:ScaleDamage( .5 )
 	
	end
end
end)


function minus_health(ply)
	if ply:IsValid() == true then 
	if ply:Alive() == true and ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_1" or ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_2"  or ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_3" then
	ply:SetHealth(ply:Health() -.05)
end
end
end

function plus_health(ply)
if ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_1" or ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_2"  or ply:GetActiveWeapon():GetClass() == "weapon_lightsaber_form_2_3" then
ply:SetHealth(ply:Health() + 10)
end
end
concommand.Add("minus_health", minus_health)
concommand.Add("plus_health", plus_health)