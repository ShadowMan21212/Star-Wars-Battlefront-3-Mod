hook.Add("OnNPCKilled","yoyouo",function(npc)
	if npc:GetModel() == "models/vj_starwars/droid/b1.mdl" then
		print("yo")
		updatealpha()

	end
	end)



function updatealpha( )
local entities_max = ents.GetAll()
for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		local kill_key_value = 255
 			 v:SetNetworkedInt("kill_key",kill_key_value) 
timer.Simple(2,function()		local kill_key_value = 0
 			 v:SetNetworkedInt("kill_key",kill_key_value) end)
 			 
 			end
 		end
 	end


--timer.Simple( 1, function() updateValue() end )

--hook.Add("PlayerFootstep","yo",function()
	--updateValue()
--end)
