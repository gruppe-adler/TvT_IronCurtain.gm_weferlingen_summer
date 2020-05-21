params ["_ctrl", "_group"];

private _speed = speedMode _group;
private _iconCtrl = _ctrl getVariable ["GRAD_nvacommand_icon", controlNull];
private _vehicle = _group getVariable ["assignedVehicle", objNull];

private _prefix = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\";
private _suffix = ".ogg";

switch (_speed) do { 
    case "LIMITED" : {  
        _group setSpeedMode "NORMAL";
        _iconCtrl ctrlSetText "grad-nvacommand\vehicles\speed2.paa";
        _iconCtrl ctrlCommit 0;
        [_vehicle, "Tempo normal", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
        private _sound = selectRandom ["VehForward_1", "VehForward_2", "VehForward_3"];
        // todo define in description.ext and playSound
        playSound3D [_prefix + _sound + _suffix, curatorCamera];
    }; 

    case "NORMAL" : { 
        _group setSpeedMode "FULL";
        _iconCtrl ctrlSetText "grad-nvacommand\vehicles\speed_full.paa";
        _iconCtrl ctrlCommit 0;
        [_vehicle, "Tempo schnell", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";

        private _sound = selectRandom ["VehFast_1", "VehFast_3"];
        // todo define in description.ext and playSound
        playSound3D [_prefix + _sound + _suffix, curatorCamera];
    }; 

    case "FULL" : { 
        _group setSpeedMode "LIMITED";
        _iconCtrl ctrlSetText "grad-nvacommand\vehicles\speed_limited.paa";
        _iconCtrl ctrlCommit 0;
        [_vehicle, "Tempo langsam", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
        private _sound = selectRandom ["VehSlow_1", "VehSlow_2", "VehSlow_3"];
        // todo define in description.ext and playSound
        playSound3D [_prefix + _sound + _suffix, curatorCamera];
    };

    default {}; 
};