
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

Squad1 = "RedAlpha"
Squad2 = "RedBravo"
Squad3 = "RedCharlie"

local Squad = {}
	Squad[1] = (Squad1)
	Squad[2] = (Squad2)
	Squad[3] = (Squad3)

function ENT:Initialize()
	self:SetModel("models/props_junk/PopCan01a.mdl")
	self:SetSolid(SOLID_NONE)
	self:SetNoDraw(true)
	self:DrawShadow(false)
	
	self.targetme = ents.Create("npc_enemyfinder")
	self.targetme:Spawn()
	self.targetme:SetNoDraw(true)
	self.targetme:DrawShadow(false)
	self.targetme:SetSolid(SOLID_NONE)
	self.targetme:SetPos(self:GetPos())
	self.targetme:SetParent(self)
	self.targetme:SetKeyValue( "squadname", Squad[math.random(1,3)] )
	self.targetme:SetKeyValue( "spawnflags", "256" + "8192" )
	self.targetme:SetKeyValue( "StartOn", "1" )
	self.targetme:SetKeyValue( "FieldOfView", "-1.0" )
	self.targetme:SetHealth(99999999)
	self.targetme:SetMaxHealth(99999999)
	
end

function ENT:Relations(ent)
if IsValid(ent) then
for _, enemy in pairs( ents.GetAll() ) do
if ( enemy:IsNPC()) and enemy.Blu == nil or enemy.Spec == true then

ent:AddEntityRelationship( enemy, D_LI, 99 )

end
if ( enemy:IsNPC()) and enemy.Blu == true then

ent:AddEntityRelationship( enemy, D_HT, 99 )

end
end
end
end

function ENT:Think()
self:Relations(self.targetme)
if !IsValid( self.targetme ) or self.targetme:Health() <= 0 then
self:Remove()
end
end

function ENT:OnRemove()
if IsValid(self.targetme) then
self.targetme:Remove()
end
end



end