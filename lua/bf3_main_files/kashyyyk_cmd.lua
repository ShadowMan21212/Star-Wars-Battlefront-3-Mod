timer.Simple(5,function()

cmd1=ents.Create("rvb_control_point")----spawn shuttle
cmd1:SetModel("models/props_c17/oildrum001.mdl")
cmd1:SetPos(Vector( 3024.52, -1371.91, 464.28 ))
cmd1:Spawn()

cmd2=ents.Create("rvb_control_point")
cmd2:SetModel("models/props_c17/oildrum001.mdl")
cmd2:SetPos(Vector( -3429.01, -1753.14, 464.28 ))-----sidelot
cmd2:Spawn()

cmd3=ents.Create("rvb_control_point")
cmd3:SetModel("models/props_c17/oildrum001.mdl")
cmd3:SetPos(Vector( -2201.95, -8259.5, 114.13 ))----left cis bunker
cmd3:Spawn()

cmd4=ents.Create("rvb_control_point")
cmd4:SetModel("models/props_c17/oildrum001.mdl")
cmd4:SetPos(Vector( 935.67, -7432.78, 51.69 ))------right cis bunker square
cmd4:Spawn()

cmd5=ents.Create("rvb_control_point")
cmd5:SetModel("models/props_c17/oildrum001.mdl")
cmd5:SetPos(Vector( -577.33, 1231.38, 198.59 )) --- mid yard
cmd5:Spawn()

cmd6=ents.Create("rvb_control_point")
cmd6:SetModel("models/props_c17/oildrum001.mdl")
cmd6:SetPos(Vector( -2905.86, 267.73, 464.28 ))-----right rep wing
cmd6:Spawn()

cmd7=ents.Create("rvb_control_point")
cmd7:SetModel("models/props_c17/oildrum001.mdl")
cmd7:SetPos(Vector( 1694.51, 2126.22, 0.28 ))-----court1
cmd7:Spawn()

cmd8=ents.Create("rvb_control_point")
cmd8:SetModel("models/props_c17/oildrum001.mdl")
cmd8:SetPos(Vector( 3343.8, 3342.3, 0.28 ))------court 2
cmd8:Spawn()

cmd9=ents.Create("rvb_control_point")
cmd9:SetModel("models/props_c17/oildrum001.mdl")
cmd9:SetPos(Vector( 3350.94, 1782.87, 0.28 )) --- court 3
cmd9:Spawn()

cmd10=ents.Create("rvb_control_point")
cmd10:SetModel("models/props_c17/oildrum001.mdl")
cmd10:SetPos(Vector( 3468.7, 1119.68, 128.28 )) ---barracks
cmd10:Spawn()

cmd11=ents.Create("rvb_control_point")
cmd11:SetModel("models/props_c17/oildrum001.mdl")
cmd11:SetPos(Vector( 3447.73, -673.8, 0.28 ))----medbay
cmd11:Spawn()

cmd12=ents.Create("rvb_control_point")
cmd12:SetModel("models/props_c17/oildrum001.mdl")
cmd12:SetPos(Vector( 2044.94, -229.15, 0.28 )) ---- cantina front
cmd12:Spawn()



repbase1 = ents.Create("laat")
repbase1:SetModel("models/ish/starwars/laat/laat_mk2.mdl")
repbase1:SetPos(Vector( 591.35, 1298.24, 234.43 ))
repbase1:SetAngles(Angle( 24.28, 137.02, 32.34 ))
repbase1:Spawn()

repbase2 = ents.Create("laat")
repbase2:SetModel("models/ish/starwars/laat/laat_mk2.mdl")
repbase2:SetPos(Vector( 2029.53, 1108.24, -78.97 ))
repbase2:SetAngles(Angle( 38.72, -6.53, -0.15 ))
repbase2:Spawn()

cisbase1 = ents.Create("vulture")
cisbase1:SetModel("models/vulture/vulture1.mdl")
cisbase1:SetPos(Vector( -1230.63, 2144.09, 332.76 ))
cisbase1:SetAngles(Angle( 56.35, 33.66, 0.08 ))
cisbase1:Spawn()

cisbase2 = ents.Create("prop_physics")
cisbase2:SetModel("models/props/starwars/vehicles/sbd_dispenser.mdl")
cisbase2:SetPos(Vector( 3605.31, 2423.7, 30.65 ))
cisbase2:SetAngles(Angle( 28.83, 130.24, -36.24 ))
cisbase2:Spawn()

cisbase3 = ents.Create("prop_physics")
cisbase3:SetModel("models/props/starwars/vehicles/sbd_dispenser.mdl")
cisbase3:SetPos(Vector( 2180.7, -1208.94, 24.04 ))
cisbase3:SetAngles(Angle( 44.52, 123.7, 5.47 ))
cisbase3:Spawn()

cisbase4 = ents.Create("vulture")
cisbase4:SetModel("models/vulture/vulture1.mdl")
cisbase4:SetPos(Vector( -269.7, -1413.16, -18.55 ))
cisbase4:SetAngles(Angle( 26.18, -61.15, 3.48 ))
cisbase4:Spawn()

cisbase5 = ents.Create("prop_physics")
cisbase5:SetModel("models/props/starwars/vehicles/sbd_dispenser.mdl")
cisbase5:SetPos(Vector( 3437.87, 384.7, 0.03 ))
cisbase5:Spawn()


ammodroid1 = ents.Create("ammo_gonk_droid")
ammodroid1:SetPos( Vector( -201.05, -455.83, 0.35 ))
ammodroid1:SetAngles(Angle( 0.01, -71.45, 0 ))
ammodroid1:Spawn()

healthdroid1 = ents.Create("bacta_dispenser")
healthdroid1:SetPos( Vector( -207.35, -415.62, 2.1 ))
healthdroid1:SetAngles(Angle( 0.53, 89.82, 0 ))
healthdroid1:Spawn()

ammodroid2 = ents.Create("ammo_gonk_droid")
ammodroid2:SetPos( Vector( 2705.24, 447.37, 0.33 ))
ammodroid2:SetAngles(Angle( -0.07, -0.06, 0.01 ))
ammodroid2:Spawn()

healthdroid2 = ents.Create("bacta_dispenser")
healthdroid2:SetPos( Vector( 2659.13, 448.67, 0.15 ))
healthdroid2:SetAngles(Angle( -0.05, -0.03, 0 ))
healthdroid2:Spawn()

repspawner1 = ents.Create("blu_spawner_soldier")
repspawner1:SetPos( Vector( 406.5, 1351.15, 251.4 ))
repspawner1:Spawn()

repspawner1a = ents.Create("blu_spawner_soldier")
repspawner1a:SetPos( Vector( 261.98, 1472.14, 271.39 ))
repspawner1a:Spawn()

repspawner1b = ents.Create("blu_spawner_soldier")
repspawner1b:SetPos( Vector( 328.08, 1544.45, 131.07 ))
repspawner1b:Spawn()

repspawner1c = ents.Create("blu_spawner_clone_sniper")
repspawner1c:SetPos( Vector( 534.66, 934.73, 185.67 ))
repspawner1c:Spawn()







repspawner2 = ents.Create("blu_spawner_soldier")
repspawner2:SetPos( Vector( 1751.87, 1054.56, 900.03 ))
repspawner2:Spawn()

repspawner2a = ents.Create("blu_spawner_soldier")
repspawner2a:SetPos( Vector( 1683.54, 1222.43, 900.03 ))
repspawner2a:Spawn()

repspawner2b = ents.Create("blu_spawner_soldier")
repspawner2b:SetPos( Vector( 1780.68, 919.33, 900.03 ))
repspawner2b:Spawn()

repspawner2c = ents.Create("blu_spawner_clone_sniper")
repspawner2c:SetPos( Vector( 1590.89, 1129.12, 900.03 ))
repspawner2c:Spawn()




cisspawner1 = ents.Create("red_spawner_soldier")
cisspawner1:SetPos( Vector( -1113.16, 2020.71, 900.62 ))
cisspawner1:Spawn()

cisspawner1a = ents.Create("red_super_battle_droid")
cisspawner1a:SetPos( Vector( -1139.22, 1859.88, 900.5 ))
cisspawner1a:Spawn()

cisspawner2 = ents.Create("red_spawner_soldier")
cisspawner2:SetPos( Vector( 3461.02, 2322.65, 900.03 ))
cisspawner2:Spawn()

cisspawner2a = ents.Create("red_super_battle_droid")
cisspawner2a:SetPos( Vector( 3310.32, 2416.46, 900.03 ))
cisspawner2a:Spawn()



cisspawner3= ents.Create("red_spawner_soldier")
cisspawner3:SetPos( Vector( 2249.19, -1048.45, 900.03 ))
cisspawner3:Spawn()

cisspawner3a= ents.Create("red_spawner_soldier")
cisspawner3a:SetPos( Vector( 1974.44, -1107.96, 900.03 ))
cisspawner3a:Spawn()


cisspawner4= ents.Create("red_spawner_soldier")
cisspawner4:SetPos( Vector( -355.46, -1269.41, 900.51 ))
cisspawner4:Spawn()


cisspawner4a= ents.Create("red_super_battle_droid")
cisspawner4a:SetPos( Vector( -619.57, -1256.48, 900.13 ))
cisspawner4a:Spawn()

cisspawner5= ents.Create("red_super_battle_droid")
cisspawner5:SetPos( Vector( 3288.93, 455.8, 900.03 ))
cisspawner5:Spawn()

cisspawner6= ents.Create("red_super_battle_droid")
cisspawner6:SetPos( Vector( 3237.87, 302.38, 900.03 ))
cisspawner6:Spawn()

cisspawner7= ents.Create("red_spawner_soldier")
cisspawner7:SetPos( Vector( 3207.87, 302.38, 900.03 ))
cisspawner7:Spawn()

cisspawner8= ents.Create("red_super_battle_droid")
cisspawner8:SetPos( Vector( -146.2, 2354.66, 900.03 ))
cisspawner8:Spawn()

cisspawner9= ents.Create("red_super_battle_droid")
cisspawner9:SetPos( Vector( -67.22, 2411.95, 900.03 ))
cisspawner9:Spawn()

cisspawner10= ents.Create("red_super_battle_droid")
cisspawner10:SetPos(Vector( -27.22, 2471.95, 900.03 ))
cisspawner10:Spawn()

cisspawner11= ents.Create("red_super_battle_droid")
cisspawner11:SetPos( Vector( 2045.93, 272.33, 900.03 ))
cisspawner11:Spawn()

cisspawner12= ents.Create("red_super_battle_droid")
cisspawner12:SetPos( Vector( 1959.87, 251.91, 900.03 ))
cisspawner12:Spawn()

cisspawner13= ents.Create("red_super_battle_droid")
cisspawner13:SetPos(Vector( 2006.79, 161.72, 900 ))
cisspawner13:Spawn()
end)







function updateValueo( bob,owner )
local entities_max = ents.GetAll()
for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:SetNetworkedString("cmd1owner", cmd1.Owner)
		v:SetNetworkedString("cmd2owner", cmd2.Owner)
		v:SetNetworkedString("cmd3owner", cmd3.Owner)
		v:SetNetworkedString("cmd4owner", cmd4.Owner)
		v:SetNetworkedString("cmd5owner", cmd5.Owner)
		v:SetNetworkedString("cmd6owner", cmd6.Owner)
		v:SetNetworkedString("cmd7owner", cmd7.Owner)
		v:SetNetworkedString("cmd8owner", cmd8.Owner)
		v:SetNetworkedString("cmd9owner", cmd9.Owner)
		v:SetNetworkedString("cmd10owner", cmd10.Owner)
		v:SetNetworkedString("cmd11owner", cmd11.Owner)
		v:SetNetworkedString("cmd12owner", cmd12.Owner)
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
		v:SetNWVector("cmd6pos", Vector( 960.53, -13.83, 20.28 ))
		v:SetNWVector("cmd7pos", Vector( 1694.51, 2126.22, 20.28 ))
		v:SetNWVector("cmd8pos", Vector( 3343.8, 3342.3, 20.28 ))
		v:SetNWVector("cmd9pos", Vector( 3350.94, 1782.87, 20.28 ))
		v:SetNWVector("cmd10pos", Vector( 3468.7, 1119.68, 148.28 ))
		v:SetNWVector("cmd11pos", Vector( 3447.73, -673.8, 20.28 ))
		v:SetNWVector("cmd12pos", Vector( 2044.94, -229.15, 20.28 ))
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
	timer.Simple(5, function()
	updateValueo()
end)
end)