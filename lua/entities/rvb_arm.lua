
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Tactical Combine Arm-Shield"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Banana."
ENT.Category		= "Combine Units +PLUS+"

ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then

function ENT:Initialize()
self:SetModel("models/shield/armshield.mdl")
self:PhysicsInit( SOLID_VPHYSICS )
self:SetMoveType( MOVETYPE_VPHYSICS )
self:SetSolid( SOLID_VPHYSICS )
self:SetCollisionGroup( COLLISION_GROUP_WEAPON )	
self:SetModelScale( self:GetModelScale() * 1.15, 0 )
self:SetHealth(80) -- Blaze It ( ͡° ͜ʖ ͡°) --
self:SetMaxHealth(self:Health())
local phys = self:GetPhysicsObject()	
if (phys:IsValid()) then
	phys:Wake()
end	
local self_name = "shieldarm" .. self:EntIndex()
self:SetName( self_name )
end

function ENT:Think()
end

function ENT:PhysicsCollide(data,phys)
if data.Speed > 50 and data.Speed < 300 then
self:EmitSound("physics/metal/weapon_impact_soft" .. math.random(1,3) .. ".wav", 75, math.random(90,110))
end
if data.Speed > 300 then
self:EmitSound("physics/metal/weapon_impact_hard" .. math.random(1,3) .. ".wav", 75, math.random(90,110))
end
end

function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)
	self:SetHealth(self:Health() - dmginfo:GetDamage())
	self:EmitSound("physics/metal/metal_sheet_impact_bullet" .. math.random(1,2) .. ".wav", 75, math.random(90,110))
	if self:Health() <= 0 then
	self:EmitSound("physics/metal/metal_box_break" .. math.random(1,2) .. ".wav", 75, math.random(90,110))
	self.arm = ents.Create("prop_physics")
	self.arm:SetModel(self:GetModel())
	self.arm:SetPos( self:GetPos() )
	self.arm:SetAngles( self:GetAngles() )
	self.arm:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	self.arm:SetOwner( self.Owner )
	self.arm:Spawn()
	self.arm:Activate()
	local phys2 = self.arm:GetPhysicsObject()	
	if (phys2:IsValid()) then
	phys2:SetVelocity(self:GetForward() * math.random(-200,200) + self:GetUp() * math.random(-200,200) + self:GetRight() * math.random(-200,200))
	end	
	SafeRemoveEntityDelayed(self.arm,5)
	self.dissolver = ents.Create("env_entity_dissolver")
	self.dissolver:SetKeyValue("dissolvetype", "0")
	self.dissolver:SetKeyValue("magnitude", "1")
	self.dissolver:SetPos(self.arm:GetPos())
	self.dissolver:Spawn()
	local name = "Dissolving_"..math.random(1,9999)
	self.arm:SetName(name)
	self.dissolver:Fire("Dissolve",name,0)
	self.dissolver:Fire("kill","",0.01)
	self:Remove()
	end
end

end
