
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Imma Health"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Pretty smart huh? No? Alright ;_;"
ENT.Category		= ""

ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then

function ENT:Initialize()
self:SetModel("models/hunter/blocks/cube2x4x1.mdl")
self:PhysicsInit( SOLID_VPHYSICS )
self:SetMoveType( MOVETYPE_VPHYSICS )
self:SetSolid( SOLID_VPHYSICS )
self:SetOwner(self.Owner)
self:SetNoDraw(true)
self:DrawShadow(false)
self:SetCollisionGroup( COLLISION_GROUP_WEAPON )	
self:SetHealth(5600)
self:SetMaxHealth(self:Health())
end
function ENT:OnTakeDamage(dmginfo)
	local attacker = dmginfo:GetAttacker()
	if attacker.Blu == true or attacker.Spec == true then return end
	self:TakePhysicsDamage(dmginfo)
	self:SetHealth(self:Health() - dmginfo:GetDamage() * 40)
end
end
