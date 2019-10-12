
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "TDM Spawn"
ENT.Author			= "FiLzO"
ENT.Information		= ""
ENT.Category		= "Red VS Blu"

ENT.Spawnable		= true
ENT.AdminOnly		= true

if SERVER then

function ENT:Initialize()
	self:SetModel("models/props_c17/clock01.mdl")
	self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self:SetNoDraw(true)
	self:DrawShadow(false)
end
end