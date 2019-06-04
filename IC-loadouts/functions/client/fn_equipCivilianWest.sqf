params ["_unit"];

private _handGun = "rds_weap_latarka_janta";

private _uniform = selectRandom [
    "gm_ge_civ_uniform_blouse_80_gry",
    "gm_gc_civ_uniform_man_02_80_brn",
    "gm_gc_civ_uniform_man_01_80_blu",
    "gm_gc_civ_uniform_man_01_80_blk",
    "RDS_Functionary1",
    "RDS_Functionary2"
];

// keep existing headgear and glasses
private _headGear = headgear _unit;
private _glasses = goggles _unit;

private _watch = "gm_watch_kosei_80";
private _compass = "gm_gc_compass_f73";
private _bino = "gm_ferod16_oli";


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