
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
self:SetModel("models/capturepoint/white_none/base.mdl")
self:PhysicsInit( SOLID_VPHYSICS )
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

for k, v in pairs( ents.FindByClass( "rvb_control_point" ) ) do
TotalPoints = k
	if v.Owner == "red" then
		RedPoints = RedPoints + 1
	elseif v.Owner == "blu" then
		BluPoints = BluPoints + 1

	end
end

self.TotalBlu = 0
self.TotalRed = 0



----DETECT NEARBY----
for k, v in pairs(ents.FindInSphere( self:GetPos(), 200 )) do

	if v.Blu == true and IsValid(self) and v:Health() > 0 then
	table.insert(self.BluTable, v)
	end
end

for k, v in pairs(ents.FindInSphere( self:GetPos(), 200 )) do
	if v.Red == true and IsValid(self) and v:Health() > 0 then
	table.insert(self.RedTable, v)
	end
end

---CAPTURE RED---
if table.Count(self.RedTable) > table.Count(self.BluTable) and self.Owner != "red" then
self.RedProgress = self.RedProgress + table.Count(self.RedTable)
print (self.RedProgress, "---Red")
end

if table.Count(self.RedTable) == 0 or table.Count(self.RedTable) == nil then
self.RedProgress = 0

end

if self.RedProgress < 15 and self.RedProgress != 0 then
	for k,v in pairs (player.GetAll()) do
		v:PrintMessage( HUD_PRINTCENTER, "The Sepratists are capturing a command post!" )
	end
end

if self.RedProgress >= 100 and self.Owner != "red" then
	local ent = ents.Create( "red_spawner_soldier" )
	ent:SetKeyValue( "disableshadows", "1" )
	ent:SetPos( self:GetPos() )
	ent:SetModel( "" )
	ent:SetColor( 255, 255, 255, 0 )
	ent:Spawn()
	ent:Activate()
	local ent2 = ents.Create( "red_spawner_soldier" )
	ent2:SetKeyValue( "disableshadows", "1" )
	ent2:SetPos( self:GetPos() )
	ent2:SetModel( "" )
	ent2:SetColor( 255, 255, 255, 0 )
	ent2:Spawn()
	ent2:Activate()
	for k, v in pairs(ents.FindInSphere( self:GetPos(), 50 )) do
	if v:GetClass() == "blu_spawner_soldier" then
		v:Remove()
	end
	--ents.FindByClass( "blu_spawner_soldier" ):Remove()
	self.Owner = "red"
	self:SetSkin(1)
	self:SetModel("models/capturepoint/red/cis/cis_r.mdl")
	for k,v in pairs (player.GetAll()) do
		v:PrintMessage( HUD_PRINTCENTER, "The Sepratists have captured a command post!" )
	end
	
end
end
---BLU---
if table.Count(self.BluTable) > table.Count(self.RedTable) and self.Owner != "blu" then
self.BluProgress = self.BluProgress + table.Count(self.BluTable)
print (self.BluProgress, "---Blu")
end

if table.Count(self.BluTable) == 0 or table.Count(self.BluTable) == nil then
self.BluProgress = 0
end

if self.BluProgress < 15 and self.BluProgress != 0 then
	for k,v in pairs (player.GetAll()) do
		v:PrintMessage( HUD_PRINTCENTER, "The Republic is capturing a command post!" )
	end
end
--if self.Owner == "blu" then
--	for k, v in pairs(ents.FindInSphere( self:GetPos(), 50 )) do
--		if v:GetClass() == "npc_blu_combine_soldier" then
		
--		v:Remove()
--end
--end
--end
if self.BluProgress >= 100 and self.Owner == "nil" then
	local ent = ents.Create( "blu_spawner_soldier" )
	ent:SetKeyValue( "disableshadows", "1" )
	ent:SetPos( self:GetPos() )
	ent:SetModel( "" )
	ent:SetColor( 255, 255, 255, 0 )
	ent:Spawn()
	ent:Activate()

	for k, v in pairs(ents.FindInSphere( self:GetPos(), 50 )) do
	if v:GetClass() == "red_spawner_soldier" then
		v:Remove()
	end
	self.Owner = "blu"
	self:SetSkin(2)
	self:SetModel("models/capturepoint/blue/republic/republic_b.mdl")
	for k,v in pairs (player.GetAll()) do
		v:PrintMessage( HUD_PRINTCENTER, "The Republic has captured a command post!" )
	end
	
end
end
if self.BluProgress >= 97 and self.Owner == "red" then
		self.Owner = "nil"
	self:SetSkin(2)
	self:SetModel("models/capturepoint/white_none/base.mdl")
	for k, v in pairs(ents.FindInSphere( self:GetPos(), 50 )) do
	if v:GetClass() == "red_spawner_soldier" then
		v:Remove()
	end
	for k,v in pairs (player.GetAll()) do
		v:PrintMessage( HUD_PRINTCENTER, "The Republic has neutralized a command post!" )
	end
	self.BluProgress = 0
	self.RedProgress = 0
end
end
end

function ENT:OnRemove()
CONTROL_POINT_MODE = nil
end

