AddCSLuaFile("televgui.lua")
local tele1 = "nil"
local tele2 = "nil"
local tele3 = "nil"
local tele4 = "nil"
local tele5 = "nil"
local tele6 = "nil"
local tele7 = "nil"
local tele8 = "nil"
local tele9 = "nil"
local tele10 = "nil"
local tele11 = "nil"
local tele12 = "nil"
function teleportcmd1()
	print("Joy")
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
		tele1 = "true"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "red" then
		tele1 = "false"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:IsPlayer()  then
		v:Spawn()
		local cmd1position = v:GetNWVector("cmd1pos", Vector( 0, 0, 0 ))
		v:SetPos(cmd1position)
		
		
	end
end
end

function teleportcmd2()
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
		tele2 = "true"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner != "blu" then
		tele2 = "false"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:Spawn()
		local cmd2position = v:GetNWVector("cmd2pos", Vector( 0, 0, 0 ))
		v:SetPos(cmd2position)
		
	end
end
end

function teleportcmd3()
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
		tele3 = "true"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner != "blu" then
		tele3 = "false"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:Spawn()
		local cmd3position = v:GetNWVector("cmd3pos", Vector( 0, 0, 0 ))
		v:SetPos(cmd3position)
		
	end
end
end

function teleportcmd4()
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
		tele4 = "true"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner != "blu" then
		tele4 = "false"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		local cmd4position = v:GetNWVector("cmd4pos", Vector( 0, 0, 0 ))
		v:SetPos(cmd4position)
		
	end
end
end

function teleportcmd5()
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
		tele5 = "true"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner != "blu" then
		tele5 = "false"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:Spawn()
		local cmd5position = v:GetNWVector("cmd5pos", Vector( 0, 0, 0 ))
		v:SetPos(cmd5position)
		
	end
end
end

function teleportcmd6()
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
		tele6 = "true"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "red" then
		tele6 = "false"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:Spawn()
		local cmd6position = v:GetNWVector("cmd6pos", Vector( 0, 0, 0 ))
		v:SetPos(cmd6position)
		
	end
end
end
function teleportcmd7()
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
		tele7 = "true"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "red" then
		tele7 = "false"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:Spawn()
		local cmd7position = v:GetNWVector("cmd7pos", Vector( 0, 0, 0 ))
		v:SetPos(cmd7position)
		
	end
end
end
function teleportcmd8()
	print("err")
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
		tele8 = "true"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "red" then
		tele8 = "false"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:Spawn()
		local cmd8position = v:GetNWVector("cmd8pos", Vector( 0, 0, 0 ))
		v:SetPos(cmd8position)
		
	end
end
end
function teleportcmd9()
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
		tele9 = "true"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "red" then
		tele9 = "false"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:Spawn()
		local cmd9position = v:GetNWVector("cmd9pos", Vector( 0, 0, 0 ))
		v:SetPos(cmd9position)
		
	end
end
end
function teleportcmd10()
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
		tele10 = "true"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "red" then
		tele10 = "false"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:Spawn()
		local cmd10position = v:GetNWVector("cmd10pos", Vector( 0, 0, 0 ))
		v:SetPos(cmd10position)
		
	end
end
end
function teleportcmd11()
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
		tele11 = "true"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "red" then
		tele11 = "false"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:Spawn()
		local cmd11position = v:GetNWVector("cmd11pos", Vector( 0, 0, 0 ))
		v:SetPos(cmd11position)
		
	end
end
end
function teleportcmd12()
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
		tele12 = "true"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:GetClass() == "rvb_control_point" and v.Owner == "red" then
		tele12 = "false"
		
	end
end

	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		v:Spawn()
		local cmd12position = v:GetNWVector("cmd12pos", Vector( 0, 0, 0 ))
		v:SetPos(cmd12position)
		
	end
end
end
function teleportrepbase1()
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:IsPlayer() and v.Blu == true then
		v:Spawn()
		local repbase1position = v:GetNWVector("repbase1pos", Vector( 0, 0, 0 ))
		v:SetPos(repbase1position)
		
	end
end
end
function teleportrepbase2()
local entities_max = ents.GetAll()

	for k,v in pairs(entities_max) do
	if v:IsPlayer() and v.Blu == true then
		v:Spawn()
		local repbase2position = v:GetNWVector("repbase2pos", Vector( 0, 0, 0 ))
		v:SetPos(repbase2position)
		
	end
end
end

function reploadout1load( ply )
 ply:StripWeapons()

    ply:SetModel( "models/player/sono/starwars/501st_trooper.mdl" ) ---models/reizer_cgi_p2/501_trp/501_trp.mdl
    ply:Give( "tfa_752_dc15s_expanded" )
    ply.Blu = true
	include("bf3_main_files/zoomin.lua")
end

function reploadout2load( ply )
 ply:StripWeapons()

    ply:SetModel( "models/player/sgg/starwars/clonetrooper_marine.mdl" )  ---models/reizer_cgi_p2/guard_maj/guard_maj.mdl
    ply:Give( "chaingun_servius" )
    ply.Blu = true
	include("bf3_main_files/zoomin.lua")
end

function reploadout3load( ply )
 ply:StripWeapons()

    ply:SetModel( "models/player/212thairborr/212thairborr.mdl" )
    ply:Give( "weapon_752_dc17m_sn" )
    ply.Blu = true
	include("bf3_main_files/zoomin.lua")
end

function ferrodaloadout(ply) 
 ply:StripWeapons()


local wep = ply:Give( "weapon_lightsaber_form_2_1" )
if ( !IsValid( wep ) ) then return end -- The player already has the weapon

wep.WeaponSynched = true -- Prevent the weapon from loading settings from the Sandbox tool

wep:SetMaxLength( 42 ) -- Blade length
wep:SetCrystalColor( Vector( 33, 255, 0 ) ) -- Blade color - must be a Vector, not a Color
wep:SetDarkInner( false ) -- Whether the blade inner part is dark or not
wep:SetWorldModel( "models/sgg/starwars/weapons/w_common_jedi_saber_hilt.mdl" ) -- The full model path
wep:SetBladeWidth( 2 ) -- Blade width

wep.LoopSound = "lightsaber/saber_loop1.wav" -- Hum sound, full paths
wep.SwingSound = "lightsaber/saber_swing1.wav" -- Swing sound
wep:SetOnSound( "lightsaber/saber_on1.wav" ) -- On sound
wep:SetOffSound( "lightsaber/saber_off1.wav" ) -- Off sound

local wep2 = ply:Give( "weapon_lightsaber_form_2_2" )
if ( !IsValid( wep2 ) ) then return end -- The player already has the weapon

wep2.WeaponSynched = true -- Prevent the weapon from loading settings from the Sandbox tool

wep2:SetMaxLength( 42 ) -- Blade length
wep2:SetCrystalColor( Vector( 33, 255, 0 ) ) -- Blade color - must be a Vector, not a Color
wep2:SetDarkInner( false ) -- Whether the blade inner part is dark or not
wep2:SetWorldModel( "models/sgg/starwars/weapons/w_common_jedi_saber_hilt.mdl" ) -- The full model path
wep2:SetBladeWidth( 2 ) -- Blade width

wep2.LoopSound = "lightsaber/saber_loop1.wav" -- Hum sound, full paths
wep2.SwingSound = "lightsaber/saber_swing1.wav" -- Swing sound
wep2:SetOnSound( "lightsaber/saber_on1.wav" ) -- On sound
wep2:SetOffSound( "lightsaber/saber_off1.wav" ) -- Off sound

local wep3 = ply:Give( "weapon_lightsaber_form_2_3" )
if ( !IsValid( wep3 ) ) then return end -- The player already has the weapon

wep3.WeaponSynched = true -- Prevent the weapon from loading settings from the Sandbox tool

wep3:SetMaxLength( 42 ) -- Blade length
wep3:SetCrystalColor( Vector( 33, 255, 0 ) ) -- Blade color - must be a Vector, not a Color
wep3:SetDarkInner( false ) -- Whether the blade inner part is dark or not
wep3:SetWorldModel( "models/sgg/starwars/weapons/w_common_jedi_saber_hilt.mdl" ) -- The full model path
wep3:SetBladeWidth( 2 ) -- Blade width

wep3.LoopSound = "lightsaber/saber_loop1.wav" -- Hum sound, full paths
wep3.SwingSound = "lightsaber/saber_swing1.wav" -- Swing sound
wep3:SetOnSound( "lightsaber/saber_on1.wav" ) -- On sound
wep3:SetOffSound( "lightsaber/saber_off1.wav" ) -- Off sound

    ply:SetModel( "models/ferroda/ferroda_2.mdl" )
    ply.Blu = true
include( "bf3_main_files/lightsabertest3.lua" )
end

function winduloadout(ply) 
 ply:StripWeapons()


local wep = ply:Give( "weapon_lightsaber_form_2_1" )
if ( !IsValid( wep ) ) then return end -- The player already has the weapon

wep.WeaponSynched = true -- Prevent the weapon from loading settings from the Sandbox tool

wep:SetMaxLength( 42 ) -- Blade length
wep:SetCrystalColor( Vector( 153, 51, 255 ) ) -- Blade color - must be a Vector, not a Color
wep:SetDarkInner( false ) -- Whether the blade inner part is dark or not
wep:SetWorldModel( "models/sgg/starwars/weapons/w_common_jedi_saber_hilt.mdl" ) -- The full model path
wep:SetBladeWidth( 2 ) -- Blade width

wep.LoopSound = "lightsaber/saber_loop1.wav" -- Hum sound, full paths
wep.SwingSound = "lightsaber/saber_swing1.wav" -- Swing sound
wep:SetOnSound( "lightsaber/saber_on1.wav" ) -- On sound
wep:SetOffSound( "lightsaber/saber_off1.wav" ) -- Off sound

local wep2 = ply:Give( "weapon_lightsaber_form_2_2" )
if ( !IsValid( wep2 ) ) then return end -- The player already has the weapon

wep2.WeaponSynched = true -- Prevent the weapon from loading settings from the Sandbox tool

wep2:SetMaxLength( 42 ) -- Blade length
wep2:SetCrystalColor( Vector( 153, 51, 255 ) ) -- Blade color - must be a Vector, not a Color
wep2:SetDarkInner( false ) -- Whether the blade inner part is dark or not
wep2:SetWorldModel( "models/sgg/starwars/weapons/w_common_jedi_saber_hilt.mdl" ) -- The full model path
wep2:SetBladeWidth( 2 ) -- Blade width

wep2.LoopSound = "lightsaber/saber_loop1.wav" -- Hum sound, full paths
wep2.SwingSound = "lightsaber/saber_swing1.wav" -- Swing sound
wep2:SetOnSound( "lightsaber/saber_on1.wav" ) -- On sound
wep2:SetOffSound( "lightsaber/saber_off1.wav" ) -- Off sound

local wep3 = ply:Give( "weapon_lightsaber_form_2_3" )
if ( !IsValid( wep3 ) ) then return end -- The player already has the weapon

wep3.WeaponSynched = true -- Prevent the weapon from loading settings from the Sandbox tool

wep3:SetMaxLength( 42 ) -- Blade length
wep3:SetCrystalColor( Vector( 153, 51, 255 ) ) -- Blade color - must be a Vector, not a Color
wep3:SetDarkInner( false ) -- Whether the blade inner part is dark or not
wep3:SetWorldModel( "models/sgg/starwars/weapons/w_common_jedi_saber_hilt.mdl" ) -- The full model path
wep3:SetBladeWidth( 2 ) -- Blade width

wep3.LoopSound = "lightsaber/saber_loop1.wav" -- Hum sound, full paths
wep3.SwingSound = "lightsaber/saber_swing1.wav" -- Swing sound
wep3:SetOnSound( "lightsaber/saber_on1.wav" ) -- On sound
wep3:SetOffSound( "lightsaber/saber_off1.wav" ) -- Off sound

    ply:SetModel( "models/ryan7259/mace_windu/mace_windu_player.mdl" )
    ply.Blu = true
include( "bf3_main_files/lightsabertest3.lua" )
end

function lukeloadout(ply) 
 ply:StripWeapons()


local wep = ply:Give( "weapon_lightsaber_form_2_1" )
if ( !IsValid( wep ) ) then return end -- The player already has the weapon

wep.WeaponSynched = true -- Prevent the weapon from loading settings from the Sandbox tool

wep:SetMaxLength( 42 ) -- Blade length
wep:SetCrystalColor( Vector( 0, 63, 255 ) ) -- Blade color - must be a Vector, not a Color
wep:SetDarkInner( false ) -- Whether the blade inner part is dark or not
wep:SetWorldModel( "models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl" ) -- The full model path
wep:SetBladeWidth( 2 ) -- Blade width

wep.LoopSound = "lightsaber/saber_loop1.wav" -- Hum sound, full paths
wep.SwingSound = "lightsaber/saber_swing1.wav" -- Swing sound
wep:SetOnSound( "lightsaber/saber_on1.wav" ) -- On sound
wep:SetOffSound( "lightsaber/saber_off1.wav" ) -- Off sound

local wep2 = ply:Give( "weapon_lightsaber_form_2_2" )
if ( !IsValid( wep2 ) ) then return end -- The player already has the weapon

wep2.WeaponSynched = true -- Prevent the weapon from loading settings from the Sandbox tool

wep2:SetMaxLength( 42 ) -- Blade length
wep2:SetCrystalColor( Vector( 0, 63, 255 ) ) -- Blade color - must be a Vector, not a Color
wep2:SetDarkInner( false ) -- Whether the blade inner part is dark or not
wep2:SetWorldModel( "models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl" ) -- The full model path
wep2:SetBladeWidth( 2 ) -- Blade width

wep2.LoopSound = "lightsaber/saber_loop1.wav" -- Hum sound, full paths
wep2.SwingSound = "lightsaber/saber_swing1.wav" -- Swing sound
wep2:SetOnSound( "lightsaber/saber_on1.wav" ) -- On sound
wep2:SetOffSound( "lightsaber/saber_off1.wav" ) -- Off sound

local wep3 = ply:Give( "weapon_lightsaber_form_2_3" )
if ( !IsValid( wep3 ) ) then return end -- The player already has the weapon

wep3.WeaponSynched = true -- Prevent the weapon from loading settings from the Sandbox tool

wep3:SetMaxLength( 42 ) -- Blade length
wep3:SetCrystalColor( Vector( 0, 63, 255 ) ) -- Blade color - must be a Vector, not a Color
wep3:SetDarkInner( false ) -- Whether the blade inner part is dark or not
wep3:SetWorldModel( "models/sgg/starwars/weapons/w_anakin_ep3_saber_hilt.mdl" ) -- The full model path
wep3:SetBladeWidth( 2 ) -- Blade width

wep3.LoopSound = "lightsaber/saber_loop1.wav" -- Hum sound, full paths
wep3.SwingSound = "lightsaber/saber_swing1.wav" -- Swing sound
wep3:SetOnSound( "lightsaber/saber_on1.wav" ) -- On sound
wep3:SetOffSound( "lightsaber/saber_off1.wav" ) -- Off sound

    ply:SetModel( "models/player/valley/luke.mdl" )
    ply.Blu = true
include( "bf3_main_files/lightsabertest3.lua" )
end



function inquistorloadout(ply) 
 ply:StripWeapons()


local wep = ply:Give( "weapon_lightsaber_form_2_1" )
if ( !IsValid( wep ) ) then return end -- The player already has the weapon

wep.WeaponSynched = true -- Prevent the weapon from loading settings from the Sandbox tool

wep:SetMaxLength( 42 ) -- Blade length
wep:SetCrystalColor( Vector( 255, 0, 0 ) ) -- Blade color - must be a Vector, not a Color
wep:SetDarkInner( false ) -- Whether the blade inner part is dark or not
wep:SetWorldModel( "models/star/venator/inqusitor_saber.mdl" ) -- The full model path
wep:SetBladeWidth( 2 ) -- Blade width

wep.LoopSound = "lightsaber/saber_loop1.wav" -- Hum sound, full paths
wep.SwingSound = "lightsaber/saber_swing1.wav" -- Swing sound
wep:SetOnSound( "lightsaber/saber_on1.wav" ) -- On sound
wep:SetOffSound( "lightsaber/saber_off1.wav" ) -- Off sound

local wep2 = ply:Give( "weapon_lightsaber_form_2_2" )
if ( !IsValid( wep2 ) ) then return end -- The player already has the weapon

wep2.WeaponSynched = true -- Prevent the weapon from loading settings from the Sandbox tool

wep2:SetMaxLength( 42 ) -- Blade length
wep2:SetCrystalColor( Vector( 255, 0, 0 ) ) -- Blade color - must be a Vector, not a Color
wep2:SetDarkInner( false ) -- Whether the blade inner part is dark or not
wep2:SetWorldModel( "models/star/venator/inqusitor_saber.mdl" ) -- The full model path
wep2:SetBladeWidth( 2 ) -- Blade width

wep2.LoopSound = "lightsaber/saber_loop1.wav" -- Hum sound, full paths
wep2.SwingSound = "lightsaber/saber_swing1.wav" -- Swing sound
wep2:SetOnSound( "lightsaber/saber_on1.wav" ) -- On sound
wep2:SetOffSound( "lightsaber/saber_off1.wav" ) -- Off sound

local wep3 = ply:Give( "weapon_lightsaber_form_2_3" )
if ( !IsValid( wep3 ) ) then return end -- The player already has the weapon

wep3.WeaponSynched = true -- Prevent the weapon from loading settings from the Sandbox tool

wep3:SetMaxLength( 42 ) -- Blade length
wep3:SetCrystalColor( Vector( 255, 0, 0 ) ) -- Blade color - must be a Vector, not a Color
wep3:SetDarkInner( false ) -- Whether the blade inner part is dark or not
wep3:SetWorldModel( "models/star/venator/inqusitor_saber.mdl" ) -- The full model path
wep3:SetBladeWidth( 2 ) -- Blade width

wep3.LoopSound = "lightsaber/saber_loop1.wav" -- Hum sound, full paths
wep3.SwingSound = "lightsaber/saber_swing1.wav" -- Swing sound
wep3:SetOnSound( "lightsaber/saber_on1.wav" ) -- On sound
wep3:SetOffSound( "lightsaber/saber_off1.wav" ) -- Off sound

    ply:SetModel( "models/ethli/characters/inquisitorrebel/inquisitorrebel.mdl" )
    ply.Blu = true
include( "bf3_main_files/lightsabertest3.lua" )
end




function x2loadout(ply) 
 ply:StripWeapons()

    ply:SetModel( "models/x2cw/x2cw.mdl" )
     ply:Give( "tfa_dc15a_expanded" )
    ply.Blu = true
	include("bf3_main_files/zoomin.lua")
end
function x1loadout(ply) 
 ply:StripWeapons()

    ply:SetModel( "models/x1cw/x1cw.mdl" )
     ply:Give( "tfa_dl44" )
    ply.Blu = true
	include("bf3_main_files/zoomin.lua")
end
function commandoloadout(ply) 
 ply:StripWeapons()

    ply:SetModel( "models/player/sgg/starwars/clone_commando_07.mdl" )
     ply:Give( "weapon_752_dc17m_br" )
    ply.Blu = true
	include("bf3_main_files/zoomin.lua")
end

function rebelloadout(ply)
	 ply:StripWeapons()

    ply:SetModel( "models/player/sgg/starwars/rebels/r_soldier_forest/male_02.mdl" )
     ply:Give( "tfa_a280_extended" )
    ply.Blu = true
	include("bf3_main_files/zoomin.lua")
end

function stormtroooperloadout(ply)
	 ply:StripWeapons()

    ply:SetModel( "models/player/ven/tk_basic_02/tk_basic.mdl" )
     ply:Give( "weapon_752_e11" )
    ply.Blu = true
	include("bf3_main_files/zoomin.lua")
end


concommand.Add("inquistorloadout", inquistorloadout)
concommand.Add("rebelloadout", rebelloadout)
concommand.Add("stormtroooperloadout", stormtroooperloadout)
concommand.Add("reploudout1",reploadout1load)
concommand.Add("reploudout2",reploadout2load)
concommand.Add("reploudout3",reploadout3load)
concommand.Add("ferrodaloadout1",ferrodaloadout)
concommand.Add("winduloadout",winduloadout)
concommand.Add("lukeloadout",lukeloadout)
concommand.Add("x2loadout1",x2loadout)
concommand.Add("x1loadout1",x1loadout)
concommand.Add("commandoloadout1",commandoloadout)
concommand.Add("cmd1tele",teleportcmd1)
concommand.Add("cmd2tele",teleportcmd2)
concommand.Add("cmd3tele",teleportcmd3)
concommand.Add("cmd4tele",teleportcmd4)
concommand.Add("cmd5tele",teleportcmd5)
concommand.Add("cmd6tele",teleportcmd6)
concommand.Add("cmd7tele",teleportcmd7)
concommand.Add("cmd8tele",teleportcmd8)
concommand.Add("cmd9tele",teleportcmd9)
concommand.Add("cmd10tele",teleportcmd10)
concommand.Add("cmd11tele",teleportcmd11)
concommand.Add("cmd12tele",teleportcmd12)
concommand.Add("repbase1tele", teleportrepbase1)
concommand.Add("repbase2tele", teleportrepbase2)


--function teleportcmd4()
--local entities_max = ents.GetAll()

--	for k,v in pairs(entities_max) do
--	if v:GetClass() == "rvb_control_point" and v.Owner == "blu" then
--		tele4 = "true"
		
--	end
--end

--	for k,v in pairs(entities_max) do
--	if v:GetClass() == "rvb_control_point" and v.Owner != "blu" then
--		tele4 = "false"
--		
--	end
--end

--	for k,v in pairs(entities_max) do
--	if v:IsPlayer() and v.Blu == true and tele4 == "true" then
--		local cmd4position = v:GetNWVector("cmd4pos", Vector( 0, 0, 0 ))
--		v:SetPos(cmd4position)
--		
--	end
--end
--end
