local menu = Material("hud/kashyyyk2.png")
local map_controller = "kashyyyk"
hook.Add("HUDPaint","map_menu",function()
	

surface.SetDrawColor(255,255,255,255)
	surface.SetMaterial( menu )
	surface.DrawTexturedRect( 300, ScrH()*.2314814815, 1280, 720 )

	end)

local frame = vgui.Create("DFrame")
frame:SetSize(1920,1080)
frame:SetBGColor(COLOR_TEAM_BLUE)
frame:Center()
frame:SetVisible(true)
frame:MakePopup()
frame.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local kashyyyk_button = vgui.Create("DButton",frame)
		kashyyyk_button:SetPos(ScrW()*.129,ScrH()*.611)
		kashyyyk_button:SetText("")

		kashyyyk_button:SetSize(1050,1050)
kashyyyk_button.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

local change_button = vgui.Create("DButton",frame)
		change_button:SetPos(1200,450)
		change_button:SetImage("hud/move_button2.png")
		change_button:SetSize(200,240)
change_button.Paint = function(s,w,h)
draw.RoundedBox(5,0,0,w,h,Color(255,120,120,0))
end

function kashyyyk_button.DoClick()
	print(menu)
	if map_controller == "kashyyyk" then
		surface.PlaySound("click_audio_5.mp3")
	RunConsoleCommand("changelevel", "kashyyyk")
elseif map_controller == "tatooine" then
	surface.PlaySound("click_audio_5.mp3")
	RunConsoleCommand("changelevel", "rp_mos_mesric_v2")
end
end

function change_button.DoClick()
	if map_controller == "kashyyyk" then
		surface.PlaySound("click_audio_5.mp3")
	menu = Material("hud/tatooine.png")
	map_controller = "tatooine"
	hook.Remove("HUDPaint","map_menu")
	hook.Add("HUDPaint","map_menu",function()
		surface.SetDrawColor(255,255,255,255)
	surface.SetMaterial( menu )
	surface.DrawTexturedRect( 300, ScrH()*.2314814815, 1280, 720 )

	end)
elseif map_controller == "tatooine" then 
	surface.PlaySound("click_audio_5.mp3")
	menu = Material("hud/kashyyyk2.png")
	map_controller = "kashyyyk"
	hook.Remove("HUDPaint","map_menu")
	hook.Add("HUDPaint","map_menu",function()
		surface.SetDrawColor(255,255,255,255)
	surface.SetMaterial( menu )
	surface.DrawTexturedRect( 300, ScrH()*.2314814815, 1280, 720 )

	end)
end
end

