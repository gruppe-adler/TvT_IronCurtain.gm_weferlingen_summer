params ["_unit"];

private _handGun = "gm_pm_blk";
private _handGunAmmo = "gm_8Rnd_9x18mm_B_pst_pm_blk";

private _uniform = selectRandom [
    "gm_gc_pol_uniform_dress_80_blu"
];

private _headGear = selectRandom [
    "gm_gc_pol_headgear_cap_80_blu"
];

private _glasses = "";
private _watch = "gm_watch_kosei_80";
private _compass = "gm_gc_compass_f73";
private _bino = "gm_ferod16_oli";


private _loadout = 
    [
        [],
        [],
        [_handGun,"","","",[_handGunAmmo,8],[],""],
        [_uniform,[["gm_gc_army_gauzeBandage",1],["gm_gc_army_medkit",1],["gm_8Rnd_9x18mm_B_pst_pm_blk",12,8]]],
        [],
        [],_headGear,_glasses,[_bino,"","","",[],[],""],
        ["","","",_compass,_watch,""]
    ];

_unit setUnitLoadout _loadout;