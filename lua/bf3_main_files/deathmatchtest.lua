#Test Gamemode
local entities = ents.GetAll()

hook.Add("OnNPCKilled","SpecialTest",function()

	for k, v in pairs(entities) do
		if v:IsPlayer() and v:GetClass() == "npc_monk" then
			v:AddFrags(1)
		
		end
	end
	

--	print("Team 1 has "..team1kills.." kills")
end)


hook.Add( "EntityTakeDamage", "EntityDamageExample", function( target, dmginfo )

	if  target:IsPlayer() then

		dmginfo:ScaleDamage( 0.2 ) // Damage is now half of what you would normally take.

	end

end )
hook.Add("EntityTakeDamage","yo",function(target,dmginfo)
	for k, v in pairs(entities) do
		if target:IsNPC() and target:GetModel() == "models/npc/player/sono/starwars/501st_trooper.mdl" then
			if dmginfo:GetDamage()>=target:Health()and v:IsPlayer() then
			v:AddFrags(2)
			
		end
		elseif target:IsNPC() and target:GetModel() == "models/vj_starwars/droid/b1.mdl" or target:GetModel() == "models/tfa/comm/gg/npc_comb_sw_droid_b2.mdl"then
			if dmginfo:GetDamage()>=target:Health()and v:IsPlayer() then
			v:AddDeaths(1)
		end
	end
end

	end)


function updateValue( bob,owner )
local entities_max = ents.GetAll()
for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		local ob = v
		for k, v in pairs(ents.FindInSphere( ob:GetPos(), 200 )) do
		if v:GetClass() == "rvb_control_point" then
			local bob = v.BluProgress
 			 v:SetNetworkedInt("vector",bob)  
 			local owner = v.Owner
 			v:SetNetworkedString("point_owner",owner)
		end
	end
	end
end
end



--timer.Simple( 1, function() updateValue() end )

--hook.Add("PlayerFootstep","yo",function()
	--updateValue()
--end) HszwldNzm

hook.Add("Tick","y",function()
	updateValue()
end)


///*surface.CreateFont( "TheDefaultSettings", {
--	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
--	extended = false,
--	size = 13,
--	weight = 500,
--	blursize = 0,
--	scanlines = 0,
--	antialias = true,
--	underline = false,
--	italic = false,
--	strikeout = false,
--	symbol = false,
	--rotary = false,
	--shadow = false,
--	additive = false,
	--outline = false,
---} )]]]

--hook.Add("HUDPaint","DrawMyHud",function()
	--local num = LocalPlayer():Frags()
	--draw.SimpleText(num,"TheDefaultSettings",10+150,10+15,Color(255,120,120),1,1)
--end )
--Ofpv WvOfxrz



