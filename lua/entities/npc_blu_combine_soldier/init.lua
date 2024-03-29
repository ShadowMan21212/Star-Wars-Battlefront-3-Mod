AddCSLuaFile( "shared.lua" )

include('shared.lua')

C_RVBWEAPON = CreateConVar( "rvb_weapon", "none", FCVAR_CLIENTDLL, "Give them your own weapon." )

function ENT:SpawnFunction( ply, tr )
	if ( !tr.Hit ) then return end

	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	self.Spawn_angles = ply:GetAngles()
	self.Spawn_angles.pitch = 0
	self.Spawn_angles.roll = 0
	self.Spawn_angles.yaw = self.Spawn_angles.yaw + 180

	local ent = ents.Create( "npc_blu_combine_soldier" )
	ent:SetKeyValue( "disableshadows", "1" )
	ent:SetPos( SpawnPos )
	ent:SetAngles( self.Spawn_angles )
	ent:SetModel( "" )
	ent:SetColor( 255, 255, 255, 0 )
	ent:Spawn()
	ent:Activate()
	return ent
end

NS1 = WEAPON_PROFICIENCY_POOR
NS2 = WEAPON_PROFICIENCY_AVERAGE
NS3 = WEAPON_PROFICIENCY_GOOD
NS4 = WEAPON_PROFICIENCY_VERY_GOOD
NS5 = WEAPON_PROFICIENCY_PERFECT

local Skill = {}
	Skill[1] = (NS1)
	Skill[2] = (NS2)
	Skill[3] = (NS3)
	Skill[4] = (NS4)
	Skill[5] = (NS5)

Weap1 = "weapon_752_dc15s"
Weap2 = "weapon_752_dc15s"
Weap3 = "weapon_752_dc15s"

local Weapon = {}
	Weapon[1] = (Weap1)
	Weapon[2] = (Weap2)
	Weapon[3] = (Weap3)

Squad1 = "BluAlpha"
Squad2 = "BluBravo"
Squad3 = "BluCharlie"

local Squad = {}
	Squad[1] = (Squad1)
	Squad[2] = (Squad2)
	Squad[3] = (Squad3)

function ENT:Initialize()
	self.blusoldier = ents.Create( "npc_combine_s" )
	self:SetModel( "models/shells/shell_12gauge.mdl" )
	self.blusoldier:SetPos( self:GetPos() )
	self.blusoldier:SetAngles( self:GetAngles() )
	self.blusoldier:SetKeyValue( "model", "models/npc/player/sono/starwars/501st_trooper.mdl" ) ---models/hyperspace_network/501st_trooper_npc/501st_trooper_npc.mdl
	self.blusoldier:SetKeyValue( "spawnflags", "256" + "8192" )
	self.blusoldier:SetKeyValue( "squadname", Squad[math.random(1,3)] )
	if GetConVarNumber("rvb_mp_mode") == 0 then
	self.blusoldier:SetKeyValue( "additionalequipment", GetConVarString("gmod_npcweapon") )
	if GetConVarString("gmod_npcweapon") == "" then
	self.blusoldier:SetKeyValue( "additionalequipment", Weapon[math.random(1,3)] )
	end
	end
	if GetConVarNumber("rvb_mp_mode") == 1 then
	self.blusoldier:SetKeyValue( "additionalequipment", C_RVBWEAPON:GetString() )
	if (C_RVBWEAPON:GetString() == "none" ) then
	self.blusoldier:SetKeyValue( "additionalequipment", Weapon[math.random(1,3)] )
	end
	end
	self.blusoldier:SetKeyValue( "tacticalvariant", "0" )
	self.blusoldier:SetKeyValue( "NumGrenades", "5" )
	self.blusoldier:CapabilitiesAdd(CAP_FRIENDLY_DMG_IMMUNE)
	self.blusoldier:Spawn()
	self.blusoldier:Activate()
	self.blusoldier:SetCurrentWeaponProficiency( Skill[math.random(4,5)] )
	local blusoldier_name = "blusoldier" .. self.blusoldier:EntIndex()
	self.blusoldier:SetName( blusoldier_name )
	self.PatrolNodesMemory = {}
	self.PatrolNodesMax = {}
	self.WaitHereAndCheck = 0
	self.bob = true
	if IsValid( self.blusoldier ) then
		self.blusoldier.Commandable = true
		self.blusoldier.Commanded = false
		self.blusoldier.CommandedNPC = false
		self.blusoldier.HaveCommander = false
		self.blusoldier.Blu = true
		self.blusoldier:SetHealth(100)
		self.blusoldier:SetMaxHealth(100)
end
end

function ENT:InjuredEffect(ent)
if IsValid(ent) then
if ent:Health() <= ent:GetMaxHealth() * .10 then
if ( IsValid( ent ) and ent:GetMovementActivity() != ACT_WALK_CROUCH ) then
ent:SetMovementActivity( ACT_WALK_CROUCH )
end
self.Injured = 1
else
self.Injured = 0
end
end
end

function ENT:Relations(ent)
if IsValid(ent) then
for _, enemy in pairs( ents.GetAll() ) do
if (enemy:IsPlayer() or enemy:IsNPC()) and (enemy.Blu == true or enemy.Spec == true) then

ent:AddEntityRelationship( enemy, D_LI, 99 )

end
if (enemy:IsPlayer() or enemy:IsNPC()) and enemy.Red == true and enemy:GetPos():Distance(self:GetPos()) < 400 then

ent:AddEntityRelationship( enemy, D_HT, 99 )

end
end
end
end

function ENT:MakeItMoreAmazing(ent)
if IsValid(ent) then
if self.HaveTarget == nil or self.HaveTarget == false then
self.HaveTarget = true
self.overhere = ents.Create("blu_finder")
self.overhere:SetPos(ent:GetPos())
self.overhere:SetParent(ent)
self.overhere:Spawn()
self:DeleteOnRemove( self.overhere )
end
end
end

function ENT:Patroll(ent)
if IsValid(ent) then
if ent:GetEnemy() then
self.Patrolling = false
else
self.Patrolling = true
end
if(self.Patrolling == true and self.Injured == 0 and !ent:IsCurrentSchedule( SCHED_IDLE_WANDER )) then
ent:SetSchedule(SCHED_IDLE_WANDER)
ent:Fire("StopPatrolling")
end
end
end

function ENT:PatrollNew(ent)
if IsValid(ent) then
if (table.Count(self.PatrolNodesMemory, PatrolNode)) >= (table.Count(self.PatrolNodesMax, PatrolNode)) then
table.Empty(self.PatrolNodesMemory)
end
if ent:GetEnemy() then
self.Patrolling = false
if self.GetHim == false then
self.GetHim = true
end
else
self.Patrolling = true
self.GetHim = false
end
for _, PatrolNode in pairs( ents.FindByClass( "rvb_control_point" ) ) do
if !table.HasValue(self.PatrolNodesMax, PatrolNode) and PatrolNode.Owner != "blu" then
table.insert(self.PatrolNodesMax, PatrolNode)
end
if ent:GetPos():Distance(PatrolNode:GetPos()) < 110 then
if self.WaitHereAndCheck > CurTime() then return end
if !table.HasValue(self.PatrolNodesMemory, PatrolNode) then
self.WaitHereAndCheck = CurTime() + math.random(13,18)
table.insert(self.PatrolNodesMemory, PatrolNode)
end
end
end
local RandomNode = table.Random(self.PatrolNodesMax)
if (table.Count(self.PatrolNodesMax, PatrolNode) <= 0) then
table.Empty(self.PatrolNodesMax)
end
if IsValid(RandomNode) and (!table.HasValue(self.PatrolNodesMemory, PatrolNode) and self.Patrolling == true and self.Injured == 0 and !ent:IsCurrentSchedule( SCHED_FORCED_GO_RUN )and RandomNode.Owner != "blu" ) then
ent:SetSaveValue( "m_vecLastPosition", RandomNode:GetPos() )
ent:SetSchedule( SCHED_FORCED_GO_RUN )
ent:Fire("StopPatrolling")
end
end
for _, PatrolNode in pairs( ents.FindByClass( "rvb_control_node" ) ) do
if !table.HasValue(self.PatrolNodesMax, PatrolNode) and PatrolNode.Owner != "blu" then
table.insert(self.PatrolNodesMax, PatrolNode)
end
if ent:GetPos():Distance(PatrolNode:GetPos()) < 1 then
if self.WaitHereAndCheck > CurTime() then return end
if !table.HasValue(self.PatrolNodesMemory, PatrolNode) then
self.WaitHereAndCheck = 0
table.insert(self.PatrolNodesMemory, PatrolNode)
end
end
end
local RandomNode = table.Random(self.PatrolNodesMax)
if (table.Count(self.PatrolNodesMax, PatrolNode) <= 0) then
table.Empty(self.PatrolNodesMax)
end
if IsValid(RandomNode) and (!table.HasValue(self.PatrolNodesMemory, PatrolNode) and self.Patrolling == true and self.Injured == 0 and !ent:IsCurrentSchedule( SCHED_FORCED_GO_RUN )and RandomNode.Owner != "blu" ) then

ent:SetSaveValue( "m_vecLastPosition", RandomNode:GetPos() )
ent:SetSchedule( SCHED_FORCED_GO_RUN )
ent:Fire("StopPatrolling")

end
end


function ENT:Think()
	if IsValid( self.blusoldier ) then

	self:MakeItMoreAmazing(self.blusoldier)

	self:Relations(self.blusoldier)

	self:InjuredEffect(self.blusoldier)

	if ( CONTROL_POINT_MODE == nil ) then
	self.PlatrolType = 2
	else
	self.PlatrolType = 1
	end

	if ( self.PlatrolType == 2 and PAYLOAD_MODE == nil) then
	self:Patroll(self.blusoldier)
	end

	if ( self.PlatrolType == 1 ) then
	self:PatrollNew(self.blusoldier)
	end

	end
if !IsValid( self.blusoldier ) or self.blusoldier:Health() <= 0 then
self:Remove()
end
end

function ENT:OnTakeDamage()
end

function ENT:OnRemove()
	if IsValid( self.blusoldier ) then
		self.blusoldier:Remove()
	end
end
