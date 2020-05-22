params ["_ctrl", "_group"];

private _getOut = _group getVariable ["GRAD_nvaCommand_actionGetOut", false];
private _vehicle = _group getVariable ["assignedVehicle", objNull];
private _icon = _ctrl getVariable ["GRAD_nvacommand_icon", controlNull];

private _prefix = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\";
private _suffix = ".ogg";

if (!_getOut) then {
    _group setVariable ["GRAD_nvaCommand_actionGetOut", true];

    _group leaveVehicle _vehicle;
    units _group allowGetIn false;
    [_vehicle, "Absitzen", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";

    private _sound = selectRandom ["Dismount_1", "Dismount_2"];
    // todo define in description.ext and playSound
    playSound3D [_prefix + _sound + _suffix, curatorCamera];

    _icon ctrlSetText "grad-nvacommand\vehicles\getout_active.paa";
    _icon ctrlCommit 0;

     private _unitsInCargo = units _group;
    {
        _x addCuratorEditableObjects [_unitsInCargo, false];
    } forEach allCurators;

} else {
    _group setVariable ["GRAD_nvaCommand_actionGetOut", false];

    private _unitsInCargo = units _group;

    _group addVehicle _vehicle;
    units _group allowGetIn true;
    units _group orderGetIn true;
    [leader _group, "Aufsitzen", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";

    private _sound = selectRandom ["GetInThatVehicle", "BoardThatVehicle"];
    // todo define in description.ext and playSound
    playSound3D [_prefix + _sound + _suffix, curatorCamera];
    
    _icon ctrlSetText "grad-nvacommand\vehicles\getout.paa";
    _icon ctrlCommit 0;

    {
        _x removeCuratorEditableObjects [_unitsInCargo, false];
    } forEach allCurators;
};