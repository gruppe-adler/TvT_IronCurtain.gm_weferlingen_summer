params ["_ctrl", "_group"];

private _speed = speedMode _group;

switch (_speed) do { 
    case "LIMITED" : {  
        _speed setSpeedMode "NORMAL";
        _ctrl ctrlSetText "grad-nvacommand\vehicles\speed2.paa";
        _ctrl ctrlCommit 0;
        [_vehicle, "Tempo normal", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
    }; 

    case "NORMAL" : { 
        _speed setSpeedMode "FULL";
        _ctrl ctrlSetText "grad-nvacommand\vehicles\speed_full.paa";
        _ctrl ctrlCommit 0;
        [_vehicle, "Tempo schnell", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
    }; 

    case "FULL" : { 
        _speed setSpeedMode "LIMITED";
        _ctrl ctrlSetText "grad-nvacommand\vehicles\speed_limited.paa";
        _ctrl ctrlCommit 0;
        [_vehicle, "Tempo langsam", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
    };

    default {}; 
};