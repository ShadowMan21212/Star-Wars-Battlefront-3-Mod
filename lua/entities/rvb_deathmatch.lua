
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Team DeathMatch"
ENT.Author			= "FiLzO"
ENT.Information		= ""
ENT.Category		= "Red VS Blu"

ENT.Spawnable		= true
ENT.AdminOnly		= true

C_TEAMBLU = CreateConVar( "rvb_dm_blu", "5", FCVAR_CLIENTDLL, "" )
C_TEAMRED = CreateConVar( "rvb_dm_red", "5", FCVAR_CLIENTDLL, "" )
C_TEAMGOAL = CreateConVar( "rvb_dm_goal", "20", FCVAR_CLIENTDLL, "" )
C_SPAWNMODE = CreateConVar( "rvb_dm_spawn_type", "0", FCVAR_CLIENTDLL, "" )
C_NPCSPAWNERDELAY = CreateConVar( "rvb_spawn_delay", "10", FCVAR_CLIENTDLL, "" )

Typ1 = "info_player_start"
Typ2 = "info_player_deathmatch"

local Types = {}
	Types[1] = (Typ1)
	Types[2] = (Typ2)

if SERVER then

function ENT:Initialize()
	self:SetModel("models/props_c17/clock01.mdl")
	self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self:SetColor(Color(0,0,255,255))
	self:SetNoDraw(true)
	self:DrawShadow(false)
	self.DelayBlu = false
	self.DelayRed = false
	
	self.BluTeam = { 
	"npc_blu_combine_assassin", 
	"npc_blu_combine_cp", 
	"npc_blu_combine_engineer",
	"npc_blu_combine_grenadier",
	"npc_blu_combine_hg",
	"npc_blu_combine_hunter",
	"npc_blu_combine_medic",
	"npc_blu_combine_shielder",
	"npc_blu_combine_sniper",
	"npc_blu_combine_soldier",
	"npc_blu_combine_soldier_elite",
	"npc_blu_combine_soldier_s",
	"npc_blu_combine_sterilizer",
	"npc_blu_combine_synth",
	"npc_blu_combine_veteran"
	}
	
	self.RedTeam = { 
	"npc_red_combine_assassin", 
	"npc_red_combine_cp", 
	"npc_red_combine_engineer",
	"npc_red_combine_grenadier",
	"npc_red_combine_hg",
	"npc_red_combine_hunter",
	"npc_red_combine_medic",
	"npc_red_combine_shielder",
	"npc_red_combine_sniper",
	"npc_red_combine_soldier",
	"npc_red_combine_soldier_elite",
	"npc_red_combine_soldier_s",
	"npc_red_combine_sterilizer",
	"npc_red_combine_synth",
	"npc_red_combine_veteran"
	}
	
	self.Spawners = {}

	self.SpawnersNorm = {}
	
	self.SpawnedBlu = {}
	
	self.SpawnedRed = {}
	
	self.KillsBlu = 0
	
	self.KillsRed = 0
	
	self.BluSpawned = 0
	
	self.RedSpawned = 0
	
	self.Restart = true
	
	self.Start = false
	
	self.FirstBlood = false
	
end
function ENT:Think()
if C_SPAWNMODE:GetInt() == 0 then
for _,spawner in pairs (ents.FindByClass( "rvb_deathmatch_s" )) do
if !table.HasValue(self.Spawners, spawner) then
table.insert(self.Spawners, spawner)
end
end 
elseif C_SPAWNMODE:GetInt() == 1 then
table.Empty(self.Spawners)
for _,spawnerno in pairs (ents.FindByClass( Types[math.random(1,2)] )) do
if !table.HasValue(self.SpawnersNorm, spawnerno) then
table.insert(self.SpawnersNorm, spawnerno)
end
end
end
for _,players in pairs (player.GetAll()) do
if players.Blu == true or players.Red == true then
if self.Start == false then
players:Freeze(true)
end
local RandSpawn = table.Random(self.Spawners)
local RandSpawnNorm = table.Random(self.SpawnersNorm)
if C_SPAWNMODE:GetInt() == 0 then
players.SpawnPoss = RandSpawn
elseif C_SPAWNMODE:GetInt() == 1 then
players.SpawnPoss = RandSpawnNorm
end
players.DeathMatch = true
end
end
if self.DelayBlu == false and (table.Count(self.Spawners) > 0 or table.Count(self.SpawnersNorm) > 0) and self.BluSpawned <= C_TEAMBLU:GetInt() and self.Start == true then
		self.RespawnTimeBlu = false
		self.DelayBlu = true
		local RandSpawn = table.Random(self.Spawners)
		local RandSpawnNorm = table.Random(self.SpawnersNorm)
		self.BluPlay = table.Random(self.BluTeam)
		local bluplayer = ents.Create(self.BluPlay)
		if C_SPAWNMODE:GetInt() == 0 then
		bluplayer:SetPos(RandSpawn:GetPos())
		bluplayer:SetAngles(RandSpawn:GetAngles())
		elseif C_SPAWNMODE:GetInt() == 1 then
		bluplayer:SetPos(RandSpawnNorm:GetPos() + Vector(0,0,15))
		bluplayer:SetAngles(RandSpawnNorm:GetAngles())
		end
		bluplayer:Spawn()
		bluplayer:Activate()
		bluplayer:EmitSound("RVB.Spawn")
		self:DeleteOnRemove( bluplayer )
		
		self.BluSpawned = (self.BluSpawned + 1)
		
local effectdata = EffectData()
effectdata:SetOrigin( bluplayer:GetPos() )
effectdata:SetStart( bluplayer:GetPos() )
effectdata:SetEntity( bluplayer )
util.Effect( "cball_explode", effectdata )
	end
	if self.RespawnTimeBlu == false then
	self.RespawnTimeBlu = true
	timer.Simple(C_NPCSPAWNERDELAY:GetInt()/math.random(2,5), function()
	self.DelayBlu = false
	end)
	end
	
if self.DelayRed == false and (table.Count(self.Spawners) > 0 or table.Count(self.SpawnersNorm) > 0) and self.RedSpawned <= C_TEAMRED:GetInt() and self.Start == true then
		self.RespawnTimeRed = false
		self.DelayRed = true
		local RandSpawn = table.Random(self.Spawners)
		local RandSpawnNorm = table.Random(self.SpawnersNorm)
		self.RedPlay = table.Random(self.RedTeam)
		local redplayer = ents.Create(self.RedPlay)
		if C_SPAWNMODE:GetInt() == 0 then
		redplayer:SetPos(RandSpawn:GetPos())
		redplayer:SetAngles(RandSpawn:GetAngles())
		elseif C_SPAWNMODE:GetInt() == 1 then
		redplayer:SetPos(RandSpawnNorm:GetPos() + Vector(0,0,15))
		redplayer:SetAngles(RandSpawnNorm:GetAngles())
		end
		redplayer:Spawn()
		redplayer:Activate()
		redplayer:EmitSound("RVB.Spawn")
		self:DeleteOnRemove( redplayer )
		
		self.RedSpawned = (self.RedSpawned + 1)
		
local effectdata = EffectData()
effectdata:SetOrigin( redplayer:GetPos() )
effectdata:SetStart( redplayer:GetPos() )
effectdata:SetEntity( redplayer )
util.Effect( "cball_explode", effectdata )
	end
	if self.RespawnTimeRed == false then
	self.RespawnTimeRed = true
	timer.Simple(C_NPCSPAWNERDELAY:GetInt()/math.random(2,5), function()
	self.DelayRed = false
	end)
	end
	
	for k,v in pairs (player.GetAll()) do
	if self.KillsBlu < C_TEAMGOAL:GetInt() and self.KillsRed < C_TEAMGOAL:GetInt() and self.Start == true then
	v:PrintMessage( HUD_PRINTCENTER, "BLU" .. "  " .. self.KillsBlu .. " : " .. self.KillsRed .. "  " .. "RED" )
	end
	end
	
	if self.KillsBlu >= C_TEAMGOAL:GetInt() then
	self.Start = false
	self.KillsBlu = 0
	self.KillsRed = 0
	self.BluSpawned = 0
	self.RedSpawned = 0
	for k,v in pairs (ents.GetAll()) do
	if v.Red == true then
	if v:IsPlayer() then
	v:ConCommand("play cup_sounds/lose.mp3")
	end
	end
	if v.Blu == true then
	if v:IsPlayer() then
	v:ConCommand("play cup_sounds/victory.mp3")
	end
	end
	if v.Blu == true or v.Red == true then
	if v.NonNPC == true then
	v:TakeDamage(999, self, self)
	elseif v:IsNPC() then
	v:Fire("kill")
	elseif v:IsPlayer() then
	v:Freeze(true)
	end
	end
	end
	for k,v in pairs (player.GetAll()) do
	v:PrintMessage( HUD_PRINTCENTER, "BLU Team Won The Match!" )
	end
	timer.Simple(3, function()
	for k,v in pairs (player.GetAll()) do
	v:PrintMessage( HUD_PRINTCENTER, "Restart In 10 Seconds" )
	end
	end)
	timer.Simple(6, function()
	self.Restart = true
	end)
	end
	
	if self.KillsRed >= C_TEAMGOAL:GetInt() then
	self.Start = false
	self.KillsBlu = 0
	self.KillsRed = 0
	self.BluSpawned = 0
	self.RedSpawned = 0
	for k,v in pairs (ents.GetAll()) do
	if v.Blu == true then
	if v:IsPlayer() then
	v:ConCommand("play cup_sounds/lose.mp3")
	end
	end
	if v.Red == true then
	if v:IsPlayer() then
	v:ConCommand("play cup_sounds/victory.mp3")
	end
	end
	if v.Blu == true or v.Red == true then
	if v.NonNPC == true then
	v:TakeDamage(999, self, self)
	elseif v:IsNPC() then
	v:Fire("kill")
	elseif v:IsPlayer() then
	v:Freeze(true)
	end
	end
	end
	for k,v in pairs (player.GetAll()) do
	v:PrintMessage( HUD_PRINTCENTER, "RED Team Won The Match!" )
	end
	timer.Simple(5, function()
	for k,v in pairs (player.GetAll()) do
	v:PrintMessage( HUD_PRINTCENTER, "Restart In 10 Seconds." )
	end
	end)
	timer.Simple(14, function()
	self.Restart = true
	end)
	end
	
	if self.Restart == true then
	self.Restart = false
	
	for k,v in pairs (player.GetAll()) do
	v:ConCommand("play rvb_ut/ut10.wav")
	v:PrintMessage( HUD_PRINTCENTER, "10..." )
	end
	timer.Simple(1, function()
	if IsValid(self) then
	for k,v in pairs (player.GetAll()) do
	v:ConCommand("play rvb_ut/ut9.wav")
	v:PrintMessage( HUD_PRINTCENTER, "9..." )
	end
	end
	end)
	timer.Simple(2, function()
	if IsValid(self) then
	for k,v in pairs (player.GetAll()) do
	v:ConCommand("play rvb_ut/ut8.wav")
	v:PrintMessage( HUD_PRINTCENTER, "8..." )
	end
	end
	end)
	timer.Simple(3, function()
	if IsValid(self) then
	for k,v in pairs (player.GetAll()) do
	v:ConCommand("play rvb_ut/ut7.wav")
	v:PrintMessage( HUD_PRINTCENTER, "7..." )
	end
	end
	end)
	timer.Simple(4, function()
	if IsValid(self) then
	for k,v in pairs (player.GetAll()) do
	v:ConCommand("play rvb_ut/ut6.wav")
	v:PrintMessage( HUD_PRINTCENTER, "6..." )
	end
	end
	end)
	timer.Simple(5, function()
	if IsValid(self) then
	for k,v in pairs (player.GetAll()) do
	v:ConCommand("play rvb_ut/ut5.wav")
	v:PrintMessage( HUD_PRINTCENTER, "5..." )
	end
	end
	end)
	timer.Simple(6, function()
	if IsValid(self) then
	for k,v in pairs (player.GetAll()) do
	v:ConCommand("play rvb_ut/ut4.wav")
	v:PrintMessage( HUD_PRINTCENTER, "4..." )
	end
	end
	end)
	timer.Simple(7, function()
	if IsValid(self) then
	for k,v in pairs (player.GetAll()) do
	v:ConCommand("play rvb_ut/ut3.wav")
	v:PrintMessage( HUD_PRINTCENTER, "3..." )
	end
	end
	end)
	timer.Simple(8, function()
	if IsValid(self) then
	for k,v in pairs (player.GetAll()) do
	v:ConCommand("play rvb_ut/ut2.wav")
	v:PrintMessage( HUD_PRINTCENTER, "2..." )
	end
	end
	end)
	timer.Simple(9, function()
	if IsValid(self) then
	for k,v in pairs (player.GetAll()) do
	v:ConCommand("play rvb_ut/ut1.wav")
	v:PrintMessage( HUD_PRINTCENTER, "1..." )
	end
	end
	end)
	timer.Simple(10, function()
	if IsValid(self) then
	for k,v in pairs (player.GetAll()) do
	--v:ConCommand("play rvb_ut/ut1.wav")
	v:PrintMessage( HUD_PRINTCENTER, "BEGINS!" )
	end
	end
	end)
	timer.Simple(12, function()
	if IsValid(self) then
	self.FirstBlood = false
	self.Start = true
	for k,v in pairs (player.GetAll()) do
	if v.Blu == true or v.Red == true then
	v:SetHealth(100)
	v:SetArmor(0)
	v:Freeze(false)
	v:EmitSound("RVB.Spawn")
	v:SetPos(v.SpawnPoss:GetPos())
	v:SetEyeAngles(v.SpawnPoss:GetAngles() + Angle(0,180,0))

	local effectdata = EffectData()
	effectdata:SetOrigin( v:GetPos() )
	effectdata:SetStart( v:GetPos() )
	effectdata:SetEntity( v )
	util.Effect( "entity_remove", effectdata )
	end
	end
	end
	end)
	end
	
	if (self.KillsBlu > 0 or self.KillsRed > 0) and self.FirstBlood == false then
	for k,v in pairs (player.GetAll()) do
	self.FirstBlood = true
	v:ConCommand("play rvb_ut/ut_first.wav")
	end
	end
	
end
function ENT:OnRemove()
for k,v in pairs (player.GetAll()) do
	v:Freeze(false)
	v.DeathMatch = false
end
end
end