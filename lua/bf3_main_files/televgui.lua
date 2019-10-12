
hook.Add("HUDPaint","yooooooo",function()
	


	COLOR_TEAM_BLUE = Color( 153, 204, 0, 120 )
local sat = Material("C:/Users/The Asian Gamer/Desktop/New folder (9)/spawnmap3.png")
surface.SetDrawColor(255,255,255,255)
	surface.SetMaterial( sat )
	surface.DrawTexturedRect( 0, 0, 1920, 1080 )
	end)
local point1 = nil
local spawner = "repbase1tele"
local class = "repbase1tele"
		local cmd1ownersv = nil
		local cmd2ownersv = nil
		local cmd3ownersv = nil
		local cmd4ownersv = nil
		local cmd5ownersv = nil
		local cmd6ownersv = nil
		local cmd7ownersv = nil
		local cmd8ownersv = nil
		local cmd9ownersv = nil
		local cmd10ownersv = nil
		local cmd11ownersv = nil
		local cmd12ownersv = nil
function refreshcmd()
	local entities_max = ents.GetAll()
	local snilmat = Material("C:/Users/The Asian Gamer/Desktop/New folder (9)/nilcheck2.png")
	local sblumat = Material("C:/Users/The Asian Gamer/Desktop/New folder (9)/repcheck1.png")
	local sredmat = Material("C:/Users/The Asian Gamer/Desktop/New folder (9)/cischeck3.png")
	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		 cmd1ownersv = v:GetNetworkedString("cmd1owner", "fail")
		 cmd2ownersv = v:GetNetworkedString("cmd2owner", "fail")
		 cmd3ownersv = v:GetNetworkedString("cmd3owner", "fail")
		 cmd4ownersv = v:GetNetworkedString("cmd4owner", "fail")
		 cmd5ownersv = v:GetNetworkedString("cmd5owner", "fail")
		 cmd6ownersv = v:GetNetworkedString("cmd6owner", "fail")
		cmd7ownersv = v:GetNetworkedString("cmd7owner", "fail")
		 cmd8ownersv = v:GetNetworkedString("cmd8owner", "fail")
		 cmd9ownersv = v:GetNetworkedString("cmd9owner", "fail")
		 cmd10ownersv = v:GetNetworkedString("cmd10owner", "fail")
		 cmd11ownersv = v:GetNetworkedString("cmd11owner", "fail")
		cmd12ownersv = v:GetNetworkedString("cmd12owner", "fail")
		repbase1owner = v:GetNetworkedString("repbase1owner","fail")
	

		
end
end
end

hook.Add("Think","vlah",function()
	refreshcmd()
end)

refreshcmd()


	

local frame = vgui.Create("DFrame")
frame:SetSize(1920,1080)
frame:SetBGColor(COLOR_TEAM_BLUE)
frame:Center()
frame:SetVisible(true)
frame:MakePopup()
frame.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end


local defaultclone = vgui.Create("DButton",frame)
		defaultclone:SetPos(1030,-25)
		defaultclone:SetImage("materials/hud/clone1button.png")

		defaultclone:SetSize(750,210)
defaultclone.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local jugclone = vgui.Create("DButton",frame)
		jugclone:SetPos(1030,100)
		jugclone:SetImage("materials/hud/jugcloneimage.png")

		jugclone:SetSize(750,240)
jugclone.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end
local sniperclone = vgui.Create("DButton",frame)
		sniperclone:SetPos(1030,258)
		sniperclone:SetImage("materials/hud/sniper.png")

		sniperclone:SetSize(750,210)
sniperclone.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end
local jedi1 = vgui.Create("DButton",frame)
		jedi1:SetPos(1030,400)
		jedi1:SetImage("materials/hud/ferroda.png")

		jedi1:SetSize(750,210)
jedi1.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end
local x2 = vgui.Create("DButton",frame)
		x2:SetPos(1030,545)
		x2:SetImage("materials/hud/x2.png")

		x2:SetSize(750,210)
x2.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local x1 = vgui.Create("DButton",frame)
		x1:SetPos(1030,688)
		x1:SetImage("materials/hud/x1.png")
		x1:SetSize(750,210)
x1.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local commando = vgui.Create("DButton",frame)
		commando:SetPos(1030,828)
		commando:SetImage("materials/hud/commando.png")
		commando:SetSize(750,210)
commando.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cmd1 = vgui.Create("DButton",frame)
cmd1:SetPos(400,700)
cmd1:SetSize(50,40)
cmd1:SetImage(cmd1ownersv .. ".png")
cmd1.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cmd2 = vgui.Create("DButton",frame)
cmd2:SetPos(460,805)
cmd2:SetSize(500,40)
cmd2:SetImage(cmd2ownersv .. ".png")
cmd2.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end



local cmd3 = vgui.Create("DButton",frame)
cmd3:SetPos(590,850)
cmd3:SetSize(40,40)
cmd3:SetImage(cmd3ownersv .. ".png")
cmd3.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cmd4 = vgui.Create("DButton",frame)
cmd4:SetPos(675,720)
cmd4:SetSize(40,40)
cmd4:SetImage(cmd4ownersv .. ".png")
cmd4.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end
---cmd5:SetPos(567,590)
local cmd5 = vgui.Create("DButton",frame)
cmd5:SetPos(747,770)
cmd5:SetSize(40,40)
cmd5:SetImage(cmd5ownersv .. ".png")
cmd5.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end
local cmd6 = vgui.Create("DButton",frame)
cmd6:SetPos(570,590)
cmd6:SetSize(40,40)
cmd6:SetImage(cmd6ownersv .. ".png")
cmd6.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cmd7 = vgui.Create("DButton",frame)
cmd7:SetPos(340,478)
cmd7:SetSize(40,40)
cmd7:SetImage(cmd7ownersv .. ".png")
cmd7.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cmd8 = vgui.Create("DButton",frame)
cmd8:SetPos(180,278)
cmd8:SetSize(40,40)
cmd8:SetImage(cmd8ownersv .. ".png")
cmd8.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cmd9 = vgui.Create("DButton",frame)
cmd9:SetPos(390,288)
cmd9:SetSize(40,40)
cmd9:SetImage(cmd9ownersv .. ".png")
cmd9.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cmd10 = vgui.Create("DButton",frame)
cmd10:SetPos(490,272)
cmd10:SetSize(40,40)
cmd10:SetImage(cmd10ownersv .. ".png")
cmd10.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cmd11 = vgui.Create("DButton",frame)
cmd11:SetPos(720,272)
cmd11:SetSize(40,40)
cmd11:SetImage(cmd11ownersv .. ".png")
cmd11.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cmd12 = vgui.Create("DButton",frame)
cmd12:SetPos(650,462)
cmd12:SetSize(40,40)
cmd12:SetImage(cmd12ownersv .. ".png")
cmd12.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local repbase1 = vgui.Create("DButton",frame)
repbase1:SetPos(460,688)
repbase1:SetSize(40,40)
repbase1:SetImage("blu3" .. ".png")
repbase1.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local repbase2 = vgui.Create("DButton",frame)
repbase2:SetPos(469,477)
repbase2:SetSize(40,40)
repbase2:SetImage("blu3" .. ".png")
repbase2.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cisbase1 = vgui.Create("DButton",frame)
cisbase1:SetPos(360,877)
cisbase1:SetSize(40,40)
cisbase1:SetImage("red2.png")
cisbase1.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cisbase2 = vgui.Create("DButton",frame)
cisbase2:SetPos(307,254)
cisbase2:SetSize(40,40)
cisbase2:SetImage("red2.png")
cisbase2.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cisbase3 = vgui.Create("DButton",frame)
cisbase3:SetPos(737,554)
cisbase3:SetSize(40,40)
cisbase3:SetImage("red2.png")
cisbase3.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local cisbase4 = vgui.Create("DButton",frame)
cisbase4:SetPos(813,754)
cisbase4:SetSize(40,40)
cisbase4:SetImage("red2.png")
cisbase4.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local spawn_button = vgui.Create("DButton",frame)
spawn_button:SetPos(1300,1010)

spawn_button:SetImage("spawnbar.png")
spawn_button:SetSize(600,30)

spawn_button.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

function defaultclone.DoClick()
	class = "reploudout1"
end

function jugclone.DoClick()
	class = "reploudout2"
end

function sniperclone.DoClick()
	class = "reploudout3"
end
function jedi1.DoClick()
	class = "ferrodaloadout1"
end
function x2.DoClick()
	class = "x2loadout1"
end
function x1.DoClick()
	class = "x1loadout1"
end
function commando.DoClick()
	class = "commandoloadout1"
end
function cmd1.DoClick()
spawner = "cmd1tele"
refreshcmd()
end

function cmd2.DoClick()

spawner = "cmd2tele"
end

function cmd3.DoClick()

spawner = "cmd3tele"
end

function cmd4.DoClick()

spawner = "cmd4tele"
end

function cmd5.DoClick()

spawner = "cmd5tele"
end
function cmd6.DoClick()

spawner = "cmd6tele"
end
function cmd7.DoClick()

spawner = "cmd7tele"
end
function cmd8.DoClick()

spawner = "cmd8tele"
end
function cmd9.DoClick()
	spawner = "cmd9tele"
end
function cmd10.DoClick()
	spawner = "cmd10tele"
end
function cmd11.DoClick()
	spawner = "cmd11tele"
end
function cmd12.DoClick()
	spawner = "cmd12tele"
end
function repbase1.DoClick()
	spawner = "repbase1tele"
end
function repbase2.DoClick()
	spawner = "repbase2tele"
end
function spawn_button.DoClick()

	hook.Remove("HUDPaint","yooooooo")
	frame:Close()
RunConsoleCommand(spawner)
RunConsoleCommand(class)
print("jug")
end

