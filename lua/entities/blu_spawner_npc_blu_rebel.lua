
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "[BLU] 501st Soldier"
ENT.Author			= "FiLzO"
ENT.Information		= ""
ENT.Category		= "Red VS Blu"

ENT.Spawnable		= true
ENT.AdminOnly		= true

C_NPCSPAWNERDELAY = CreateConVar( "rvb_spawn_delay", "10", FCVAR_CLIENTDLL, "" )

if SERVER then

function ENT:Initialize()
	self:SetModel("models/props_c17/clock01.mdl")
	self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self:SetColor(Color(0,0,255,255))
	self:SetNoDraw(true)
	self:DrawShadow(false)
	
	self.ent1 = ents.Create("npc_blu_rebel_soldier")
	self.ent1:SetPos(self:GetPos()+self:GetUp()*10)
	self.ent1:SetAngles(self:GetAngles())
	self.ent1:Spawn()
	self.ent1:Activate()
local effectdata = EffectData()
effectdata:SetOrigin( self.ent1:GetPos() )
effectdata:SetStart( self.ent1:GetPos() )
effectdata:SetEntity( self.ent1 )
util.Effect( "cball_explode", effectdata )
	self.Delay = true
	self.RespawnTime = false
	self.OnBlu = true
end
function ENT:Think()
	if !self.ent1:IsValid() and self.Delay == false and self.OnBlu == true then
		self.RespawnTime = false
		self.Delay = true
		self:EmitSound("RVB.Spawn")
		self.ent1 = ents.Create("npc_blu_rebel_soldier")
		self.ent1:SetPos(self:GetPos()+self:GetUp()*10)
		self.ent1:SetAngles(self:GetAngles())
		self.ent1:Spawn()
		self.ent1:Activate()
local effectdata = EffectData()
effectdata:SetOrigin( self.ent1:GetPos() )
effectdata:SetStart( self.ent1:GetPos() )
effectdata:SetEntity( self.ent1 )
util.Effect( "cball_explode", effectdata )
	end
	if !IsValid(self.ent1) and self.RespawnTime == false then
	self.RespawnTime = true
	timer.Simple(C_NPCSPAWNERDELAY:GetInt(), function()
	self.Delay = false
	end)
	end
end
function ENT:OnRemove()
if IsValid(self.ent1) then
self.ent1:Remove()
end
end
end