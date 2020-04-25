params ["_unit"];

private _nextState = _unit getVariable ["IC_respawnAs", "civilianEast"];

switch (_nextState) do { 
    case "civilianEast" : {
        [_unit] call IC_loadouts_fnc_equipCivilianEast;
    };
    case "civilianWest" : {
        [_unit] call IC_loadouts_fnc_equipCivilianWest;
    };
    case "nva" : {
        [_unit] call IC_loadouts_fnc_equipNVA;
    };
    case "stasi" : {
        [_unit] call IC_loadouts_fnc_equipStasi;
    };
    case "vopo" : {
        [_unit] call IC_loadouts_fnc_equipVopo;
    };
    
    default {
        diag_log format ["IC onRespawnEquip: Error - no respawn setting found"];
    }; 
};