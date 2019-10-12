
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Join RED"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Kappa."
ENT.Category		= "Red VS Blu"

ENT.Spawnable		= true
ENT.AdminOnly		= true

if SERVER then

function ENT:Initialize()
self:SetModel("models/hunter/plates/plate6x6.mdl")
self:SetMaterial("models/debug/debugwhite")
self:PhysicsInit( SOLID_VPHYSICS )
self:SetMoveType( MOVETYPE_NONE )
self:SetSolid( SOLID_VPHYSICS )
self:DrawShadow( false )
self:SetTrigger( true )
self:SetCollisionGroup( COLLISION_GROUP_WEAPON )	
self:SetColor( Color(255, 0, 0, 255) )
self:SetUseType(SIMPLE_USE)
self.OnRed = true
end

function ENT:Touch(activator)
if activator:IsPlayer() and activator.Red == nil and self.OnRed == true then
activator.Blu = nil
activator.Red = true
activator.Spec = nil
activator:PrintMessage( 4, "RED Team" )
activator.SpawnPoss=self
for k,v in pairs (player.GetAll()) do
if v then
v:PrintMessage( HUD_PRINTTALK, "Player" .. " " .. activator:GetName() .. " " .. "joined team RED" )
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