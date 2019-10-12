--=====================================================================

local DATA = {}
DATA.Name = "anakin"
DATA.HoldType = "wos-anakin"
DATA.BaseHoldType = "melee2"
DATA.Translations = {}

DATA.Translations[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] = {
	{ Sequence = "vanguard_b_s3_t2", Weight = 1 },
	{ Sequence = "b_c1_t1", Weight = 1 },
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
