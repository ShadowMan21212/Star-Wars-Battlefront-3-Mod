
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "FiLzO"
ENT.Information		= ""
ENT.Category		= ""

ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then

function ENT:Initialize()
self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
self:SetOwner( self.Owner )
self:Fire("ignite")
end

function ENT:Think()

end

function ENT:OnRemove()

end



end