params ["_ctrl", "_group"];

private _getOut = _group getVariable ["actionGetOut", false];
_group setVariable ["actionGetOut", !_getOut];

private _vehicle = _group getVariable ["assignedVehicle", objNull];

private _prefix = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\";
private _suffix = ".ogg";

if (!_getOut) then {
    _group leaveVehicle _vehicle;
    units _group allowGetIn false;
    [_vehicle, "Absitzen", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";

    private _sound = selectRandom ["Dismount_1", "Dismount_2"];
    // todo define in description.ext and playSound
    playSound3D [_prefix + _sound + _suffix, curatorCamera];
} else {
    _group addVehicle _vehicle;
    units _group allowGetIn true;
    units _group orderGetIn true;
    [leader _group, "Aufsitzen", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";

    private _sound = selectRandom ["GetInThatVehicle", "BoardThatVehicle"];
    // todo define in description.ext and playSound
    playSound3D [_prefix + _sound + _suffix, curatorCamera];
    
};