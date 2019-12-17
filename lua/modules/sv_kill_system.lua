--#kill system
------------------------------
--#kill storage
local blu_team_kills= {}
local red_team_kills= {}

------------------------------
--#variables
local entities = ents.GetAll()
------------------------------
--#teams

local blu_team = {}
table.insert(blu_team,"npc_monk")
table.insert(blu_team,"npc_blu_b1_droid_standard")
table.insert(blu_team,"npc_blu_clone_501st_ep3_soldier")

table.insert(blu_team,"npc_blu_rebel_soldier")
table.insert(blu_team,"npc_blu_stormtrooper")
table.insert(blu_team,"npc_blu_clone_sniper")
local red_team = {}
table.insert(red_team,"npc_pigeon")
table.insert(red_team,"npc_red_b1_droid_standard")
table.insert(red_team,"npc_red_clone_501st_ep3_soldier")

table.insert(red_team,"npc_red_rebel_soldier")
table.insert(red_team,"npc_red_stormtrooper")
table.insert(red_team,"npc_red_super_battledroid")
------------------------------
--#hooks

hook.Add("OnNPCKilled","kill_additions",function(npc)
	print(npc:GetName())
if blu_team == nil then return end
if red_team == nil then return end
	if table.HasValue(red_team,npc:GetName()) == true then
		table.insert(blu_team_kills,npc)
		print(table.Count(blu_team_kills))
		for k, v in pairs(entities) do
			if v:IsPlayer() and table.HasValue(blu_team,npc:GetClass()) == true then
				v:AddFrags(1)
		end
	end
end
	
	if table.HasValue(blu_team,npc:GetName()) == true then
		table.insert(red_team_kills,npc)
		print(table.Count(red_team_kills))
	end

end)

-------------------------------
--#functions
function ply_blu(ply)
	ply.Blu = true
end


-------------------------------
--#concommands
concommand.Add("ply_blu", ply_blu)



game.GetMap()

