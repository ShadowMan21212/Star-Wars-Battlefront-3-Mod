
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Fuel Tank"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Top Kek."
ENT.Category		= "Combine Units +PLUS+"

ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then

function ENT:Initialize()
self:SetModel("models/props_junk/propane_tank001a.mdl")
self:PhysicsInit( SOLID_VPHYSICS )
self:SetMoveType( MOVETYPE_VPHYSICS )
self:SetSolid( SOLID_VPHYSICS )
self:SetCollisionGroup( COLLISION_GROUP_WEAPON )	
--Give own health in your npc/snpc/sent/topkek/lenny/ytp/etc.
self:SetMaxHealth(self:Health())
self.BurnOnLow = false
end

function ENT:Think()
if IsValid(self) and self:Health() <= 25 then
if self.BurnOnLow == false then
self.BurnOnLow = true
self:Fire("ignite")
end
if IsValid(self) and self:Health() <= 0 then
	self:Remove()
	local explo = ents.Create( "env_explosion" )
	explo:SetOwner( self.Owner )
	explo:SetPos( self:GetPos() )
	explo:SetKeyValue( "iMagnitude", "180" )
	explo:Spawn()
	explo:Activate()
	explo:Fire( "Explode", "", 0 )
	
	for i=1, 12 do
	local fire = ents.Create( "env_fire" )
	fire:SetPos( self.Entity:GetPos() + Vector( math.random( -100, 100 ), math.random( -100, 100 ), 0 ) )
	fire:SetKeyValue( "health", math.random( 10, 15 ) )
	fire:SetKeyValue( "firesize", "50" )
	fire:SetKeyValue( "fireattack", "8" )
	fire:SetKeyValue( "damagescale", "3.0" )
	fire:SetKeyValue( "StartDisabled", "0" )
	fire:SetKeyValue( "firetype", "0" )
	fire:SetKeyValue( "spawnflags", "132" )
	fire:Spawn()
	fire:Fire( "StartFire", "", 0.2 )
end
end
end
end

function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)
	self:SetHealth(self:Health() - dmginfo:GetDamage())
end
end
