
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Capture Point"
ENT.Author			= "Lesslife"
ENT.Information		= ""
ENT.Category		= "Red VS Blu"

ENT.Spawnable		= true
ENT.AdminOnly		= true

local blu_team = nil

local red_team = nil


local pblu = nil
local pred = nil
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
	local entities_max = ents.GetAll()
	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
	pblu = v:GetNetworkedBool("pblu",nil)
	pred = v:GetNetworkedBool("pred",nil)
	print(pred)
end
end
	local ent = ents.Create( red_team )
	ent:SetKeyValue( "disableshadows", "1" )
	ent:SetPos( self:GetPos() )
	ent:SetModel( "" )
	ent:SetColor( 255, 255, 255, 0 )
	ent:Spawn()
	ent:Activate()

	for k, v in pairs(ents.FindInSphere( self:GetPos(), 50 )) do
	if v:GetClass() == "blu_spawner_soldier" then
		v:Remove()
	end
	--ents.FindByClass( "blu_spawner_soldier" ):Remove()
	self.Owner = "red"
	if red_team == "red_spawner_npc_red_b1_droid_standard" then 
	self:SetSkin(1)
	self:SetModel("models/capturepoint/red/cis/cis_r.mdl")--models/capturepoint/blue/cis/cis_b.mdl
		RunConsoleCommand("replos")
	elseif red_team == "red_spawner_npc_red_stormtrooper" then
		self:SetSkin(1)
	self:SetModel("models/capturepoint/red/imperial/imperial_r.mdl")--models/capturepoint/blue/cis/cis_b.mdl
		RunConsoleCommand("replos")
			elseif red_team == "red_spawner_npc_red_rebel" then
		self:SetSkin(1)
	self:SetModel("models/capturepoint/red/rebels/rebels_r.mdl")--models/capturepoint/blue/cis/cis_b.mdl
		RunConsoleCommand("replos")
else

		self:SetSkin(1)
	self:SetModel("models/capturepoint/red/republic/republic_r.mdl")--models/capturepoint/red/republic/republic_r.mdl
	RunConsoleCommand("seplos")
end
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
	if blu_team == "blu_spawner_npc_blu_stormtrooper" then
		RunConsoleCommand("impcap")
	end
	if blu_team == "blu_spawner_npc_blu_clone_501st_ep3_soldier" then 
		RunConsoleCommand("repcap")
	end
	if blu_team == "blu_spawner_npc_blu_rebel" then
		RunConsoleCommand("repcap")
	end
		local entities_max = ents.GetAll()
	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
	pblu = v:GetNetworkedBool("pblu",nil)
	pred = v:GetNetworkedBool("pred",nil)
	print(pred)
end
end
	local ent = ents.Create( blu_team )
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
	if blu_team == "blu_spawner_npc_blu_clone_501st_ep3_soldier" then 
	self:SetSkin(2)
	self:SetModel("models/capturepoint/blue/republic/republic_b.mdl")
	
	elseif blu_team == "blu_spawner_npc_blu_rebel" then
	self:SetSkin(2)
	self:SetModel("models/capturepoint/blue/rebels/rebels_b.mdl") --models/capturepoint/blue/cis/cis_b.mdl
	
	elseif blu_team == "blu_spawner_npc_blu_stormtrooper" then
	self:SetSkin(2)
	self:SetModel("models/capturepoint/blue/imperial/imperial_b.mdl") --models/capturepoint/blue/cis/cis_b.mdl
	
	
else
		self:SetSkin(2)
	self:SetModel("models/capturepoint/blue/cis/cis_b.mdl") --models/capturepoint/blue/cis/cis_b.mdl
	RunConsoleCommand("sepcap")
end
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

function blu_republic()
	blu_team = "blu_spawner_npc_blu_clone_501st_ep3_soldier"
end
function blu_cis()
	blu_team = "blu_spawner_npc_blu_b1_droid_standard"
end
function red_republic()
	red_team = "red_spawner_npc_red_clone_501st_ep3_soldier"
end
function red_cis()
	red_team = "red_spawner_npc_red_b1_droid_standard"
end

function red_empire()
	red_team = "red_spawner_npc_red_stormtrooper"
end
function red_rebels()
	red_team = "red_spawner_npc_red_rebel"
end

function blu_rebels()
	blu_team = "blu_spawner_npc_blu_rebel"
end
function blu_empire()
	blu_team = "blu_spawner_npc_blu_stormtrooper"
end
concommand.Add("select_blu_republic", blu_republic)
concommand.Add("select_blu_cis", blu_cis)
concommand.Add("select_red_republic", red_republic)
concommand.Add("select_red_cis", red_cis)
concommand.Add("select_blu_rebels", blu_rebels)
concommand.Add("select_blu_empire", blu_empire)
concommand.Add("select_red_rebels", red_rebels)
concommand.Add("select_red_empire", red_empire)