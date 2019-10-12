
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Join SPECTATOR (Small)"
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
self:SetColor( Color(255, 0, 255, 255) )
self:SetUseType(SIMPLE_USE)
self.Ssmall = true
end

function ENT:Touch(activator)
if activator:IsPlayer() and activator.Spec == nil then
activator.Blu = nil
activator.Red = nil
activator.Spec = true
activator:PrintMessage( 4, "SPECTATOR" )
activator.SpawnPoss=self
for k,v in pairs (player.GetAll()) do
if v then
v:PrintMessage( HUD_PRINTTALK, "Player" .. " " .. activator:GetName() .. " " .. "joined SPECTATOR" )
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