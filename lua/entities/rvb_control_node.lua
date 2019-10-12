
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Capture Point"
ENT.Author			= "Lesslife"
ENT.Information		= ""
ENT.Category		= "Red VS Blu"

ENT.Spawnable		= true
ENT.AdminOnly		= true


if SERVER then


function ENT:Initialize()
	self:SetModel( "models/shells/shell_12gauge.mdl" )
self:PhysicsInit( SOLID_NONE )
self:SetMoveType( MOVETYPE_NONE )
self:SetSolid( SOLID_VPHYSICS )
self:DrawShadow( false )
self.Owner = "nil"
self.Ownertarg = "nil"
self.capmsg = true
self.BluProgress = 0
self.RedProgress = 0
end
end

function ENT:Think()
CONTROL_POINT_MODE = true
RedPoints = 0
BluPoints = 0
self.RedTable = {}
self.BluTable = {}

end

function ENT:OnRemove()
CONTROL_POINT_MODE = nil
end

