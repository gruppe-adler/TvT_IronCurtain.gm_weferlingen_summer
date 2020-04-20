params ["_unit"];

private _nextState = _unit getVariable ["IC_respawnAs", "civilianEast"];
private _vehicleType = "";

VEHICLE_AMBULANCE = "RDS_S1203_Civ_02";
VEHICLE_WEST_DEFAULT = "gm_ge_civ_typ1200";
VEHICLE_EAST_DEFAULT = "gm_xx_civ_bicycle_01";
VEHICLE_NVA_DEFAULT = "gm_gc_bgs_p601";
VEHICLE_STASI_DEFAULT = "gm_gc_civ_p601";
VEHICLE_VOPO_DEFAULT = "gm_gc_pol_p601";

switch (_nextState) do { 
    case "civilianEast" : {
        _vehicleType = VEHICLE_EAST_DEFAULT;

        if (_unit getVariable ["IC_unitRole", "none"] == "doctor") then {
            _vehicleType = VEHICLE_AMBULANCE;
        };
    };
    case "civilianWest" : {
        _vehicleType = VEHICLE_WEST_DEFAULT;
    };
    case "nva" : {
        _vehicleType = VEHICLE_NVA_DEFAULT;
    };
    case "stasi" : {
        _vehicleType = VEHICLE_STASI_DEFAULT;
    };
    case "vopo" : {
        _vehicleType = VEHICLE_VOPO_DEFAULT;
    };
    
    default {
        diag_log format ["IC onRespawnEquip: Error - no respawn setting found"];
    }; 
};

// safecheck
if (_vehicleType == "") exitWith { diag_log "fn_createrespawnvehicle error: no vehicletype specified;" };

private _veh = createVehicle [_vehicleType, position player, [], 2, "NONE"];

if (_vehicleType isEqualTo VEHICLE_AMBULANCE) then {
    [_veh, "115", true, "all", true, getMarkerPos "mrk_hospital"] call GRAD_landline_fnc_addPhone;
    [_veh] remoteExec ["addAcceptCallToVehicle", [0,-2] select isDedicated];
};


// remove sirens on regular trabant
if (_vehicleType isEqualTo VEHICLE_NVA_DEFAULT) then {
    [
        _veh,
        ["gm_gc_oli",1], 
        ["sirenLights_01_unhide",0]
    ] call BIS_fnc_initVehicle;
};

// add sirens on trabant
if (_vehicleType isEqualTo VEHICLE_VOPO_DEFAULT) then {
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
if (_vehicleType isEqualTo VEHICLE_EAST_DEFAULT) then {
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