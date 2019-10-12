
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Payload Controller"
ENT.Author			= "Lesslife"
ENT.Information		= ""
ENT.Category		= "Red VS Blu"

ENT.Spawnable		= true
ENT.AdminOnly		= true

function ENT:Initialize()
self:SetModel("models/props_lab/monitor01a.mdl")
self:PhysicsInit( SOLID_VPHYSICS )
self:SetMoveType( MOVETYPE_NONE )
self:SetSolid( SOLID_VPHYSICS )
self:DrawShadow( false )
self.BluTable = {}
TheTrain = "nil"
TheTrainRed = "nil"
self.WaitFor = 0
self.StartMoving = true
self.DoStop = false
self.ThinkDelay = 0
PAYLOAD_MODE = true
for k, v in pairs(ents.FindByClass("func_tracktrain")) do
	TheTrain = v
	end
end

function ENT:DetectCommand()

for k, v in pairs(self.CloseBluTable) do
	if !v:IsCurrentSchedule( SCHED_FORCED_GO_RUN ) and v:GetPos():Distance(TheTrain:GetPos()) > 250 and (!v:HasCondition(15) or table.Count(self.RedTable) < 4) and v.Blu == true then
		Go1 = TheTrain:GetRight() * math.random(200,-200)
		Go2 = TheTrain:GetForward() * math.random(200,-200)
		local Place = {}
		Place[1] = (Go1)
		Place[2] = (Go2)
		v:SetLastPosition(TheTrain:GetPos() + Place[math.random(1,2)])
		--print ("GO GO BLU")
		v:SetSchedule(SCHED_FORCED_GO_RUN)
	end
	
	if !v:IsCurrentSchedule( SCHED_FORCED_GO_RUN ) and !v:HasCondition(15) and v:GetPos():Distance(TheTrain:GetPos()) > 1000 and v.Red == true then
		Go1 = TheTrain:GetRight() * math.random(200,-200)
		Go2 = TheTrain:GetForward() * math.random(-200,200)
		local Place = {}
		Place[1] = (Go1)
		Place[2] = (Go2)
		v:SetLastPosition(TheTrain:GetPos() + Place[math.random(1,2)])
		--print ("GO GO RED")
		v:SetSchedule(SCHED_FORCED_GO_RUN)
	end
	
	if v:HasCondition(15) then
	--print("DONT MOVE")
	v:ClearSchedule()
	--v:StopMoving()
	end
	
end
end

function ENT:MoveTrain()
--print ("MoveDaTrain")
if IsValid(TheTrain) and table.Count(self.BluTable) > table.Count(self.RedTable) and table.Count(self.BluTable) > 0 and self.StartMoving == true then
	self.StartMoving = false
	self.DoStop = true
	TheTrain:Fire("StartForward")
	print ("FORWARD")
end

--print (table.Count(self.BluTable))

if IsValid(TheTrain) and self.DoStop == true and (table.Count(self.BluTable) < table.Count(self.RedTable) or table.Count(self.BluTable) == 0) then
	self.StartMoving = true
	self.DoStop = false
	TheTrain:Fire("Stop")
	print ("STOP CART")
end
end

function ENT:Think()
self.BluTable = {}
self.RedTable = {}
self.CloseBluTable = {}

for k, v in pairs(ents.FindInSphere( TheTrain:GetPos(), 250 )) do
	if v:GetClass() != "rvb_blu_defense_station" and v:GetClass() != "npc_turret_floor" and v.Blu == true and IsValid(self) and v:Health() > 0 then
	table.insert(self.BluTable, v)
	end
end

for k, v in pairs(ents.FindInSphere( TheTrain:GetPos(), 250 )) do
	if v:GetClass() != "rvb_red_defense_station" and v:GetClass() != "npc_turret_floor" and v.Red == true and IsValid(self) and v:Health() > 0 then
	table.insert(self.RedTable, v)
	end
end

for k, v in pairs(ents.FindByClass("npc_combine_s")) do
	if v.Blu == true or v.Red == true and IsValid(self) and v:Health() > 0 then
	table.insert(self.CloseBluTable, v)
	end
end

self:MoveTrain()

if self.ThinkDelay < CurTime() then
self.ThinkDelay = CurTime() + 2
--print ("DetectAndCommand")
self:DetectCommand()
end


end

function ENT:OnRemove()
PAYLOAD_MODE = false
end