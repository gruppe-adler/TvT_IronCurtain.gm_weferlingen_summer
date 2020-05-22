params ["_ctrl", "_group"];

// abort to close submenu - currently same functionality
[_ctrl, _group] execVM "grad-nvacommand\functions\ui\fn_actionStanceAbort.sqf";

private _icon = _ctrl getVariable ["GRAD_nvacommand_icon", controlNull];
_icon ctrlSetText "\A3\UI_F_Curator\Data\default_ca.paa";

_group setVariable ["nvaCommand_stance", "auto"];

{
    _x setUnitPos "AUTO";
} forEach units _group;

[leader _group, "Nach eigenem Ermessen", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";

private _prefix = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\";
private _suffix = ".ogg";
private _sound = "CopyMyStance";

playSound3D [_prefix + _sound + _suffix, curatorCamera];
