
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Tactical Super Combine Shield"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Banana."
ENT.Category		= "Combine Units +PLUS+"

ENT.Spawnable		= false
ENT.AdminOnly		= false

if SERVER then

function ENT:Initialize()
self:SetModel("models/hunter/tubes/tube1x1x1c.mdl")
self:SetMaterial("models/effects/vol_light001")
self:PhysicsInit( SOLID_VPHYSICS )
self:SetMoveType( MOVETYPE_VPHYSICS )
self:SetSolid( SOLID_VPHYSICS )
self:DrawShadow( false )
self:SetNoDraw( true )
self:SetCollisionGroup( COLLISION_GROUP_WEAPON )	
self:SetHealth(200) -- Blaze It ( ͡° ͜ʖ ͡°) --
self:SetMaxHealth(self:Health())
local phys = self:GetPhysicsObject()	
if (phys:IsValid()) then
	phys:Wake()
	phys:SetMaterial("metal")
end	
local self_name = "shield" .. self:EntIndex()
self:SetName( self_name )
local spawnpos = self:GetPos() + self:GetForward() * 0.5 + self:GetUp() * 0 + self:GetRight() * 0
self.shield2 = ents.Create("prop_physics")
self.shield2:SetModel(self:GetModel())
self.shield2:SetPos( spawnpos )
self.shield2:SetAngles( self:GetAngles() )
self.shield2:SetParent(self)
self.shield2:SetNoDraw( true )
self.shield2:DrawShadow( false )
self.shield2:SetCollisionGroup(COLLISION_GROUP_WEAPON)
self.shield2:SetOwner( self.Owner )
self.shield2:Spawn()
self.shield2:Activate()
local phys2 = self.shield2:GetPhysicsObject()	
if (phys2:IsValid()) then
	phys2:Wake()
	phys2:SetMaterial("metal")
end	
end

function ENT:Think()
if IsValid(self.shield2) then
self.shield2:SetModel(self:GetModel())
end
end

--function ENT:PhysicsCollide(data,phys)
--if data.Speed > 50 and data.Speed < 300 then
--self:EmitSound("physics/metal/weapon_impact_soft" .. math.random(1,3) .. ".wav", 75, math.random(90,110))
--end
--if data.Speed > 300 then
--self:EmitSound("physics/metal/weapon_impact_hard" .. math.random(1,3) .. ".wav", 75, math.random(90,110))
--end
--end

function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)
	self:SetHealth(self:Health() - dmginfo:GetDamage()/1.5)
	self:EmitSound("ambient/energy/newspark0" .. math.random(1,6) .. ".wav", 75, math.random(90,110))
	self:SetNoDraw( false )
	self.calleffect = EffectData()
	self.calleffect:SetStart( self:GetPos() )
	self.calleffect:SetOrigin( self:GetPos() )
	self.calleffect:SetMagnitude(50)
	self.calleffect:SetEntity( self )
	util.Effect( "propspawn", self.calleffect )
	timer.Simple(0.4, function()
	if IsValid(self) then
	self:SetNoDraw( true )
	end
	end)
	if self:Health() <= 0 then
	self:EmitSound("ambient/machines/thumper_shutdown1.wav", 75, 150)
	self:SetModel("models/weapons/shell.mdl")
	
	self.tes = ents.Create( "point_tesla" )
	self.tes:SetPos( self:GetPos() + Vector(0,0,30) )
	self.tes:SetKeyValue( "m_SoundName", "DoSpark" )
	self.tes:SetKeyValue( "texture", "sprites/combineball_trail_blue_1.spr" )
	self.tes:SetKeyValue( "m_Color", "255 255 255" )
	self.tes:SetKeyValue( "m_flRadius", "100" )
	self.tes:SetKeyValue( "beamcount_max", "10" )
	self.tes:SetKeyValue( "thick_min", "15" )
	self.tes:SetKeyValue( "thick_max", "30" )
	self.tes:SetKeyValue( "lifetime_min", "0.1" )
	self.tes:SetKeyValue( "lifetime_max", "0.3" )
	self.tes:SetKeyValue( "interval_min", "0.1" )
	self.tes:SetKeyValue( "interval_max", "0.2" )
	self.tes:Spawn()
	self.tes:Fire( "DoSpark", "", 0.1 )
	self.tes:Fire( "DoSpark", "", 0.2 )
	self.tes:Fire( "DoSpark", "", 0.3 )
	self.tes:Fire( "DoSpark", "", 0.4 )
	self.tes:Fire( "kill", "", 0.6 )
	
	timer.Simple(20, function()
	if IsValid(self) then
	self:SetModel("models/hunter/tubes/tube1x1x1c.mdl")
	self:SetHealth(200)
	self:EmitSound("ambient/machines/thumper_startup1.wav", 75, 150)
	self:SetNoDraw( false )
	timer.Simple(0.1, function()
	if IsValid(self) then
	self:SetNoDraw( true )
	end
	end)
	end
	end)
	end
end

end
