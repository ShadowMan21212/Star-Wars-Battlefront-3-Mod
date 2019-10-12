
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "PlasmaNade"
ENT.Author			= "FiLzO"
ENT.Purpose			= "They are in your mind..."
ENT.Category		= "Combine Units +PLUS+"

ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then

function ENT:Initialize()
self:SetModel("models/dav0r/hoverball.mdl")
self:SetMaterial("models/alyx/emptool_glow")
self:PhysicsInit( SOLID_VPHYSICS )
self:SetMoveType( MOVETYPE_VPHYSICS )
self:SetSolid( SOLID_VPHYSICS )
self:EmitSound("CPrpg.Rocket")
self:SetOwner(self.Owner)
self:DrawShadow( false )
self:SetTrigger( true )
self:SetCollisionGroup( COLLISION_GROUP_WEAPON )	
self:SetColor( Color(0, 220, 255, 255) )

local phys = self:GetPhysicsObject()	
if (phys:IsValid()) then
	phys:Wake()
	phys:EnableGravity( false )
	phys:SetMaterial("metal")
end	
end

--[[function ENT:LetsBurnThisPlaceToTheGround(ent)
if IsValid(ent) then
if ent:GetPos():Distance(self:GetPos()) < math.random(200,250) and self:Visible(ent) then
if ent:GetClass()=="cup_fuel_tank" and ent:GetClass()=="npc_stalker" or ent:GetClass()=="npc_combine_s" or ent:GetClass()=="npc_metropolice" or ent:GetClass()=="npc_cscanner" or ent:GetClass()=="npc_manhack" or ent:GetClass()=="npc_strider" or ent:GetClass()=="npc_hunter" or ent:GetClass()=="npc_rollermine" or ent:GetClass()=="npc_clawscanner" or ent:GetClass()=="npc_turret_floor" or ent:GetClass()=="npc_turret_ceiling" or ent:GetClass()=="npc_combine_camera" or ent:GetClass()=="npc_combinedropship" or ent:GetClass()=="npc_combinegunship" or ent:GetClass()=="npc_helicopter" or ent:GetClass()=="npc_turret_ground" or ent:GetClass()=="npc_apcdriver" then return end
if ent:IsNPC() or ent:IsPlayer() or ent:GetClass()=="prop_physics" or ent:GetClass()=="prop_effect" then
local Dist=(self:GetPos()-ent:GetPos()):Length()
if Dist <= math.random(90,110) then
ent:Fire( "IgniteLifeTime", math.random( 5, 8 ), 0 )
end
ent:TakeDamage(Dist/2, self.Owner, DMG_DISSOLVE)
end
end
end
end]]--

function ENT:Think()
	local rocket = self.Entity:GetPhysicsObject()
	local ang = self.Entity:GetForward() * 50000
	local force = ang
	rocket:ApplyForceCenter(force)
	local hit
	local vectors = {self:GetForward() *30, self:GetUp() *25, self:GetUp() *-25}
	for k, v in pairs(vectors) do
		local tracedata = {}
		tracedata.start = self:GetPos()
		tracedata.endpos = self:GetPos() +v
		tracedata.filter = {self,self.owner}
		local trace = util.TraceLine(tracedata)
	end
	return true
end

function ENT:Devastation(ent)
--[[for k,v in pairs (ents.GetAll()) do
self:LetsBurnThisPlaceToTheGround(v)
end]]--
self:StopSound("CPrpg.Rocket")
for k,v in pairs (ents.GetAll()) do
if self:GetPos():Distance(v:GetPos()) <= 150 then
if v:IsNPC() and self.Owner.Red == true and v.StriderBlu == true then
v:TakeDamage(100, self.Owner, self)
end
if v:IsNPC() and self.Owner.Blu == true and v.StriderRed == true then
v:TakeDamage(100, self.Owner, self)
end
end
end
local explo = ents.Create( "env_explosion" )
explo:SetOwner( self.Owner )
explo:SetPos( self.Entity:GetPos() )
explo:SetKeyValue( "spawnflags", "64" )
explo:SetKeyValue( "iMagnitude", "100" )
explo:Spawn()
explo:Activate()
explo:Fire( "Explode", "", 0 )

local physExplo = ents.Create( "env_physexplosion" )
physExplo:SetOwner( self.Owner )
physExplo:SetPos( self:GetPos() )
physExplo:SetKeyValue( "Magnitude", math.random(45,85) )	-- Power of the Physicsexplosion
physExplo:SetKeyValue( "radius", "180" )	-- Radius of the explosion
physExplo:SetKeyValue( "spawnflags", "19" )
physExplo:Spawn()
physExplo:Fire( "Explode", "", 0.02 )
self:EmitSound("CPrpg.Explode")

local boom = ents.Create("env_citadel_energy_core")
boom:SetPos( self:GetPos())
boom:SetAngles( self:GetAngles() )
boom:SetOwner( self.Owner )
boom:SetKeyValue( "scale", "15" )
boom:SetKeyValue( "spawnflags", "2" )
boom:Fire( "StartCharge", 0.2, 0 )
boom:Spawn()
boom:Activate()
boom:Fire("kill","",0.3)

self:Remove()
end

function ENT:Touch(activator)
self:Devastation(activator)
end

function ENT:PhysicsCollide(data,phys)
self:Devastation(self)
end
end