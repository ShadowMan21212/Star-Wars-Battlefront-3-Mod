
local enetitiesmax = ents.GetAll()
for k,v in pairs(enetitiesmax) do
	if v:IsPlayer() then
timer.Simple( 1, function()
	print("yo")
		v:SetEyeAngles(Angle( 3.43, 90.1, 0 ))
	v:SetPos(Vector( 801.36, -3509.61, 1088.03 ))

	v:StripWeapons()

	RunConsoleCommand("spawn_menu_launch")
end)
end
end
