local e_max = ents.GetAll()


if game.GetMap() == "kashyyyk" then
for k,v in pairs(e_max) do
	timer.Simple(1,function()
	if v:IsPlayer() then
		v:SetPos(Vector( 4216.14, 4260.29, 2522.93 ))
		v:SetEyeAngles(Angle( 17.96, -108.93, 0 ))
		--v:StripWeapons()
	end
end)
end	
timer.Simple( 1, function()
include("modules/sv_kill_system.lua")
include("modules/sv_cmd_progress_updater.lua")
include("modules/sv_tele_commands.lua")
end)
timer.Simple(2,function()
RunConsoleCommand("team_select_menu")
end)
plat=ents.Create("rvb_control_node")----MidRiver
plat:SetModel("models/hunter/plates/plate1x1.mdl")
plat:SetPos(Vector( 4216.14, 4260.29, 2522.93 ))
plat:Spawn()



cmd1=ents.Create("rvb_control_point")----MidRiver
cmd1:SetModel("models/props_c17/oildrum001.mdl")
cmd1:SetPos(Vector( -716.06, -3320.91, -11.84 ))
cmd1:Spawn()

cmd2=ents.Create("rvb_control_point")----Right Dock
cmd2:SetModel("models/props_c17/oildrum001.mdl")
cmd2:SetPos(Vector( -3494.74, -1784.29, 464.58 ))
cmd2:Spawn()

cmd3=ents.Create("rvb_control_point")----Left Dock
cmd3:SetModel("models/props_c17/oildrum001.mdl")
cmd3:SetPos(Vector( 3071.39, -1344.66, 467.75 ))
cmd3:Spawn()

cmd4=ents.Create("rvb_control_point")----left bank
cmd4:SetModel("models/props_c17/oildrum001.mdl")
cmd4:SetPos(Vector( 1050.52, -7526.28, 43.69 ))
cmd4:Spawn()

cmd5=ents.Create("rvb_control_point")----right bank
cmd5:SetModel("models/props_c17/oildrum001.mdl")
cmd5:SetPos(Vector( -2212.55, -8303.06, 112.23 ))
cmd5:Spawn()

function updateValueo( bob,owner )
local entities_max = ents.GetAll()
for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:SetNetworkedString("cmd1owner", cmd1.Owner)
		v:SetNetworkedString("cmd2owner", cmd2.Owner)
		v:SetNetworkedString("cmd3owner", cmd3.Owner)
		v:SetNetworkedString("cmd4owner", cmd4.Owner)
		v:SetNetworkedString("cmd5owner", cmd5.Owner)

		v:SetNetworkedString("repbase1owner", "blu")
		v:SetNetworkedString("repbase2owner", "blu")
		v:SetNetworkedString("cisspawner1owner", "red")
		v:SetNetworkedString("cisspawner2owner", "red")
				v:SetNetworkedString("cisspawner3owner", "red")
				v:SetNetworkedString("cisspawner4owner", "red")
		------------------------------------------------
		v:SetNWVector("cmd1pos", Vector( 165.62, 2286.65, 212.28 ))
		v:SetNWVector("cmd2pos", Vector( -504.18, 1565.51, 154.64 ))
		v:SetNWVector("cmd3pos", Vector( -977.21, 271.95, 20.28 ))
		v:SetNWVector("cmd4pos", Vector( 61.52, -496.36, 20.28 ))
		v:SetNWVector("cmd5pos", Vector( -341.81, -925.21, 178.28 ))

		v:SetNWVector("repbase1pos", Vector( 463.28, 1251.94, 102.03 ))
		v:SetNWVector("repbase2pos", Vector( 1751.87, 1054.56, 0.03 ))
		v:SetNWVector("cisbase1pos", Vector( -1113.16, 2020.71, 190.62 ))
		v:SetNWVector("cisbase2pos", Vector( 3461.02, 2322.65, 0.03 ))
			v:SetNWVector("cisbase3pos", Vector( 2249.19, -1048.45, 0.03 ))
			v:SetNWVector("cisbase4pos", Vector( -355.46, -1269.41, 3.51 ))
	end
end
end



--timer.Simple( 1, function() updateValue() end )

--hook.Add("PlayerFootstep","yo",function()
	--updateValue()
--end)
hook.Add("Tick","bb",function()
	updateValueo()
end)

end
