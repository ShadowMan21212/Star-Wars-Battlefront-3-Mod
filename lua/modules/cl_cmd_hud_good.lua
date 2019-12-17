function doStuff()
	local entities_max = ents.GetAll()
		for k,v in pairs(entities_max) do
			if v:IsPlayer() then
			local ob = v
				for k, v in pairs(ents.FindInSphere( ob:GetPos(), 200 )) do
					if v:GetClass() == "rvb_control_point" then
 					local myVec = v:GetNetworkedInt("bluprogress",0)

				end
			end
		end
	end
end
doStuff()


hook.Add("HUDPaint","NewCapHud",function()





local entities_max = ents.GetAll()
	for k,v in pairs(entities_max) do
	local pblu = v:GetNetworkedBool("pblu",nil)
		if v:IsPlayer() and pblu == true then
		local ob = v
			for k, v in pairs(ents.FindInSphere( ob:GetPos(), 200 )) do
				if v:GetClass() == "rvb_control_point" then
				local myVec = v:GetNetworkedInt("bluprogress",0)
 				local point_controller = v:GetNetworkedString("point_owner","yo")
 					if myVec >= 0 and point_controller == "nil"  then
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
--blank capture sign
surface.SetDrawColor(255,255,255,255)
surface.DrawTexturedRectUV(ScrW()-202+u,ScrH()-475-50,64,108,0,0.16923076923077,1,1)
--blue capture sign
surface.SetDrawColor(0,101,255,255)
surface.DrawTexturedRectUV(ScrW()-202+u,ScrH()-497+r-50,width,height,u1,v1,u2,v2)

elseif  myVec>= 0 and point_controller == "red"  then
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
--blank capture sign
surface.SetDrawColor(255,255,255,255)
surface.DrawTexturedRectUV(ScrW()-202+u,ScrH()-475-50,64,108,0,0.16923076923077,1,1)
--red capture sign
surface.SetDrawColor(255,9,9,255)
surface.DrawTexturedRectUV(ScrW()-202+u,ScrH()-497+r-50,width,height,u1,v1,u2,v2)
				end
			end
		end
	end
end
------------------------------------------------------------------------------





end)
