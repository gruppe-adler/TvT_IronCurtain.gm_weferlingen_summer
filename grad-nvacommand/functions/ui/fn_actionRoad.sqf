params ["_ctrl", "_group"];

private _onRoad = _group getVariable ["GRAD_nvacommand_forceFollowRoad", false];
private _vehicle = _group getVariable ["assignedVehicle", objNull];
private _bgPic = _ctrl getVariable ["GRAD_nvacommand_bgPic", controlNull];
private _icon = _ctrl getVariable ["GRAD_nvacommand_icon", controlNull];

private _prefix = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\";
private _suffix = ".ogg";

if (!alive _vehicle || !canMove _vehicle || isNull _vehicle) exitWith {
    hint "Kein Fahrzeug vorhanden";
};

if (_onRoad) then {
    [_vehicle, "Bleibe auf Straßen", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";

    _icon ctrlSetTextColor [0/255, 0/255, 0/255, 1];
    _bgPic ctrlSetText "grad-nvacommand\vehicles\empty_active_white.paa";
    _icon ctrlCommit 0;
    _bgPic ctrlCommit 0;

    _group setVariable ["GRAD_nvacommand_forceFollowRoad", false];
    _vehicle forceFollowRoad false;
     
} else {
    [_vehicle, "Bewegung nach eigenem Ermessen", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";

    _icon ctrlSetTextColor [235/255, 87/255, 87/255, 1];
    _bgPic ctrlSetText "grad-nvacommand\vehicles\empty.paa";
    _icon ctrlCommit 0;
    _bgPic ctrlCommit 0;

    _group setVariable ["GRAD_nvacommand_forceFollowRoad", true];
    _vehicle forceFollowRoad true;
};