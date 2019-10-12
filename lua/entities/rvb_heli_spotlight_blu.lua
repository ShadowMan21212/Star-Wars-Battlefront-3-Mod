
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
	
	self:SetModel("models/props_wasteland/light_spotlight01_lamp.mdl")
	self:SetNoDraw(true)
	self:DrawShadow(true)
	self:SetSkin(0)
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetColor(Color(0,0,255,255))
	
	local FlashBase = ents.Create("env_projectedtexture")
	FlashBase:SetParent(self)
	FlashBase:SetPos(self:GetPos() + Vector(0,0,0))
	FlashBase:SetAngles(self:GetAngles() + Angle(0,0,0))
	FlashBase:SetKeyValue('lightcolor', "0 100 255")
	FlashBase:SetKeyValue('lightfov', '40')
	FlashBase:SetKeyValue('farz', '2048')
	FlashBase:Spawn()
	FlashBase:Activate()
	
	self.spotlight = ents.Create("point_spotlight")
	self.spotlight:SetPos( self:GetPos() + Vector(0,0,4) )
	self.spotlight:SetAngles( self:GetAngles() )
	self.spotlight:SetKeyValue( "spawnflags", "1" )
	self.spotlight:SetKeyValue( "spotlightlength", "2048" )
	self.spotlight:SetKeyValue( "spotlightwidth", "120" )
	self.spotlight:Fire("LightOn")
	self.spotlight:SetKeyValue( "rendercolor", "0 100 255" )
	self.spotlight:SetOwner( self.Owner )
	self.spotlight:SetParent(self)
	self.spotlight:Spawn()
	self.spotlight:Activate()
	local spotlight_name = "helilightblu" .. self.spotlight:EntIndex()
	self.spotlight:SetName( spotlight_name )
	self.Start = false
end
function ENT:Think()
	if !IsValid (self.spotlight) then
	self:Remove()
	end
end

function ENT:OnRemove()
	if IsValid (self.spotlight) then
	self.spotlight:SetParent()
	self.spotlight:Fire("lightoff")
	self.spotlight:Fire("kill",self.spotlight, 0.5)
end
end
end