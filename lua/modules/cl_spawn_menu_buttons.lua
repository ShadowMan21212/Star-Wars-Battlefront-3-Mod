local sound ="imperial_march.mp3"
hook.Add("HUDPaint","spawn_menu",function()
	
local menu = Material("hud/spawnhud3.png")
surface.SetDrawColor(255,255,255,255)
	surface.SetMaterial( menu )
	surface.DrawTexturedRect( 0, ScrH()*.2314814815, 1920, 1080 )
local icon =  Material("hud/bf3_logo.png")
	surface.SetMaterial( icon )
	surface.DrawTexturedRect( 300, 0, 1280, 720 )
	end)
 
		surface.PlaySound(sound)
local frame = vgui.Create("DFrame")
frame:SetSize(1920,1080)
frame:SetBGColor(COLOR_TEAM_BLUE)
frame:Center()
frame:SetVisible(true)
frame:MakePopup()
frame.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local singleplayer_button = vgui.Create("DButton",frame)
		singleplayer_button:SetPos(ScrW()*.229,ScrH()*.611)
		singleplayer_button:SetText("")

		singleplayer_button:SetSize(1050,90)
singleplayer_button.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local quit_button = vgui.Create("DButton",frame)
		quit_button:SetPos(ScrW()*.229,930)
		quit_button:SetText("")

		quit_button:SetSize(1050,90)
quit_button.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

function singleplayer_button.DoClick()
	surface.PlaySound("click_audio_5.mp3")
	hook.Remove("HUDPaint","spawn_menu")
	frame:Close()
	sound = nil
	include("modules/cl_map_selector_hud.lua")
end

function quit_button.DoClick()
		surface.PlaySound("click_audio_4.mp3")

RunConsoleCommand("disconnect")
end

local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then return false end

	-- Don't return anything here, it may break other addons that rely on this hook.
end )