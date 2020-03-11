params ["_unit"];

private _nextState = _unit getVariable ["IC_respawnAs", "civilianEast"];

switch (_nextState) do { 
    case "civilianEast" : {
        [_unit] setPos (getMarkerPos selectRandom [
            "mrk_respawn_civilian_1"
        ]);
    };
    case "civilianWest" : {
        [_unit] setPos (getMarkerPos selectRandom [
            "mrk_respawn_west"
        ]);
    };
    case "nva" : {
        [_unit] setPos (getMarkerPos selectRandom [
            "mrk_respawn_nva"
        ]);
    };
    case "stasi" : {
        [_unit] setPos (getMarkerPos selectRandom [
            "mrk_respawn_stasi"
        ]);
    };
    case "vopo" : {
        [_unit] setPos (getMarkerPos selectRandom [
            "mrk_respawn_vopo"
        ]);
    };
    
    default {
        diag_log format ["IC onRespawnEquip: Error - no respawn setting found"];
    }; 
};