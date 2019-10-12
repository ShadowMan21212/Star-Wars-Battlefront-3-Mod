--=====================================================================
/*		My Custom Holdtype
			Created by ShadowMan( STEAM_0:1:187164461 )*/
local DATA = {}
DATA.Name = "form_2_2"
DATA.HoldType = "wos-form_2_2"
DATA.BaseHoldType = "melee2"
DATA.Translations = {}

DATA.Translations[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] = {
	{ Sequence = "vanguard_r_s2_t1", Weight = 1 },
}

DATA.Translations[ ACT_MP_JUMP ] = {
	{ Sequence = "judge_a_idle", Weight = 1 },
}

DATA.Translations[ ACT_MP_STAND_IDLE ] = {
	{ Sequence = "phalanx_b_idle", Weight = 1 },
}

DATA.Translations[ ACT_MP_RUN ] = {
	{ Sequence = "phalanx_b_run", Weight = 1 },
}

DATA.Translations[ ACT_MP_WALK ] = {
	{ Sequence = "flourish_heavy", Weight = 1 },
}

wOS.AnimExtension:RegisterHoldtype( DATA )
--=====================================================================
