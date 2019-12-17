#side setter
	local hudimage = Material("hud/spawn_hud_test2.png")


local team_class_selection = nil

local frame = vgui.Create("DFrame")
frame:SetSize(1920,1080)
frame:SetBGColor(255,255,255)
frame:Center()
frame:SetVisible(true)
frame:MakePopup()
frame.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end



local republic = vgui.Create("DButton",frame)

republic:SetPos(850,420)
republic:SetImage("hud/clearrep.png")
republic:SetSize( 300, 50 )
republic.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end






local cis = vgui.Create("DButton",frame)
cis:SetPos(850,460)
cis:SetImage("hud/clearcis.png")
cis:SetSize( 300, 50 )
cis.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end



local rebels = vgui.Create("DButton",frame)
rebels:SetPos(850,500)
rebels:SetImage("hud/clearrebels.png")
rebels:SetSize( 300, 50 )


rebels.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local empire = vgui.Create("DButton",frame)
empire:SetPos(850,540)
empire:SetImage("hud/clearempire.png")
empire:SetSize( 300, 50 )

empire.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end



local menu = nil
local team = nil
local  model = "models/player/sono/starwars/501st_trooper.mdl"



local icon = vgui.Create( "DModelPanel" )
icon:SetSize( 400, 400 )
icon:SetPos(600, 350)
icon:SetModel( model )

function republic.DoClick()
	surface.PlaySound("click_audio_5.mp3")
	RunConsoleCommand("select_blu_republic")
	RunConsoleCommand("select_red_cis")
		RunConsoleCommand("select_blu_republic1")
	RunConsoleCommand("select_red_cis1")
	RunConsoleCommand("select_blu_republicpic")
	RunConsoleCommand("select_red_cispic")
	menu = Material("hud/rep_image.png")
	team_class_selection = "cl_rep_team.lua"
	team = "republic"
	model = "models/player/sono/starwars/501st_trooper.mdl"
	icon:SetModel( model )
	
end


function cis.DoClick()
	surface.PlaySound("click_audio_5.mp3")
	RunConsoleCommand("select_blu_cis")
	RunConsoleCommand("select_red_republic")
		RunConsoleCommand("select_blu_cis1")
	RunConsoleCommand("select_red_republic1")
		RunConsoleCommand("select_red_republicpic")
	RunConsoleCommand("select_blu_cispic")
	menu = Material("hud/cis_image.png")
	team = "cis"
	model = "models/npc/b2_battledroid/b2_battledroid.mdl"
	icon:SetModel( model )
end

function rebels.DoClick()
	surface.PlaySound("click_audio_5.mp3")
	RunConsoleCommand("select_blu_rebels")
	RunConsoleCommand("select_red_empire")
		RunConsoleCommand("select_blu_rebels1")
	RunConsoleCommand("select_red_empire1")
	RunConsoleCommand("select_blu_rebelspic")
	RunConsoleCommand("select_red_empirepic")
	menu = Material("hud/cis_image.png")
	team = "rebels"
	model = "models/player/sgg/starwars/rebels/r_soldier_forest/male_02.mdl"
	icon:SetModel( model )
end

function empire.DoClick()
	surface.PlaySound("click_audio_5.mp3")
	RunConsoleCommand("select_blu_empire")
	RunConsoleCommand("select_red_rebels")
		RunConsoleCommand("select_blu_empire1")
	RunConsoleCommand("select_red_rebels1")
	RunConsoleCommand("select_blu_empirepic")
	RunConsoleCommand("select_red_rebelspic")
	menu = Material("hud/cis_image.png")
	team = "empire"
	model = "models/player/ven/tk_basic_npc/tk_basic.mdl"
	icon:SetModel( model )
end

--hook.Add("HUDPaint","spawn_menu",function()
	--if menu == nil then return end

--surface.SetDrawColor(255,255,255,255)
	--surface.SetMaterial( menu )
	--surface.DrawTexturedRect( 100, 140, 1280, 720 )

--	end)

local spawn_button = vgui.Create("DButton",frame)
spawn_button:SetPos(1300,1010)

spawn_button:SetImage("hud/spawnbar.png")
spawn_button:SetSize(600,30)

spawn_button.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end



function spawn_button.DoClick()
	surface.PlaySound("click_audio_5.mp3")
	---include("modules/"..team_class_selection)
	include("modules/cl_cmd_sounds.lua")
RunConsoleCommand("spawn_flag_activate")
include("bf3_main_files/"..game.GetMap().."_"..team.."_televgui.lua")
	frame:Close()
	icon:Remove()
		hook.Remove("HUDPaint","spawn_menu")
	RunConsoleCommand("spawn_assets")
end

