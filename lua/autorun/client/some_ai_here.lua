
hook.Add( "PlayerSay", "TEAMchose", function( ply, text, team )
if ply:IsPlayer() then
	if ( string.sub( text, 1, 3 ) == "/JR" ) then
	ply.Red = true
	ply.Blu = nil
	ply.Spec = nil
	end
	
	if ( string.sub( text, 1, 3 ) == "/JB" ) then
	ply.Red = nil
	ply.Blu = true
	ply.Spec = nil
	end
	
	if ( string.sub( text, 1, 3 ) == "/JS" ) then
	ply.Red = nil
	ply.Blu = nil
	ply.Spec = true
	end
end
end )

local function RVBmenu(ply)
if ply:IsPlayer() and ply:IsAdmin() then
local RVBbase = vgui.Create( "DFrame" )
RVBbase:SetTitle( "" )
RVBbase:SetSize( 522, 280 )
RVBbase:Center()
RVBbase:MakePopup()
RVBbase.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 100, 100, 100, 255 ) )
end

local RVBbackground = vgui.Create( "DImageButton", RVBbase )
RVBbackground:SetPos( 5, 20 )
RVBbackground:SetImage( "vgui/rvb_menu.vtf" ) -- Set your .vtf image
RVBbackground:SizeToContents()
RVBbackground.DoClick = function()
end

local RVBbasicBase = vgui.Create("DCollapsibleCategory", RVBbase)
RVBbasicBase:SetPos( 10, 65 )
RVBbasicBase:SetSize( 150, 50 )
RVBbasicBase:SetExpanded( 0 )
RVBbasicBase:SetLabel( "Basics" )
RVBbasicBase.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 55, 255, 250 ) )
end
 
RVBbasicList = vgui.Create( "DPanelList" )
RVBbasicList:SetAutoSize( true )
RVBbasicList:SetSpacing( 5 )
RVBbasicList:EnableHorizontal( false )
RVBbasicList:EnableVerticalScrollbar( true )

RVBbasicBase:SetContents( RVBbasicList )

local SpawnDelay = vgui.Create( "DNumSlider", RVBbase )
SpawnDelay:SetSize( 200, 20 )
SpawnDelay:SetPos( 5, 25 )
SpawnDelay:SetText( "Spawn Delay" )
SpawnDelay:SetMin( 1 ) 
SpawnDelay:SetMax( 25 ) 
SpawnDelay:SetDecimals( 0 )
SpawnDelay:SetConVar( "rvb_spawn_delay" )

RVBbasicList:AddItem( SpawnDelay )

local RVBreactorBase = vgui.Create("DCollapsibleCategory", RVBbase)
RVBreactorBase:SetPos( 362, 65 )
RVBreactorBase:SetSize( 150, 50 )
RVBreactorBase:SetExpanded( 0 )
RVBreactorBase:SetLabel( "Reactors" )
RVBreactorBase.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 55, 0, 250 ) )
end
 
RVBreactorList = vgui.Create( "DPanelList" )
RVBreactorList:SetAutoSize( true )
RVBreactorList:SetSpacing( 5 )
RVBreactorList:EnableHorizontal( false )
RVBreactorList:EnableVerticalScrollbar( true )

RVBreactorBase:SetContents( RVBreactorList )

local ReactorsHP = vgui.Create( "DNumSlider", RVBbase )
ReactorsHP:SetSize( 200, 20 )
ReactorsHP:SetPos( 5, 45 )
ReactorsHP:SetText( "Reactors Health" )
ReactorsHP:SetMin( 100 ) 
ReactorsHP:SetMax( 5000 ) 
ReactorsHP:SetDecimals( 0 )
ReactorsHP:SetConVar( "rvb_reactors_hp" )

RVBreactorList:AddItem( ReactorsHP )

local RVBctfBase = vgui.Create("DCollapsibleCategory", RVBbase)
RVBctfBase:SetPos( 362, 105 )
RVBctfBase:SetSize( 150, 50 )
RVBctfBase:SetExpanded( 0 )
RVBctfBase:SetLabel( "Captrue The Flag" )
RVBctfBase.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 55, 0, 250 ) )
end
 
RVBctfList = vgui.Create( "DPanelList" )
RVBctfList:SetAutoSize( true )
RVBctfList:SetSpacing( 5 )
RVBctfList:EnableHorizontal( false )
RVBctfList:EnableVerticalScrollbar( true )

RVBctfBase:SetContents( RVBctfList ) 

local CTF = vgui.Create( "DNumSlider", RVBbase )
CTF:SetSize( 200, 20 )
CTF:SetPos( 5, 65 )
CTF:SetText( "CTF Limit" )
CTF:SetMin( 1 ) 
CTF:SetMax( 30 ) 
CTF:SetDecimals( 0 )
CTF:SetConVar( "rvb_ctf_maxpoints" )

RVBctfList:AddItem( CTF )

local RVBtdmBase = vgui.Create("DCollapsibleCategory", RVBbase)
RVBtdmBase:SetPos( 362, 145 )
RVBtdmBase:SetSize( 150, 50 )
RVBtdmBase:SetExpanded( 0 )
RVBtdmBase:SetLabel( "Team DeathMatch" )
RVBtdmBase.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 55, 0, 250 ) )
end
 
RVBtdmList = vgui.Create( "DPanelList" )
RVBtdmList:SetAutoSize( true )
RVBtdmList:SetSpacing( 5 )
RVBtdmList:EnableHorizontal( false )
RVBtdmList:EnableVerticalScrollbar( true )

RVBtdmBase:SetContents( RVBtdmList ) 

local MB = vgui.Create( "DNumSlider", RVBbase )
MB:SetSize( 200, 20 )
MB:SetPos( 5, 85 )
MB:SetText( "Max BLU" )
MB:SetMin( 1 ) 
MB:SetMax( 50 ) 
MB:SetDecimals( 0 )
MB:SetConVar( "rvb_dm_blu" )

RVBtdmList:AddItem( MB )

local MR = vgui.Create( "DNumSlider", RVBbase )
MR:SetSize( 200, 20 )
MR:SetPos( 5, 105 )
MR:SetText( "Max RED" )
MR:SetMin( 1 ) 
MR:SetMax( 50 ) 
MR:SetDecimals( 0 )
MR:SetConVar( "rvb_dm_red" )

RVBtdmList:AddItem( MR )

local DMG = vgui.Create( "DNumSlider", RVBbase )
DMG:SetSize( 200, 20 )
DMG:SetPos( 5, 125 )
DMG:SetText( "DeathMatch Goal" )
DMG:SetMin( 1 ) 
DMG:SetMax( 500 ) 
DMG:SetDecimals( 0 )
DMG:SetConVar( "rvb_dm_goal" )

RVBtdmList:AddItem( DMG )

local TDMS = vgui.Create( "DCheckBoxLabel" )
TDMS:SetText( "Use Map Spawns" )
TDMS:SetConVar( "rvb_dm_spawn_type" )
if SuppFirst == nil then
SuppFirst = true
TDMS:SetValue( 0 )
end
TDMS:SizeToContents()
	
RVBtdmList:AddItem( TDMS )

end
end
concommand.Add("rvb_menu", RVBmenu)