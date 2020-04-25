params ["_unit"];

private _nextState = _unit getVariable ["IC_respawnAs", "civilianEast"];

switch (_nextState) do { 
    case "civilianEast" : {
        _unit setPos (selectRandom (missionNamespace getVariable ["IC_spawnPositionsEast", []]));
    };
    case "civilianWest" : {
        _unit setPos (getMarkerPos selectRandom [
            "mrk_respawn_west"
        ]);
    };
    case "nva" : {
        _unit setPos (getMarkerPos selectRandom [
            "mrk_respawn_nva"
        ]);
    };
    case "stasi" : {
        _unit setPos (getMarkerPos selectRandom [
            "mrk_respawn_stasi"
        ]);
    };
    case "vopo" : {
        _unit setPos (getMarkerPos selectRandom [
            "mrk_respawn_vopo"
        ]);
    };
    
    default {
        diag_log format ["IC onRespawnEquip: Error - no respawn setting found"];
    }; 
};