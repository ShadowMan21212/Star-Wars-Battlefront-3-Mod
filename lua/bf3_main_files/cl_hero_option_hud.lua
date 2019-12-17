
local i = 0
local sig = nil
hook.Add("HUDPaint","Hero Option",function()
if i > 1 then
	 sig = true
	
		local notification = Material("materials/hud/hero_notification2.png")
		surface.SetMaterial(notification)
		surface.DrawTexturedRect( 0,0,1920,1080 )

	end
end)




hook.Add( "KeyPress", "keypress_use_hi", function( ply, key )


	if ( key == IN_USE ) and i > 1 then

		print( "hi" )

		include("bf3_main_files/hero_options.lua")
	
end
end )

function add_kill()
	i = i +1
	print(i)
end

concommand.Add("add_kill", add_kill)


local time_1 = nil
	time_2 = CurTime() + 1
local bob = 30

function print_time()
	time_1 = CurTime()
	print(time_1)
end

function add_stuff()

	if CurTime() >= time_2 then
		hook.Add( "HUDPaint", "Timeaar", function()
	draw.SimpleText( tostring(bob), "BF3FontLL", ScrW()/2, ScrH()/1.16, Color(255, 0,0) )
end )
		time_2 = CurTime() + 1
		print(bob)
		bob = bob - 1
		if bob <= 0 then
			hook.Remove("HUDPaint","Timeaar")
			hook.Remove("HUDPaint","Hero Option")
			i = 0
		end
end
end
concommand.Add("print_time",print_time)

hook.Add("Tick", "wooh",function()
	if sig == true then
	add_stuff()
end
end)

  surface.CreateFont( "BF3FontLL", {
  font = "Eurostile", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
  extended = false,
  size = 24,
  weight = 850,
  blursize = 0,
  scanlines = 0,
  antialias = true,
  underline = false,
  italic = false,
  strikeout = false,
  symbol = false,
  rotary = false,
  shadow = false,
  additive = false,
  outline = false,
} )