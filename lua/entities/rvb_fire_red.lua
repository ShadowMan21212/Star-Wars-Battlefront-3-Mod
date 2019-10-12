
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "PlasmaNade"
ENT.Author			= "FiLzO"
ENT.Purpose			= "They are in your mind..."
ENT.Category		= "Red Vs Blu"

ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then

function ENT:Initialize()
self:SetModel("models/weapons/w_cup_dark.mdl")
self:PhysicsInit( SOLID_VPHYSICS )
self:SetMoveType( MOVETYPE_VPHYSICS )
self:SetSolid( SOLID_VPHYSICS )
self:DrawShadow( false )
self:SetCollisionGroup( COLLISION_GROUP_WEAPON )	
self:SetColor( Color(255, 0, 0, 255) )

local zfire = ents.Create( "env_fire_trail" )
zfire:SetPos( self:GetPos() )
zfire:SetParent( self )
zfire:Spawn()
zfire:Activate()

local phys = self:GetPhysicsObject()	
if (phys:IsValid()) then
	phys:Wake()
	phys:SetMaterial("metal")
end	
local self_name = "plasmanade" .. self:EntIndex()
self:SetName( self_name )
end

function ENT:LetsBurnThisPlaceToTheGround(ent)
if IsValid(ent) then
if ent:GetPos():Distance(self:GetPos()) < 150 then
if ent.Red == true or ent.Spec == true then return end
if ent:IsNPC() or ent:IsPlayer() or ent:GetClass()=="prop_physics" or ent:GetClass()=="prop_effect" then
ent:Fire( "IgniteLifeTime", math.random( 10, 12 ), 0 )
end
end
end
end

function ENT:Think()
end

function ENT:PhysicsCollide(data,phys)
for k,v in pairs (ents.GetAll()) do
self:LetsBurnThisPlaceToTheGround(v)
end
local explo = ents.Create( "env_explosion" )
explo:SetOwner( self.Owner )
explo:SetPos( self.Entity:GetPos() )
explo:SetKeyValue( "spawnflags", "1" + "64" )
explo:SetKeyValue( "iMagnitude", "1" )
explo:Spawn()
explo:Activate()
explo:Fire( "Explode", "", 0 )

local physExplo = ents.Create( "env_physexplosion" )
physExplo:SetOwner( self.Owner )
physExplo:SetPos( self:GetPos() )
physExplo:SetKeyValue( "Magnitude", "50" )	-- Power of the Physicsexplosion
physExplo:SetKeyValue( "radius", "180" )	-- Radius of the explosion
physExplo:SetKeyValue( "spawnflags", "19" )
physExplo:Spawn()
physExplo:Fire( "Explode", "", 0.02 )
self:EmitSound("ambient/fire/gascan_ignite1.wav", 75, math.random(90,110))
self:EmitSound("physics/metal/metal_box_break1.wav", 75, math.random(90,110))
self:Remove()

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