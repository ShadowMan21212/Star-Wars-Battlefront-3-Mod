CreateClientConVar("cl_bur_sprintmod_enablehud",1,true,false)
CreateClientConVar("cl_bur_sprintmod_fade",1,true,false)


AddCSLuaFile("televgui.lua")

net.Receive("StaminaSpawn", function(len)

	local ply = LocalPlayer()


	local MaxStamina = net.ReadFloat()
	local RegenMul = net.ReadFloat()
	local DecayMul = net.ReadFloat()
	
	
	ply.BurgerStamina = MaxStamina
	ply.BurgerMaxStamina = MaxStamina
	ply.BurgerDecayMul = DecayMul
	ply.BurgerRegenMul = RegenMul
	

end)

local JumpLatch = 0

function GetClientMove(cmd)

	local ply = LocalPlayer()

	local NewButtons = cmd:GetButtons()
	
	local Change = FrameTime() * 5
	
	if not first then
	
		ply.BurgerStamina = 100
		ply.BurgerMaxStamina = 100
		ply.BurgerDecayMul = 1
		ply.BurgerRegenMul = 1
		
		
		
		ply.NextRegen = 0
		ply.WaterTick = 0
		
		first = true
		
	end


	if cmd:KeyDown(IN_SPEED) and ( cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) ) and (ply:GetVelocity():Length() > 100) and ( ply:OnGround() or ply:WaterLevel() ~= 0 ) and !ply:InVehicle() then
	
		if ply.BurgerStamina <= 0 then
		
			NewButtons = NewButtons - IN_SPEED

		else
			
			
			ply.BurgerStamina = math.Clamp(ply.BurgerStamina - Change*4 * ply.BurgerDecayMul,0,ply.BurgerMaxStamina)--running stamina
			ply.NextRegen = CurTime() + 0.25

		end
		
		
	end
	
	--Jumping code provided by bobbleheadbob
	if cmd:KeyDown(IN_JUMP) and ply:OnGround() and !ply:InVehicle() then
	
		if ply.BurgerStamina <= 5 then
		
			NewButtons = NewButtons - IN_JUMP
			
		else

			if not JumpLatch then

				if cmd:KeyDown(IN_SPEED) and ( cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) ) then
					ply.BurgerStamina = math.Clamp(ply.BurgerStamina - 25*ply.BurgerDecayMul,0,ply.BurgerMaxStamina)
				else
					ply.BurgerStamina = math.Clamp(ply.BurgerStamina - 5*ply.BurgerDecayMul,0,ply.BurgerMaxStamina)
				end

			end
			
			ply.NextRegen = CurTime() + 1.25
			
		end


		JumpLatch = true
		
		
	elseif not cmd:KeyDown(IN_JUMP) then
		JumpLatch = false
	end
	
	
	if ply:WaterLevel() == 3 then

		ply.NextRegen = CurTime() + 1.25
	
		if ply.BurgerStamina ~= 0 then
		
			ply.BurgerStamina = math.Clamp(ply.BurgerStamina - Change*0.25*ply.BurgerDecayMul ,0,ply.BurgerMaxStamina)
			
		else
		
			if ply.WaterTick <= CurTime() then
					
				net.Start("StaminaDrowning")
					net.WriteFloat(1)
				net.SendToServer()
					
				ply.WaterTick = CurTime() + 1
			
			end
			
		end
		
			
	end
	
	
	if ply.NextRegen then
	
		if ply.NextRegen < CurTime() then
			
			
			if (cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT)) then
					ply.BurgerStamina = math.Clamp(ply.BurgerStamina + ( Change * 2.5 * ply.BurgerRegenMul ) ,0,ply.BurgerMaxStamina)---walking regen
				else
					ply.BurgerStamina = math.Clamp(ply.BurgerStamina + ( Change * 3 * ply.BurgerRegenMul ) ,0,ply.BurgerMaxStamina)---idle regen
			end
			
		end
		
	end
	

	cmd:SetButtons(NewButtons)

end


hook.Add("CreateMove","Burger Sprint",GetClientMove)


local Mat = Material("vgui/hsv-brightness")

surface.CreateFont( "SprintFont", {
	font = "roboto condensed", 
	size = 24, 
	weight = 0, 
	blursize = 0, 
	scanlines = 0, 
	antialias = true, 
	underline = false, 
	italic = false, 
	strikeout = false, 
	symbol = false, 
	rotary = false, 
	shadow = true, 
	additive = false, 
	outline = false, 
} )
  surface.CreateFont( "BF3Font", {
  font = "Eurostile", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
  extended = false,
  size = 24,
  weight = 550,
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

local Alpha = 0

function DrawBurStamina()
	local current_ammo =LocalPlayer():GetActiveWeapon():Clip1()
local max_clip_size = LocalPlayer():GetActiveWeapon():GetMaxClip1()
local ammo_ratio = current_ammo/max_clip_size

	local ply = LocalPlayer()
	local kills = ply:Frags()
	local deaths = ply:Deaths()
	local health = ply:Health()
	draw.RoundedBox(0,ScrW()-1306,ScrH()-960,1.1*(deaths),8,(Color(26,127,153,255)))
	draw.RoundedBox(0,ScrW()-833,ScrH()-959,1.1*(kills),8,(Color(155,17,22,255)))
	local cap = Material("materials/hud/yellowammo3.png")
			
local value =ammo_ratio/2
 local v = 179
	local h = 240
	local w = 240
    local width, height = math.Round(v * value), h;
    local u1, v1, u2, v2 = 0, 0, width/w, 1;
    local u, r = 0, 0;
        u2 = 1;
      width = w;
      height = math.Round(v * value) + (h - v);
      v1 = 1 - (height/h);
      r = h - height;

surface.SetMaterial(cap)
surface.SetDrawColor(255,255,255,255)
surface.DrawTexturedRectUV(ScrW()-1695+u,ScrH()-267+r,width,height,u1,v1,u2,v2)

	local ply = LocalPlayer()
	
	if ply.HasOblivionHUD then return end
	
	if GetConVarNumber("cl_bur_sprintmod_enablehud") == 0 then return end

	local Stamina = ply.BurgerStamina
	local MaxStamina = ply.BurgerMaxStamina
	
	if GetConVarNumber("cl_bur_sprintmod_fade") then
	
		if Stamina == MaxStamina then
			Alpha = math.max(0,Alpha - 100*FrameTime())
		else
			Alpha = math.min(100,Alpha + 100*FrameTime())
		end
		
	else
	
		Alpha = 100
	
	end
	
	local BasePercent = Alpha/100

	if MaxStamina then
			
		local BaseFade = 255
		local BarWidth = 25
		local BarHeight = 25
		
		local OPercent = 5/MaxStamina
		local Percent = Stamina/MaxStamina
		local SizeScale = 1
		
		local XPos = ScrW()/2
		local YPos = ScrH() - BarHeight*2
		local XSize = BarWidth*10
		local YSize = BarHeight
		local barchange = XSize*0.9*Percent*1.335
		

			local cap = Material("materials/hud/greensprintbar1.png")
			
local value = barchange/630
 local v = 170
	local h = 240
	local w = 240
    local width, height = math.Round(v * value), h;
    local u1, v1, u2, v2 = 0, 0, width/w, 1;
    local u, r = 0, 0;
        u2 = 1;
      width = w;
      height = math.Round(v * value) + (h - v);
      v1 = 1 - (height/h);
      r = h - height;

surface.SetMaterial(cap)
surface.SetDrawColor(255,255,255,255)
surface.DrawTexturedRectUV(ScrW()-1712+u,ScrH()-267+r,width,height,u1,v1,u2,v2)
	local bmat = Material("materials/hud/new5hud.png")
	surface.SetDrawColor(255,255,255)
	surface.SetMaterial( bmat )

	surface.DrawTexturedRect( 0, 0, 1920, 1080 )

		local lmat = Material("materials/hud/bf3_bar_conquest3.png")
	surface.SetMaterial( lmat )

	surface.DrawTexturedRect( 0, 0, 1920, 1080 )
local entities_max = ents.GetAll()
	local nilmat = Material("materials/hud/nilcheck2.png")
	local blumat = Material("materials/hud/repcheck4.png")
	local redmat = Material("materials/hud/cischeck3.png")
	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		local cmd1ownersv = v:GetNetworkedString("cmd1owner", "fail")
		local cmd2ownersv = v:GetNetworkedString("cmd2owner", "fail")
		local cmd3ownersv = v:GetNetworkedString("cmd3owner", "fail")
		local cmd4ownersv = v:GetNetworkedString("cmd4owner", "fail")
		local cmd5ownersv = v:GetNetworkedString("cmd5owner", "fail")
		local cmd6ownersv = v:GetNetworkedString("cmd6owner", "fail")
		local cmd7ownersv = v:GetNetworkedString("cmd7owner", "fail")
		local cmd8ownersv = v:GetNetworkedString("cmd8owner", "fail")
		local cmd9ownersv = v:GetNetworkedString("cmd9owner", "fail")
		local cmd10ownersv = v:GetNetworkedString("cmd10owner", "fail")
		local cmd11ownersv = v:GetNetworkedString("cmd11owner", "fail")
		local cmd12ownersv = v:GetNetworkedString("cmd12owner", "fail")


		if cmd1ownersv == "nil" then
			
			surface.SetMaterial( nilmat )
			surface.DrawTexturedRect( 785, 50, 30, 30 )
end
if cmd1ownersv == "blu" then
	
			surface.SetMaterial( blumat )
			surface.DrawTexturedRect( 785, 50, 30, 30 )

end
if cmd1ownersv == "red" then
		
			surface.SetMaterial( redmat )
			surface.DrawTexturedRect( 785, 50, 30, 30 )
end
------------------------------------------------------------
if cmd2ownersv == "nil" then
		
			surface.SetMaterial( nilmat )
			surface.DrawTexturedRect( 815, 50, 30, 30 )
end
if cmd2ownersv == "blu" then
	
			surface.SetMaterial( blumat )
			surface.DrawTexturedRect( 815, 50, 30, 30 )

end
if cmd2ownersv == "red" then
	
			surface.SetMaterial( redmat )
			surface.DrawTexturedRect( 815, 50, 30, 30 )
end
------------------------------------------------------------
if cmd3ownersv == "nil" then
	
			surface.SetMaterial( nilmat )
			surface.DrawTexturedRect( 845, 50, 30, 30 )
end
if cmd3ownersv == "blu" then
		
			surface.SetMaterial( blumat )
			surface.DrawTexturedRect( 845, 50, 30, 30 )

end
if cmd3ownersv == "red" then
		
			surface.SetMaterial( redmat )
			surface.DrawTexturedRect( 845, 50, 30, 30 )
end
------------------------------------------------------------
if cmd4ownersv == "nil" then
			
			surface.SetMaterial( nilmat )
			surface.DrawTexturedRect( 875, 50, 30, 30 )
end
if cmd4ownersv == "blu" then
		
			surface.SetMaterial( blumat )
			surface.DrawTexturedRect( 875, 50, 30, 30 )

end
if cmd4ownersv == "red" then
		
			surface.SetMaterial( redmat )
			surface.DrawTexturedRect( 875, 50, 30, 30 )
end
------------------------------------------------------------
if cmd5ownersv == "nil" then
	
			surface.SetMaterial( nilmat )
			surface.DrawTexturedRect( 905, 50, 30, 30 )
end
if cmd5ownersv == "blu" then
		
			surface.SetMaterial( blumat )
			surface.DrawTexturedRect( 905, 50, 30, 30 )

end
if cmd5ownersv == "red" then
	
			surface.SetMaterial( redmat )
			surface.DrawTexturedRect( 905, 50, 30, 30 )
end
------------------------------------------------------------
if cmd6ownersv == "nil" then
		
			surface.SetMaterial( nilmat )
			surface.DrawTexturedRect( 935, 50, 30, 30 )
end
if cmd6ownersv == "blu" then
	
			surface.SetMaterial( blumat )
			surface.DrawTexturedRect( 935, 50, 30, 30 )

end
if cmd6ownersv == "red" then
			
			surface.SetMaterial( redmat )
			surface.DrawTexturedRect( 935, 50, 30, 30 )
end
------------------------------------------------------------
if cmd7ownersv == "nil" then
			
			surface.SetMaterial( nilmat )
			surface.DrawTexturedRect( 965, 50, 30, 30 )
end
if cmd7ownersv == "blu" then
		
			surface.SetMaterial( blumat )
			surface.DrawTexturedRect( 965, 50, 30, 30 )

end
if cmd7ownersv == "red" then
		
			surface.SetMaterial( redmat )
			surface.DrawTexturedRect( 965, 50, 30, 30 )
end
------------------------------------------------------------
if cmd8ownersv == "nil" then
		
			surface.SetMaterial( nilmat )
			surface.DrawTexturedRect( 995, 50, 30, 30 )
end
if cmd8ownersv == "blu" then
			
			surface.SetMaterial( blumat )
			surface.DrawTexturedRect( 995, 50, 30, 30 )

end
if cmd8ownersv == "red" then
		
			surface.SetMaterial( redmat )
			surface.DrawTexturedRect( 995, 50, 30, 30 )
end
------------------------------------------------------------
if cmd9ownersv == "nil" then
		
			surface.SetMaterial( nilmat )
			surface.DrawTexturedRect( 1025, 50, 30, 30 )
end
if cmd9ownersv == "blu" then
		
			surface.SetMaterial( blumat )
			surface.DrawTexturedRect( 1025, 50, 30, 30 )

end
if cmd9ownersv == "red" then
		
			surface.SetMaterial( redmat )
			surface.DrawTexturedRect( 1025, 50, 30, 30 )
end
------------------------------------------------------------
if cmd10ownersv == "nil" then
		
			surface.SetMaterial( nilmat )
			surface.DrawTexturedRect( 1055, 50, 30, 30 )
end
if cmd10ownersv == "blu" then
		
			surface.SetMaterial( blumat )
			surface.DrawTexturedRect( 1055, 50, 30, 30 )

end
if cmd10ownersv == "red" then
		
			surface.SetMaterial( redmat )
			surface.DrawTexturedRect( 1055, 50, 30, 30 )
end
------------------------------------------------------------
if cmd11ownersv == "nil" then
		
			surface.SetMaterial( nilmat )
			surface.DrawTexturedRect( 1085, 50, 30, 30 )
end
if cmd11ownersv == "blu" then
		
			surface.SetMaterial( blumat )
			surface.DrawTexturedRect( 1085, 50, 30, 30 )

end
if cmd11ownersv == "red" then
		
			surface.SetMaterial( redmat )
			surface.DrawTexturedRect( 1085, 50, 30, 30 )
end
------------------------------------------------------------
if cmd12ownersv == "nil" then
		
			surface.SetMaterial( nilmat )
			surface.DrawTexturedRect( 1115, 50, 30, 30 )
end
if cmd12ownersv == "blu" then
		
			surface.SetMaterial( blumat )
			surface.DrawTexturedRect( 1115, 50, 30, 30 )

end
if cmd12ownersv == "red" then
		
			surface.SetMaterial( redmat )
			surface.DrawTexturedRect( 1115, 50, 30, 30 )
end
end
end
	local ply = LocalPlayer()
	local kills = ply:Frags()
	local deaths = ply:Deaths()
	local health = ply:Health()
	draw.RoundedBox(0,ScrW()-1306,ScrH()-960,1.4*(deaths),8,(Color(26,127,153,255)))
	draw.RoundedBox(0,ScrW()-833,ScrH()-959,1.4*(kills),8,(Color(155,17,22,255)))
	draw.DrawText(tostring(deaths),"BF3FontL",625+1.4*(deaths),100,Color(255,255,255,255))
	draw.DrawText(tostring(kills),"BF3FontL",1093+1.4*(kills),100,Color(255,255,255,255))
		
		--draw.RoundedBox(0,ScrW()-1890,ScrH()-82,XSize*0.9*Percent*1.335,8,(Color(255,170,51,200)))--stamina bar
		--if barchange <70 then
		--	draw.RoundedBox(0,ScrW()-1890,ScrH()-82,XSize*0.9*Percent*1.335,8,(Color(255,0,0,200)))
		--if barchange <30 then
		--	draw.RoundedBox(0,ScrW()-1890,ScrH()-82,XSize*0.9*Percent*1.335,8,(Color(55,55,78,200)))
		--end
		--end
			
	end
	
			local ply = LocalPlayer()
		local kills = ply:Frags()
		local deaths = ply:Deaths()
		local health = ply:Health()
	draw.RoundedBox(0,ScrW()-1306,ScrH()-960,1.1*(deaths),8,(Color(26,127,153,255)))
	draw.RoundedBox(0,ScrW()-833,ScrH()-959,1.1*(kills),8,(Color(155,17,22,255)))
		local yellowhealthstand = Material("materials/hud/yellowhealthstand.png")
		local newhealthstand = Material("materials/hud/newbluehealthstand.png")
		

	local hvalue = health/170
 	local v = 210
	local h = 300
	local w = 300
    local width, height = math.Round(v * hvalue), h;
    local u1, v1, u2, v2 = 0, 0, width/w, 1;
    local u, r = 0, 0;
      u2 = 1;
      width = w;
      height = math.Round(v * hvalue) + (h - v);
      v1 = 1 - (height/h);
      r = h - height;

surface.SetMaterial(yellowhealthstand)
surface.SetDrawColor(255,255,255,255)
surface.DrawTexturedRectUV(ScrW()-1825+u,ScrH()-254,300,214,0,0.28666666666667,1,1)
surface.SetMaterial(newhealthstand)
surface.SetDrawColor(255,255,255,255)
surface.DrawTexturedRectUV(ScrW()-1825+u,ScrH()-340+r,width,height,u1,v1,u2,v2)
if LocalPlayer():GetModel() != "models/models/ferroda/ferroda_2.mdl" then
local crosshair_type = Material("materials/hud/bf3testcrosshair4.png")
surface.SetMaterial(crosshair_type)
surface.SetDrawColor(255,255,255,255)


surface.DrawTexturedRect(ScrW()/2-165/2,ScrH()/2-165/2,165,165)
end

end

hook.Add("HUDPaint","Draw Burger Stamina",DrawBurStamina)

hook.Add("ScalePlayerDamage","ferrodahealth",function( ply, hitgroup, dmginfo) 
	if LocalPlayer():GetModel() == "models/models/ferroda/ferroda_2.mdl" then
		dmginfo:ScaleDamage( .01 ) // More damage when we're shot in the head
 	
	end
end)






local flag = false
local victory = false
local defeat = false

function refresh()
for k, v in pairs( player.GetAll() ) do
	if  v:Alive()== false  and flag == false then
		hook.Remove("HUDPaint", "Draw Burger Stamina")
		hook.Remove("HUDPaint", "NeawCapHud")
		print(v:Alive())
include("bf3_main_files/televgui.lua")
print("hello world")
flag = true
end
if  v:Alive()== true then
	hook.Add("HUDPaint","Draw Burger Stamina",DrawBurStamina)

		flag = false
	end

end
end
hook.Add("Tick","hopefulrefresh",refresh)

hook.Add("Tick","TickBlah",function()

for k, v in pairs( player.GetAll() ) do
if v:Frags() > 99 then
	defeat = true
	v:Freeze( true )
		print("DEFEAT")
	RunConsoleCommand("ai_disabled","1")

end
if v:Deaths() > 99 then
	victory = true
	v:Freeze( true )
	print("VICTORY")
	RunConsoleCommand("ai_disabled","1")

end
end
end)

hook.Add("HUDPaint","Draw endgame Stamina",function()
	if victory == true then
		local test = Material("materials/hud/victory2.png")
		surface.SetMaterial(test)
		surface.SetDrawColor(255,255,255,255)
		surface.DrawTexturedRect( ScrW()/2-200,ScrH()/2-200,400,400)

				hook.Remove("HUDPaint", "Draw Burger Stamina")
		hook.Remove("HUDPaint", "NeawCapHud")
		hook.Remove("HuDPaint","BellOfTheBell")
	end
		if defeat == true then
		local best = Material("materials/hud/defeat1.png")
		surface.SetMaterial(best)
		surface.SetDrawColor(255,255,255,255)
		surface.DrawTexturedRect( ScrW()/2-200,ScrH()/2-200,400,400)

				hook.Remove("HUDPaint", "Draw Burger Stamina")
		hook.Remove("HUDPaint", "NeawCapHud")
		hook.Remove("HuDPaint","BellOfTheBell")
	end
end
		)
