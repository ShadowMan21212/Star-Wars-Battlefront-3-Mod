
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Flag BLU"
ENT.Author			= "FiLzO"
ENT.Purpose			= "Kappa."
ENT.Category		= "Red VS Blu"

ENT.Spawnable		= true
ENT.AdminOnly		= true

C_CTFLIMIT = CreateConVar( "rvb_ctf_maxpoints", "5", FCVAR_CLIENTDLL, "" )

if SERVER then

function ENT:Initialize()
self:SetModel("models/props_c17/signpole001.mdl")
self:PhysicsInit( SOLID_VPHYSICS )
self:SetMoveType( MOVETYPE_VPHYSICS )
self:SetSolid( SOLID_VPHYSICS )
self:DrawShadow( false )
self:SetTrigger( true )
self:SetColor( Color(0, 0, 255, 255) )	
self:SetUseType(SIMPLE_USE)
self.Returning = false
self.BluFlag = true
self.OurPoints = 0
self.EnemyPoints = 0
local phys1 = self:GetPhysicsObject()
if ( IsValid( phys1 ) ) then	
	phys1:SetMass(1)
	phys1:EnableMotion(false)
end

self.stand = ents.Create("prop_physics")
self.stand:SetModel("models/props_c17/clock01.mdl")
self.stand:SetMaterial("models/debug/debugwhite")
self.stand:SetColor( Color(0, 0, 255, 255) )	
self.stand:SetNotSolid( true )
self.stand:SetPos( self:GetPos() + Vector(0,0,-10) )
self.stand:SetAngles( self:GetAngles() )
self.stand:SetNoDraw( false )
self.stand:DrawShadow( false )
self.stand:SetCollisionGroup(COLLISION_GROUP_WEAPON)
self.stand:SetOwner( self.Owner )
self.stand:Spawn()
self.stand:Activate()
local phys2 = self.stand:GetPhysicsObject()
if ( IsValid( phys2 ) ) then	
	phys2:EnableMotion(false)
end

self.ReturnPos = self.stand

local flagpos = self:GetPos() + self:GetForward() * 1 + self:GetUp() * 65 + self:GetRight() * 0
self.flag = ents.Create("prop_physics")
self.flag:SetModel("models/flag/bannertemplate.mdl")
self.flag:SetModelScale( self.flag:GetModelScale() * 0.7, 0 )
self.flag:SetPos( flagpos )
self.flag:SetAngles( self:GetAngles() + Angle(0,90,0) )
self.flag:SetParent(self)
self.flag:SetNotSolid( true )
self.flag:SetNoDraw( false )
self.flag:DrawShadow( false )
self.flag:SetOwner( self.Owner )
self.flag:Spawn()
self.flag:Activate()

local flag2pos = self:GetPos() + self:GetForward() * 0 + self:GetUp() * 107 + self:GetRight() * 0
self.flag2 = ents.Create("prop_physics")
self.flag2:SetModel("models/Items/combine_rifle_ammo01.mdl")
self.flag2:SetColor( Color(0, 0, 255, 255) )	
self.flag2:SetModelScale( self.flag2:GetModelScale() * 0.7, 0 )
self.flag2:SetPos( flag2pos )
self.flag2:SetAngles( self:GetAngles() )
self.flag2:SetParent(self)
self.flag2:SetNotSolid( true )
self.flag2:SetNoDraw( false )
self.flag2:DrawShadow( false )
self.flag2:SetOwner( self.Owner )
self.flag2:Spawn()
self.flag2:Activate()

util.SpriteTrail(self.flag2, 0, Color(0,0,255,255), false, 25, 0, 0.5, 0, "trails/physbeam.vmt")

end

function ENT:Touch(activator)
if (activator:IsPlayer() or activator:IsNPC()) and activator.Red == true and self.Stolen == nil then
self:SetCollisionGroup(COLLISION_GROUP_NONE)
self.Stolen = true

local phys1 = self:GetPhysicsObject()
if ( IsValid( phys1 ) ) then	
	phys1:EnableMotion(true)
end

for k,v in pairs (ents.GetAll()) do
if v:IsPlayer() and v.Blu == true then
v:PrintMessage( HUD_PRINTCENTER, activator:GetName() .. " " .. "Stole Our Flag!!! Stop Him!!!" )
v:ConCommand("play cup_sounds/flagstolen.wav")
elseif v:IsPlayer() and v.Red == true then
v:PrintMessage( HUD_PRINTCENTER, activator:GetName() .. " " .. "Stole The Enemy Flag!" )
v:ConCommand("play buttons/blip2.wav")
end
end

elseif (activator:IsPlayer() or activator:IsNPC()) and activator.Blu == true and self.Stolen == true then
self:SetPos(self.ReturnPos:GetPos())
self:SetAngles(self.ReturnPos:GetAngles())
self.Stolen = nil
self.Returning = false

local phys1 = self:GetPhysicsObject()
if ( IsValid( phys1 ) ) then	
	phys1:EnableMotion(false)
end

for k,v in pairs (ents.GetAll()) do
if v:IsPlayer() and v.Blu == true then
v:PrintMessage( HUD_PRINTCENTER, activator:GetName() .. " " .. "Got Our Flag Back!" )
v:ConCommand("play buttons/button19.wav")
end
end

elseif (activator.RedFlag == true and self.Stolen == nil) and activator.Stolen == true then

self.OurPoints = (self.OurPoints + 1)
self.EnemyPoints = activator.OurPoints
activator:SetPos(activator.ReturnPos:GetPos())
activator:SetAngles(activator.ReturnPos:GetAngles())
activator.Stolen = nil
for k,v in pairs (ents.GetAll()) do
if v:IsPlayer() and self.OurPoints < self.PointsLimit then
v:PrintMessage( HUD_PRINTCENTER, "BLU" .. " " .. self.OurPoints .. ":" .. activator.OurPoints .. " " .. "RED" )
v:ConCommand("play buttons/button19.wav")
end
end
end
end

function ENT:Think()
self.PointsLimit = C_CTFLIMIT:GetInt()
for k,v in pairs (ents.GetAll()) do
if v.RedFlag == true and self.OurPoints >= self.PointsLimit then
v.OurPoints = 0
v:SetPos(v.ReturnPos:GetPos())
v:SetAngles(v.ReturnPos:GetAngles())
v.Stolen = nil
end
end
if self.Stolen == nil then
self:SetPos(self.ReturnPos:GetPos())
self:SetAngles(self.ReturnPos:GetAngles())
local phys1 = self:GetPhysicsObject()
if ( IsValid( phys1 ) ) then
	phys1:SetVelocity( Vector(0, 0, 0) )
	phys1:EnableMotion(false)
	phys1:Sleep()
end
end
if self.OurPoints >= self.PointsLimit then
self.OurPoints = 0
for k,v in pairs (ents.GetAll()) do
if v:IsPlayer() and v.Blu == true then
v:PrintMessage( HUD_PRINTCENTER, "We Won!" )
v:ConCommand("play cup_sounds/victory.mp3")
elseif v:IsPlayer() and v.Red == true then
v:PrintMessage( HUD_PRINTCENTER, "We Lose!" )
v:ConCommand("play cup_sounds/lose.mp3")
elseif v:IsPlayer() and v.Spec == true then
v:PrintMessage( HUD_PRINTCENTER, "Blu Team Won The Match!" )
v:EmitSound("misc/clap_single_" .. math.random(1,2) .. ".wav")
end
if v.Red == true then
if v.NonNPC == true then
v:TakeDamage(999, self, self)
elseif v:IsNPC() then
v:Fire("becomeragdoll")
elseif v:IsPlayer() then
v:TakeDamage(999, self, self)
v.Blu = nil
v.Red = nil
v.Spec = true
v.SpawnPoss = nil
end
end
end
end
if self.Returning == true then
if self.Stolen == true then
self.Returning = false
self:PhysicsInit( SOLID_VPHYSICS )
self:SetMoveType( MOVETYPE_NONE )
self:SetSolid( SOLID_VPHYSICS )
self:SetPos(self.ReturnPos:GetPos())
self:SetAngles(self.ReturnPos:GetAngles())
self.Stolen = nil
for k,v in pairs (ents.GetAll()) do
if v:IsPlayer() and v.Blu == true then
v:PrintMessage( HUD_PRINTCENTER, "Our Flag Returned To Our Base." )
v:ConCommand("play buttons/button19.wav")
end
end
end
end
end

function ENT:PhysicsCollide(data,phys)
local phys = self:GetPhysicsObject()	
if data.Speed > 50 and self.Stolen == true then
local phys1 = self:GetPhysicsObject()
if ( IsValid( phys1 ) ) then	
	phys1:Sleep()
end
self:SetAngles(Angle(0, math.random(-180,180), self.stand:GetAngles().z))
self:EmitSound("CUPsmokeHit.Play")
end
end

function ENT:OnRemove()
if IsValid(self.stand) then
self.stand:Remove()
end
end

end