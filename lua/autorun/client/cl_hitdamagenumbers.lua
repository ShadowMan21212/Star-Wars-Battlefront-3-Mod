// Edited by Luke (18938001) @ 15/04/01
// It's an edit of: https://steamcommunity.com/sharedfiles/filedetails/?id=133054661
local hit_txts = {}
local hit_lastcurtime = 0
local alpha = 255
CreateClientConVar("hmark_sound_id", 1, true, false)   
CreateClientConVar("hmark_mat_id", "1", true, false)   
local curtex = "materials/hud/red_hitmarker1.png"

concommand.Add("hmark_refresh", function() // Because cvars.AddChangeCallback() is a piece of shit. There's no easier way I can see aside from this ;_;.

curtex = "materials/hud/red_hitmarker1.png"
chat.AddText(Color(0,255,0),"Refreshed to " .. curtex)
end	)


local dmg_cols =
{

}

/*surface.CreateFont( "iHDN_Font", {
	font 		= "coolvetica",
	size 		= 50,
	weight 		= 800,
	blursize 	= 0,
	scanlines 	= 0,
	antialias 	= true,
	underline 	= false,
	italic 		= false,
	strikeout 	= false,
	symbol 		= false,
	rotary 		= false,
	shadow 		= false,
	additive 	= false,
	outline 	= true
} )


*/

local on = true
CreateConVar("hmark_enable", 1)
cvars.AddChangeCallback( "hmark_enable", function()
	on = (GetConVarNumber("hmark_enable") ~= 0)
	
	Msg("Damage indicators ")
	if on then
		MsgN("enabled")
	else
		MsgN("disabled")
		table.Empty(hit_txts)
	end
end)
concommand.Add("hmark_listmats",function()
local mats = file.Find( "materials/hitmark/*.vtf", "MOD" )
print("Current Hitmarker Materials: ")
PrintTable(mats)

	end)

function createHitNumber()

	if not on then return end
	local lply = LocalPlayer()
	
	if not lply:IsValid() then return end
	
	local data = {}
	
	local dmg = net.ReadFloat()
	local dmgtype = net.ReadUInt(32)
	

local bHitActive = true
local bHitSound = false
local x
local y
local ulti = 1


	



hook.Add( "HUDPaint", "Chmark", function()

if ( bHitSound ) then

bHitSound = false
ulti = 1
end

  if not ( ulti == 1) then
  	if alpha > 0 then
    alpha = alpha - 5
      	end
else
	alpha = 200
	end
	

	 -- Ask the gamemode if it's ok to do this
  if ( !gamemode.Call( "HUDShouldDraw", "Chmark" ) ) then return end
  
  --make hmark visible fade out

  
  --always draw hmark invisible
  	surface.SetDrawColor( 255, 255, 255, alpha ) 
  	local blur_mat = Material( "materials/hud/red_hitmarker4.png" )
surface.SetMaterial(blur_mat)
surface.DrawTexturedRect(ScrW() / 2.067 ,ScrH() / 2.119 ,64,64) 



	timer.Simple( 0.35, function() ulti = 0 end )


end )

end

local function ForceHit()

bHitSound = false
ulti = 1
end
concommand.Add("Forcehmark",ForceHit)
net.Receive( "imHDN_createHitNumber", createHitNumber)
