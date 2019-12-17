#rep_team

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
		defaultclone:SetPos(100,-25)
		defaultclone:SetImage("materials/hud/clone1button.png")

		defaultclone:SetSize(750,210)
defaultclone.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local jugclone = vgui.Create("DButton",frame)
		jugclone:SetPos(100,100)
		jugclone:SetImage("materials/hud/jugcloneimage.png")

		jugclone:SetSize(750,240)
jugclone.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end
local sniperclone = vgui.Create("DButton",frame)
		sniperclone:SetPos(100,258)
		sniperclone:SetImage("materials/hud/sniper.png")

		sniperclone:SetSize(750,210)
sniperclone.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end
local jedi1 = vgui.Create("DButton",frame)
		jedi1:SetPos(100,400)
		jedi1:SetImage("materials/hud/ferroda.png")

		jedi1:SetSize(750,210)
jedi1.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end
local x2 = vgui.Create("DButton",frame)
		x2:SetPos(100,545)
		x2:SetImage("materials/hud/x2.png")

		x2:SetSize(750,210)
x2.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local x1 = vgui.Create("DButton",frame)
		x1:SetPos(100,688)
		x1:SetImage("materials/hud/x1.png")
		x1:SetSize(750,210)
x1.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local commando = vgui.Create("DButton",frame)
		commando:SetPos(100,828)
		commando:SetImage("materials/hud/commando.png")
		commando:SetSize(750,210)
commando.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end




-----------------

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