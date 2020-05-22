params ["_ctrl", "_group"];

// abort to close submenu - currently same functionality
[_ctrl, _group] execVM "grad-nvacommand\functions\ui\fn_actionStanceAbort.sqf";
_group setVariable ["nvaCommand_stance", "stand"];

private _originalControl = _ctrl getVariable ["GRAD_nvacommand_originalCtrl", controlNull];
private _originalIcon = _originalControl getVariable ["GRAD_nvacommand_icon", controlNull];
private _icon = _ctrl getVariable ["GRAD_nvacommand_icon", controlNull];

_icon ctrlSetText ([_group] call grad_nvacommand_fnc_getIconStance);
_icon ctrlCommit 0;
_originalIcon ctrlSetText ([_group] call grad_nvacommand_fnc_getIconStance);
_originalIcon ctrlCommit 0;


{
    _x setUnitPos "UP";
} forEach units _group;

[leader _group, "Aufrecht", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";

private _prefix = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\";
private _suffix = ".ogg";
private _sound = "CopyMyStance";

playSound3D [_prefix + _sound + _suffix, curatorCamera];
