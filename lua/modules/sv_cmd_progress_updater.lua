function updateValue( bob,owner )
local entities_max = ents.GetAll()
for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:SetNetworkedBool("pblu", v.Blu)
		v:SetNetworkedBool("pred", v.Red)
		local ob = v
		for k, v in pairs(ents.FindInSphere( ob:GetPos(), 200 )) do
		if v:GetClass() == "rvb_control_point" then
			local bluprog = v.BluProgress
 			 v:SetNetworkedInt("bluprogress",bluprog)  
 			 local redprog = v.RedProgress

 			 v:SetNetworkedInt("redprogress",redprog)  
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