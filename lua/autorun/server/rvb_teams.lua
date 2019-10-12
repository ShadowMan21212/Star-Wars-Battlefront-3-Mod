hook.Add("EntityTakeDamage", "RVBresistance", function(target, dmginfo)
local attacker = dmginfo:GetAttacker()
	if ( target:IsNPC() and target.Juggernaut == true ) then

		dmginfo:ScaleDamage( 0.50 )

	end
	
	if ( target:IsNPC() and target.Killable == true and dmginfo:IsDamageType(DMG_BULLET) ) then

		dmginfo:ScaleDamage( 1 )

	end
	
	if ( target:IsNPC() and target.Burner == true and dmginfo:IsDamageType(DMG_BURN) ) then

		dmginfo:ScaleDamage( 0 )

	end
--Synths--
	
	--ELITE--
	if ( target:IsNPC() and target.SynthEliteBlu == true and dmginfo:IsDamageType(DMG_BULLET)) then

		dmginfo:ScaleDamage( 0.70 )

	end
	
	if ( target:IsNPC() and target.SynthEliteBlu == true and dmginfo:IsDamageType(DMG_CRUSH)) then

		dmginfo:ScaleDamage( 0.25 )

	end
	
	if ( target:IsNPC() and target.SynthEliteBlu == true and dmginfo:IsDamageType(DMG_BURN)) then

		dmginfo:ScaleDamage( 0.75 )

	end
	
	if ( target:IsNPC() and target.SynthEliteBlu == true and dmginfo:IsDamageType(DMG_BUCKSHOT)) then

		dmginfo:ScaleDamage( 0.70 )

	end
	
	if ( target:IsNPC() and target.SynthEliteBlu == true and dmginfo:IsDamageType(DMG_PHYSGUN)) then

		dmginfo:ScaleDamage( 50 )

	end
	
	if ( target:IsNPC() and target.SynthEliteBlu == true and attacker.Blu == true and dmginfo:IsDamageType(DMG_DISSOLVE)) then

		dmginfo:ScaleDamage( 0 )

	end
	----
	if ( target:IsNPC() and target.SynthEliteRed == true and dmginfo:IsDamageType(DMG_BULLET)) then

		dmginfo:ScaleDamage( 0.70 )

	end
	
	if ( target:IsNPC() and target.SynthEliteRed == true and dmginfo:IsDamageType(DMG_CRUSH)) then

		dmginfo:ScaleDamage( 0.25 )

	end
	
	if ( target:IsNPC() and target.SynthEliteRed == true and dmginfo:IsDamageType(DMG_BURN)) then

		dmginfo:ScaleDamage( 0.75 )

	end
	
	if ( target:IsNPC() and target.SynthEliteRed == true and dmginfo:IsDamageType(DMG_BUCKSHOT)) then

		dmginfo:ScaleDamage( 0.70 )

	end
	
	if ( target:IsNPC() and target.SynthEliteRed == true and dmginfo:IsDamageType(DMG_PHYSGUN)) then

		dmginfo:ScaleDamage( 50 )

	end
	
	if ( target:IsNPC() and target.SynthEliteRed == true and attacker.Red == true and dmginfo:IsDamageType(DMG_DISSOLVE)) then

		dmginfo:ScaleDamage( 0 )

	end
	
	if ( target:IsNPC() and target.Sterilizer == true and dmginfo:IsDamageType(DMG_BURN)) then

		dmginfo:ScaleDamage( 0 )

	end
	--- No Firendlyfire :D--
	if ((target:IsPlayer() or target:IsNPC()) and target.Blu == true and attacker.Blu == true) then

		dmginfo:ScaleDamage( 0 )

	end
	
	if ((target:IsPlayer() or target:IsNPC()) and target.Red == true and attacker.Red == true) then

		dmginfo:ScaleDamage( 0 )

	end
	
	if ((target:IsPlayer() or target:IsNPC()) and target.Spec == true and (attacker.Red == true or attacker.Blu == true)) then

		dmginfo:ScaleDamage( 0 )

	end
	
	if ((target:IsPlayer() or target:IsNPC()) and (target.Red == true or target.Blu == true) and (attacker.Spec == true)) then

		dmginfo:ScaleDamage( 0 )

	end
	
end)

hook.Add("Think", "PlayerInTeam", function()
for k,v in pairs (player.GetAll()) do
if v.Blu == true then
v:SetPlayerColor( Vector( 0, 0, 255 ) )
end ---BLU
if v.Red == true then
v:SetPlayerColor( Vector( 255, 0, 0 ) )
end ---RED
if v.Spec == true then
v:SetPlayerColor( Vector( 255, 0, 255 ) )
end ---SPECTATOR

end
end)

hook.Add("PlayerSpawn", "RVBteamSpawns", function(ply)
if ply.Blu == true and ((ply.SpawnPoss) and (IsValid(ply.SpawnPoss)) and (ply.DeathMatch == true)) then
ply:EmitSound("RVB.Spawn")
ply:SetPos(ply.SpawnPoss:GetPos())
ply:SetEyeAngles(ply.SpawnPoss:GetAngles())

local effectdata = EffectData()
effectdata:SetOrigin( ply:GetPos() )
effectdata:SetStart( ply:GetPos() )
effectdata:SetEntity( ply )
util.Effect( "entity_remove", effectdata )

elseif ply.Blu == true and ((ply.SpawnPoss) and (IsValid(ply.SpawnPoss)) and (ply.SpawnPoss.Ssmall == true)) then
ply:EmitSound("RVB.Spawn")
ply:SetPos(ply.SpawnPoss:GetPos() + Vector(math.random(-70,70),math.random(-70,70),0))
ply:SetEyeAngles(ply.SpawnPoss:GetAngles() + Angle(0,180,0))

local effectdata = EffectData()
effectdata:SetOrigin( ply:GetPos() )
effectdata:SetStart( ply:GetPos() )
effectdata:SetEntity( ply )
util.Effect( "entity_remove", effectdata )

elseif ply.Blu == true and ((ply.SpawnPoss) and (IsValid(ply.SpawnPoss))) then
ply:EmitSound("RVB.Spawn")
ply:SetPos(ply.SpawnPoss:GetPos() + Vector(math.random(-150,150),math.random(-150,150),0))
ply:SetEyeAngles(ply.SpawnPoss:GetAngles() + Angle(0,180,0))

local effectdata = EffectData()
effectdata:SetOrigin( ply:GetPos() )
effectdata:SetStart( ply:GetPos() )
effectdata:SetEntity( ply )
util.Effect( "entity_remove", effectdata )

end ---BLU
if ply.Red == true and ((ply.SpawnPoss) and (IsValid(ply.SpawnPoss)) and (ply.DeathMatch == true)) then
ply:EmitSound("RVB.Spawn")
ply:SetPos(ply.SpawnPoss:GetPos())
ply:SetEyeAngles(ply.SpawnPoss:GetAngles())

local effectdata = EffectData()
effectdata:SetOrigin( ply:GetPos() )
effectdata:SetStart( ply:GetPos() )
effectdata:SetEntity( ply )
util.Effect( "entity_remove", effectdata )

elseif ply.Red == true and ((ply.SpawnPoss) and (IsValid(ply.SpawnPoss)) and (ply.SpawnPoss.Ssmall == true)) then
ply:EmitSound("RVB.Spawn")
ply:SetPos(ply.SpawnPoss:GetPos() + Vector(math.random(-70,70),math.random(-70,70),0))
ply:SetEyeAngles(ply.SpawnPoss:GetAngles() + Angle(0,180,0))

local effectdata = EffectData()
effectdata:SetOrigin( ply:GetPos() )
effectdata:SetStart( ply:GetPos() )
effectdata:SetEntity( ply )
util.Effect( "entity_remove", effectdata )

elseif ply.Red == true and ((ply.SpawnPoss) and (IsValid(ply.SpawnPoss))) then
ply:EmitSound("RVB.Spawn")
ply:SetPos(ply.SpawnPoss:GetPos() + Vector(math.random(-150,150),math.random(-150,150),0))
ply:SetEyeAngles(ply.SpawnPoss:GetAngles() + Angle(0,180,0))

local effectdata = EffectData()
effectdata:SetOrigin( ply:GetPos() )
effectdata:SetStart( ply:GetPos() )
effectdata:SetEntity( ply )
util.Effect( "entity_remove", effectdata )

end ---RED
if ply.Spec == true and ((ply.SpawnPoss) and (IsValid(ply.SpawnPoss)) and (ply.SpawnPoss.Ssmall == true)) then
ply:EmitSound("RVB.Spawn")
ply:SetPos(ply.SpawnPoss:GetPos() + Vector(math.random(-70,70),math.random(-70,70),0))
ply:SetEyeAngles(ply.SpawnPoss:GetAngles() + Angle(0,180,0))

local effectdata = EffectData()
effectdata:SetOrigin( ply:GetPos() )
effectdata:SetStart( ply:GetPos() )
effectdata:SetEntity( ply )
util.Effect( "entity_remove", effectdata )

elseif ply.Spec == true and ((ply.SpawnPoss) and (IsValid(ply.SpawnPoss))) then
ply:EmitSound("RVB.Spawn")
ply:SetPos(ply.SpawnPoss:GetPos() + Vector(math.random(-150,150),math.random(-150,150),0))
ply:SetEyeAngles(ply.SpawnPoss:GetAngles() + Angle(0,180,0))

local effectdata = EffectData()
effectdata:SetOrigin( ply:GetPos() )
effectdata:SetStart( ply:GetPos() )
effectdata:SetEntity( ply )
util.Effect( "entity_remove", effectdata )

end ---SPECTATOR
end)

hook.Add("EntityTakeDamage", "RVBsynth", function(ent, dmginfo)
	local attacker = dmginfo:GetAttacker()
	if attacker.SynthElite == true then
		dmginfo:ScaleDamage(1.5)
	end
	if attacker.SynthEliteBuffed == true then
		dmginfo:ScaleDamage(1.25)
	end
end)

hook.Add( "OnNPCKilled", "RVBnpcCounter", function( victim, killer, weapon )
	if victim.Blu == true and killer.Red == true then
	for l,k in pairs (ents.FindByClass( "rvb_deathmatch" )) do
	k.KillsRed = (k.KillsRed + 1)
	k.BluSpawned = (k.BluSpawned - 1)
	end
	end
	if victim.Red == true and killer.Blu == true then
	for l,k in pairs (ents.FindByClass( "rvb_deathmatch" )) do
	k.KillsBlu = (k.KillsBlu + 1)
	k.RedSpawned = (k.RedSpawned - 1)
	end
	end
end)

hook.Add( "PlayerDeath", "RVBplayerCounter", function( victim, killer, weapon )
	if victim.Blu == true and killer.Red == true then
	for l,k in pairs (ents.FindByClass( "rvb_deathmatch" )) do
	k.KillsRed = (k.KillsRed + 1)
	end
	end
	if victim.Red == true and killer.Blu == true then
	for l,k in pairs (ents.FindByClass( "rvb_deathmatch" )) do
	k.KillsBlu = (k.KillsBlu + 1)
	end
	end
end)

function RVB_LOAD()
for k, v in pairs(player.GetAll()) do
if v then
v:PrintMessage( HUD_PRINTCENTER, "RVB Models/Sounds Precached" )
--- Precache Models :D ---
util.PrecacheModel("models/csniper.mdl")
util.PrecacheModel("models/heavygunner.mdl")
util.PrecacheModel("models/heg.mdl")
util.PrecacheModel("models/combine_burner_eliter.mdl")
util.PrecacheModel("models/elite_synth.mdl")
util.PrecacheModel("models/fassassin.mdl")
util.PrecacheModel("models/juggernaut.mdl")
util.PrecacheModel("models/nohelm_soldier.mdl")
util.PrecacheModel("models/weapons/w_cup_dark.mdl")
util.PrecacheModel("models/weapons/cup_weapons/w_irifle.mdl")
util.PrecacheModel("models/weapons/cup_weapons/w_shotgun.mdl")
util.PrecacheModel("models/weapons/cup_weapons/w_smg1.mdl")
util.PrecacheModel("models/weapons/cup_weapons/w_pistol.mdl")
util.PrecacheModel("models/weapons/cup_weapons/w_rocket_launcher.mdl")
util.PrecacheModel("models/weapons/glf/w_glf.mdl")
util.PrecacheModel("models/weapons/minigun/w_minigun.mdl")
util.PrecacheModel("models/missing_soldier.mdl")
util.PrecacheModel("models/missing_soldier_prisonguard.mdl")
util.PrecacheModel("models/missing_super_soldier.mdl")
util.PrecacheModel("models/combine_sniper_2.mdl")
util.PrecacheModel("models/weapons/w_gr9npc.mdl")
--- Precache Music ---
util.PrecacheSound("cup_survival/music1.mp3")
util.PrecacheSound("cup_survival/music2.mp3")
util.PrecacheSound("cup_survival/music3.mp3")
util.PrecacheSound("cup_survival/music4.mp3")
util.PrecacheSound("cup_survival/music5.mp3")
util.PrecacheSound("cup_survival/music6.mp3")
util.PrecacheSound("cup_survival/music7.mp3")
util.PrecacheSound("cup_survival/music8.mp3")
util.PrecacheSound("cup_survival/music9.mp3")
util.PrecacheSound("cup_survival/cup_last1.mp3")
util.PrecacheSound("cup_survival/cup_last2.mp3")
util.PrecacheSound("cup_survival/cup_last3.mp3")
util.PrecacheSound("cup_survival/cup_last4.mp3")
util.PrecacheSound("cup_survival/cup_last5.mp3")
util.PrecacheSound("cup_survival/cup_last6.mp3")
util.PrecacheSound("cup_survival/cup_last7.mp3")
util.PrecacheSound("cup_survival/cup_last8.mp3")
util.PrecacheSound("cup_survival/cup_victory1.mp3")
util.PrecacheSound("cup_survival/cup_victory2.mp3")
util.PrecacheSound("cup_survival/cup_victory3.mp3")

end
end
end

timer.Simple( 5, RVB_LOAD )

