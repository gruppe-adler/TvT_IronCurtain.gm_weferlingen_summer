params ["_ctrl", "_group"];

private _onRoad = _group getVariable ["GRAD_nvacommand_forceFollowRoad", false];
private _vehicle = _group getVariable ["assignedVehicle", objNull];
private _iconCtrl = _ctrl getVariable ["GRAD_nvacommand_icon", controlNull];

private _prefix = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\";
private _suffix = ".ogg";

if (!alive _vehicle || !canMove _vehicle || isNull _vehicle) exitWith {
    hint "Kein Fahrzeug vorhanden";
};



if (!_onRoad) then {
    [_vehicle, "Bleibe auf Straßen", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";

    _group setVariable ["GRAD_nvacommand_forceFollowRoad", true];
    _vehicle forceFollowRoad true;

    _iconCtrl ctrlSetText "grad-nvacommand\vehicles\road_active.paa";
    _iconCtrl ctrlCommit 0;
     
} else {
    [_vehicle, "Bewegung nach eigenem Ermessen", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";

    _group setVariable ["GRAD_nvacommand_forceFollowRoad", false];
    _vehicle forceFollowRoad false;

    _iconCtrl ctrlSetText "grad-nvacommand\vehicles\road2.paa";
    _iconCtrl ctrlCommit 0;
};