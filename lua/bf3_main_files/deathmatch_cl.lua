#deathmatch_cl

hook.Add("HUDPaint","NeawCapHud",function()
	local current_ammo =LocalPlayer():GetActiveWeapon():Clip1()
local max_clip_size = LocalPlayer():GetActiveWeapon():GetMaxClip1()
local ammo_ratio = current_ammo/max_clip_size

	local ply = LocalPlayer()
	local kills = ply:Frags()
	local deaths = ply:Deaths()
	local health = ply:Health()
	draw.RoundedBox(0,ScrW()-1306,ScrH()-960,1.1*(deaths),8,(Color(26,127,153,255)))
	draw.RoundedBox(0,ScrW()-833,ScrH()-959,1.1*(kills),8,(Color(155,17,22,255)))
	local cap = Material("C:/Users/The Asian Gamer/Desktop/New folder (9)/yellowammo3.png")
			
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
end)

hook.Add( "HUDShouldDraw", "hide hud", function( name )
if ( name == "CHudHealth" or name == "CHudBattery" or name =="CHudAmmo") then
	return false
	end
end)

local size=165




function doStuff()
	local entities_max = ents.GetAll()
for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		local ob = v
		for k, v in pairs(ents.FindInSphere( ob:GetPos(), 200 )) do
		if v:GetClass() == "rvb_control_point" then
 local myVec = v:GetNetworkedInt("vector",0)
 print( "The vector is: " .. tostring(  v:GetNetworkedInt("vector",0) ) .. "." )
				end
			end
		end
	end
end
doStuff()


hook.Add("HUDPaint","NewCapHud",function()





	local entities_max = ents.GetAll()
	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		local ob = v
		for k, v in pairs(ents.FindInSphere( ob:GetPos(), 200 )) do
		if v:GetClass() == "rvb_control_point" then
 local myVec = v:GetNetworkedInt("vector",0)
 local point_controller = v:GetNetworkedString("point_owner","yo")
  if myVec >= 0 and point_controller == "nil" then
local cap = Material("materials/hud/blankcapture22.png")
local value = myVec/124
 local v = 114
	local h = 130
	local w = 64
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
surface.DrawTexturedRectUV(ScrW()-202+u,ScrH()-475-50,64,108,0,0.16923076923077,1,1)
surface.SetDrawColor(0,101,255,255)


surface.DrawTexturedRectUV(ScrW()-202+u,ScrH()-497+r-50,width,height,u1,v1,u2,v2)

elseif  myVec>= 0 and point_controller == "red" then
	local cap = Material("materials/hud/blankcapture22.png")
local value = 1-myVec/110-.14--up decreases
 local v = 114
	local h = 130
	local w = 64
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
surface.DrawTexturedRectUV(ScrW()-202+u,ScrH()-475-50,64,108,0,0.16923076923077,1,1)
surface.SetDrawColor(255,9,9,255)


surface.DrawTexturedRectUV(ScrW()-202+u,ScrH()-497+r-50,width,height,u1,v1,u2,v2)
end
end
	end
end
end
end)
--U2hhZG93TWFu
