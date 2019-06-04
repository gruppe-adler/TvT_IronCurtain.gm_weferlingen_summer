params ["_unit"];

private _handGun = "rds_weap_latarka_janta";

// prefer gm uniforms
private _uniform = selectRandom [
    "gm_ge_civ_uniform_blouse_80_gry",
    "gm_gc_civ_uniform_man_02_80_brn",
    "gm_gc_civ_uniform_man_01_80_blu",
    "gm_gc_civ_uniform_man_01_80_blk",
    "gm_ge_civ_uniform_blouse_80_gry",
    "gm_gc_civ_uniform_man_02_80_brn",
    "gm_gc_civ_uniform_man_01_80_blu",
    "gm_gc_civ_uniform_man_01_80_blk",
    "gm_ge_civ_uniform_blouse_80_gry",
    "gm_gc_civ_uniform_man_02_80_brn",
    "gm_gc_civ_uniform_man_01_80_blu",
    "gm_gc_civ_uniform_man_01_80_blk",

    "rds_uniform_assistant",
    "rds_uniform_Worker1",
    "rds_uniform_Worker2",
    "rds_uniform_Worker3",
    "rds_uniform_Woodlander1",
    "rds_uniform_Woodlander2",
    "rds_uniform_Woodlander3",
    "rds_uniform_Woodlander4",
    "rds_uniform_Villager1",
    "rds_uniform_Villager3",
    "rds_uniform_Villager4",
    "rds_uniform_schoolteacher",
    "rds_uniform_Rocker1",
    "rds_uniform_Rocker2",
    "rds_uniform_Rocker3",
    "rds_uniform_Rocker4",
    "rds_uniform_Profiteer2",
    "rds_uniform_Profiteer3",
    "rds_uniform_citizen1",
    "rds_uniform_citizen2",
    "rds_uniform_citizen3",
    "rds_uniform_citizen4"
];

private _headGear = selectRandom [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "rds_rocker_hair1",
    "rds_rocker_hair2",
    "rds_rocker_hair3"
];

private _glasses = selectRandom [
    "rhsusf_shemagh_white",
    "rhsusf_shemagh_grn",
    "rds_rocker_hair3"
];

private _watch = "gm_watch_kosei_80";
private _compass = "gm_gc_compass_f73";
private _bino = "gm_df7x40_blk";


private _loadout = 
    [
        [],
        [],
        [_handGun,"","","",["rds_dummy_mag",1],[],""],
        [_uniform,[]],
        [],
        [],_headGear,_glasses,[_bino,"","","",[],[],""],
        ["","","",_compass,_watch,""]
    ];

_unit setUnitLoadout _loadout;