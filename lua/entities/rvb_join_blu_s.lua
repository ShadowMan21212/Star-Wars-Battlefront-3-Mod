
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Join BLU (Small)"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Kappa."
ENT.Category		= "Red VS Blu"

ENT.Spawnable		= true
ENT.AdminOnly		= true

if SERVER then

function ENT:Initialize()
self:SetModel("models/hunter/plates/plate3x3.mdl")
self:SetMaterial("models/debug/debugwhite")
self:PhysicsInit( SOLID_VPHYSICS )
self:SetMoveType( MOVETYPE_NONE )
self:SetSolid( SOLID_VPHYSICS )
self:DrawShadow( false )
self:SetTrigger( true )
self:SetCollisionGroup( COLLISION_GROUP_WEAPON )	
self:SetColor( Color(0, 0, 255, 255) )
self:SetUseType(SIMPLE_USE)
self.OnBlu = true
self.Ssmall = true
end

function ENT:Touch(activator)
if activator:IsPlayer() and activator.Blu == nil and self.OnBlu == true then
activator.Blu = true
activator.Red = nil
activator.Spec = nil
activator:PrintMessage( 4, "BLU Team" )
activator.SpawnPoss=self
for k,v in pairs (player.GetAll()) do
if v then
v:PrintMessage( HUD_PRINTTALK, "Player" .. " " .. activator:GetName() .. " " .. "joined team BLU" )
end
end
end
end

function ENT:OnRemove()
for k,v in pairs (player.GetAll()) do
if v then
v.Red = nil
v.Blu = nil
v.Spec = nil
v:SetPlayerColor( Vector( 255, 255, 255 ) )
end
end
end

end