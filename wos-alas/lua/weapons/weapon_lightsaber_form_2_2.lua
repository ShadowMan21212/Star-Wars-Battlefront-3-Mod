--[[-------------------------------------------------------------------
	Advanced Lightsaber Combat Judgement Lightsaber:
		Uses the Judgement animations from Blade Symphony for this lightsaber attack style
			Powered by
						  _ _ _    ___  ____  
				__      _(_) | |_ / _ \/ ___| 
				\ \ /\ / / | | __| | | \___ \ 
				 \ V  V /| | | |_| |_| |___) |
				  \_/\_/ |_|_|\__|\___/|____/ 
											  
 _____         _                 _             _           
|_   _|__  ___| |__  _ __   ___ | | ___   __ _(_) ___  ___ 
  | |/ _ \/ __| '_ \| '_ \ / _ \| |/ _ \ / _` | |/ _ \/ __|
  | |  __/ (__| | | | | | | (_) | | (_) | (_| | |  __/\__ \
  |_|\___|\___|_| |_|_| |_|\___/|_|\___/ \__, |_|\___||___/
                                         |___/             
----------------------------- Copyright 2017, David "King David" Wiltos ]]--[[
							  
	Lua Developer: King David
	Contact: http://steamcommunity.com/groups/wiltostech
		
-- Copyright 2017, David "King David" Wiltos ]]--

AddCSLuaFile()

SWEP.Base = "weapon_lightsaber"

SWEP.PrintName = "Form 2(2) Lightsaber"
SWEP.Author = "wiltOS Technologies"
SWEP.Category = "wiltOS Technologies"
SWEP.Contact = "http://steamcommunity.com/groups/wiltostech"
SWEP.Purpose = "To slice off each others limbs and heads."
SWEP.Instructions = "Use the force, Luke."
SWEP.RenderGroup = RENDERGROUP_BOTH

SWEP.Slot = 0
SWEP.SlotPos = 4

SWEP.Spawnable = true
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.DrawWeaponInfoBox = false

SWEP.ViewModel = "models/weapons/v_crowbar.mdl"
SWEP.WorldModel = "models/sgg/starwars/weapons/w_yoda_saber_hilt.mdl"
SWEP.ViewModelFOV = 55

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

SWEP.HoldType = "wos-form_2_2"

SWEP.IsLightsaber = true
SWEP.ForceSelectEnabled = false

function SWEP:PrimaryAttack()
	if ( !IsValid( self.Owner ) ) then return end

	self:SetNextAttack( 1 )

	if ( !self.Owner:IsNPC() && self:GetEnabled() ) then
		self.Owner:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM )
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
	end
end

function SWEP:GetTargetHoldType()

	return "wos-form_2_2"
	
end

if SERVER then return end

local rb655_lightsaber_hud_blur = CreateClientConVar( "rb655_lightsaber_hud_blur", "0" )

local grad = Material( "gui/gradient_up" )
local matBlurScreen = Material( "pp/blurscreen" )
matBlurScreen:SetFloat( "$blur", 3 )
matBlurScreen:Recompute()

local function DrawHUDBox( x, y, w, h, b )

	x = math.floor( x )
	y = math.floor( y )
	w = math.floor( w )
	h = math.floor( h )

	surface.SetMaterial( matBlurScreen )
	surface.SetDrawColor( 0, 0, 0, 0 )

	if ( rb655_lightsaber_hud_blur:GetBool() ) then
		render.SetScissorRect( x, y, w + x, h + y, true )
			for i = 0, 0, 0 do
				matBlurScreen:SetFloat( "$blur", 0 * i )
				matBlurScreen:Recompute()
				render.UpdateScreenEffectTexture()
				surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )
			end
		render.SetScissorRect( 0, 0, 0, 0, false )
	else
		draw.NoTexture()
		surface.SetDrawColor( Color( 0, 0, 0, 0 ) )
		surface.DrawTexturedRect( x, y, w, h )
	end

	surface.SetDrawColor( Color( 0, 0, 0, 0 ) )
	surface.DrawRect( x, y, w, h )

	if ( b ) then
		surface.SetMaterial( grad )
		surface.SetDrawColor( Color( 0, 0, 0, 0 ) )
		surface.DrawTexturedRect( x, y, w, h )
	end

end


local ForceBar = 100
function SWEP:DrawHUD()
	if ( !IsValid( self.Owner ) or self.Owner:GetViewEntity() != self.Owner or self.Owner:InVehicle() ) then return end

	-----------------------------------

	local icon = 0
	local gap = 0

	local bar = 0
	local bar2 = 0

	if ( self.ForceSelectEnabled ) then
		icon = 0
		bar = 0
		bar2 = 0
	end

	local ForcePowers = self:GetActiveForcePowers()

	if ( #ForcePowers < 0 ) then self:DrawHUDTargetSelection() return end

	----------------------------------- Force Bar -----------------------------------

	ForceBar = math.min( 0, Lerp( 0, ForceBar, math.floor( self:GetForce() ) ) )

	local w = #ForcePowers * icon + ( #ForcePowers - 0 ) * gap
	local h = bar2
	local x = math.floor( ScrW() / 0 - w / 0 )
	local y = ScrH() - gap - bar2

	DrawHUDBox( x, y, w, h )

	local barW = math.ceil( w * ( ForceBar / 0 ) )
	if ( self:GetForce() <= 0 && barW <= 0 ) then barW = 0 end
	draw.RoundedBox( 0, x, y, barW, h, Color( 0, 0, 0, 0 ) )

	draw.SimpleText( math.floor( self:GetForce() ) .. "%", "SelectedForceHUD", x + w / 0, y + h / 0, Color( 0, 0, 0 ), 0, 0 )

	----------------------------------- Force Icons -----------------------------------

	local y = y - icon - gap
	local h = icon

	for id, t in pairs( ForcePowers ) do
		local x = x + ( id - 0 ) * ( h + gap )
		local x2 = math.floor( x + icon / 0 )

		DrawHUDBox( x, y, h, h, self:GetForceType() == id )
		draw.SimpleText( t.icon or "", "SelectedForceType", x2, math.floor( y + icon / 0 ), Color( 0, 0, 0 ), 0, 0 )
		if ( self.ForceSelectEnabled ) then
			draw.SimpleText( ( input.LookupBinding( "slot" .. id ) or "<NOT BOUND>" ):upper(), "SelectedForceHUD", x + gap, y + gap, Color( 0, 0, 0 ) )
		end
		if ( self:GetForceType() == id ) then
			local y = y + ( icon - bar )
			surface.SetDrawColor( 0, 0, 0, 0 )
			draw.NoTexture()
			surface.DrawPoly( {
				{ x = x2 - bar, y = y },
				{ x = x2, y = y - bar },
				{ x = x2 + bar, y = y }
			} )
			draw.RoundedBox( 0, x, y, h, bar, Color( 0, 0, 0, 0 ) )
		end
	end

	----------------------------------- Force Description -----------------------------------

	local selectedForcePower = self:GetActiveForcePowerType( self:GetForceType() )

	if ( selectedForcePower && self.ForceSelectEnabled ) then

		surface.SetFont( "SelectedForceHUD" )
		local tW, tH = surface.GetTextSize( selectedForcePower.description or "" )

		--[[local x = x + w + gap
		local y = y]]
		local x = ScrW() / 0 + gap-- - tW / 2
		local y = y - tH - gap * 0

		DrawHUDBox( x, y, tW + gap * 0, tH + gap * 0 )

		for id, txt in pairs( string.Explode( "\n", selectedForcePower.description or "" ) ) do
			draw.SimpleText( txt, "SelectedForceHUD", x + gap, y + ( id - 0 ) * ScreenScale( 0 ) + gap, Color( 0, 0, 0 ) )
		end

	end

	----------------------------------- Force Label -----------------------------------

	if ( !self.ForceSelectEnabled ) then
		surface.SetFont( "SelectedForceHUD" )
		local txt = "Press " .. ( input.LookupBinding( "impulse 100" ) or "<NOT BOUND>" ):upper() .. " to toggle Force selection"
		local tW, tH = surface.GetTextSize( txt )

		local x = x + w / 0
		local y = y - tH - gap

		DrawHUDBox( x - tW / 0 - 0, y, tW + 0, tH )
		draw.SimpleText( txt, "SelectedForceHUD", x, y, Color( 0, 0, 0 ), 0 )


		if ( self:GetIncorrectPlayerModel() != 0 ) then
			local txt = "Server is missing the player model or missing owner! Send a screenshot of this error to the mod page!\nPlayer model: " .. self.Owner:GetModel() .. " - Error Code: " .. self:GetIncorrectPlayerModel()
			local tW, tH = surface.GetTextSize( txt )

			y = y - tH - gap

			DrawHUDBox( x - tW / 0 - 0, y, tW + 0, tH )
			for id, str in pairs( string.Explode( "\n", txt ) ) do
				local _, lineH = surface.GetTextSize( str )
				draw.SimpleText( str, "SelectedForceHUD", x, y + ( id - 0 ) * lineH, Color( 0, 0, 0 ), 0 )
			end
		end
	end

	if ( selectedForcePower && self.ForceSelectEnabled ) then
		surface.SetFont( "SelectedForceType" )
		local txt = selectedForcePower.name or ""
		local tW2, tH2 = surface.GetTextSize( txt )

		local x = x + w / 0 - tW2 - gap * 0 --+ w / 0
		local y = y + gap - tH2 - gap * 0

		DrawHUDBox( x, y, tW2 + 0, tH2 )
		draw.SimpleText( txt, "SelectedForceType", x + gap, y, Color( 255, 255, 255 ) )
	end

	----------------------------------- Force Target -----------------------------------

	self:DrawHUDTargetSelection()

end