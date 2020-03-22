params ["_unit"];

private _nextState = _unit getVariable ["IC_respawnAs", "civilianEast"];
private _vehicleType = "";

switch (_nextState) do { 
    case "civilianEast" : {
        _vehicleType = "gm_xx_civ_bicycle_01";
    };
    case "civilianWest" : {
        _vehicleType = "gm_ge_civ_typ1200";
    };
    case "nva" : {
        _vehicleType = "gm_gc_bgs_p601";
    };
    case "stasi" : {
        _vehicleType = "gm_gc_civ_p601";
    };
    case "vopo" : {
        _vehicleType = "gm_gc_pol_p601";
    };
    
    default {
        diag_log format ["IC onRespawnEquip: Error - no respawn setting found"];
    }; 
};

private _veh = createVehicle [_vehicleType, position player, [], 2, "NONE"];

// remove sirens on regular trabant
if (_vehicleType isEqualTo "gm_gc_bgs_p601") then {
    [
        _veh,
        ["gm_gc_oli",1], 
        ["sirenLights_01_unhide",0]
    ] call BIS_fnc_initVehicle;
};

// add sirens on trabant
if (_vehicleType isEqualTo "gm_gc_pol_p601") then {
    [
        _veh,
        ["gm_gc_oli",1], 
        ["sirenLights_01_unhide",0]
    ] call BIS_fnc_initVehicle;

    [_veh] remoteExec ["GRAD_vopo_fnc_addAction", [0,-2] select isDedicated, true];

    _veh setVariable ["tf_hasRadio", true, true];
    _veh setVariable ["TF_RadioType", "tf_mr6000l", true];
};

// randomize bike
if (_vehicleType isEqualTo "gm_xx_civ_bicycle_01") then {
    [
        _veh,
        true, 
        [
        "cover_01_unhide",selectRandom [0,1],
        "cover_02_unhide",selectRandom [0,1],
        "rack_01_unhide",selectRandom [0,1],
        "rack_02_unhide",selectRandom [0,1],
        "lamp_01_unhide",selectRandom [0,1],
        "bag_01_unhide",selectRandom [0,1],
        "bag_02_unhide",selectRandom [0,1],
        "bag_03_unhide",selectRandom [0,1]
        ]
    ] call BIS_fnc_initVehicle;
};