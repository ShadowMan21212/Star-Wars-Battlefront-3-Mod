--=====================================================================
/*		My Custom Holdtype
			Created by ShadowMan( STEAM_0:1:187164461 )*/
local DATA = {}
DATA.Name = "basicsaberform2"
DATA.HoldType = "wos-basicsaberform2"
DATA.BaseHoldType = "melee2"
DATA.Translations = {} 

DATA.Translations[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] = {
	{ Sequence = "pure_b_right_t3", Weight = 0.7 },
}

DATA.Translations[ ACT_MP_JUMP ] = {
	{ Sequence = "r_c6_t3", Weight = 1 },
}

DATA.Translations[ ACT_MP_STAND_IDLE ] = {
	{ Sequence = "phalanx_b_idle", Weight = 1 },
}

DATA.Translations[ ACT_MP_RUN ] = {
	{ Sequence = "phalanx_b_run", Weight = 1 },
}

DATA.Translations[ ACT_MP_WALK ] = {
	{ Sequence = "phalanx_r_right_t3", Weight = 1 },
}

wOS.AnimExtension:RegisterHoldtype( DATA )
--=====================================================================
