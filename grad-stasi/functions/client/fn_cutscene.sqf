/*

execVM "grad-stasi/functions/client/fn_cutscene.sqf";

*/

private _position_1 = getPos stasi_cutscene_cam_1;
private _position_2 = getPos stasi_cutscene_cam_2;

private _cam = "camera" camCreate _position_1;
_cam cameraeffect ["internal","back"];
cameraEffectEnableHUD false;
_cam camSetTarget stasi_cutscene_paper;
_cam camSetFov 0.45;
_cam camCommand "INERTIA ON";
_cam camCommit 0;


["BlackAndWhite", 0, false] call BIS_fnc_setPPeffectTemplate;

// black and white
private _ppcolor = ppEffectCreate ["colorCorrections", 2005];
_ppcolor ppEffectAdjust [1, 1.7, 0, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
_ppcolor ppEffectCommit 0;
_ppcolor ppEffectEnable TRUE;

// white
private _ppgrain = ppEffectCreate ["filmGrain", 2004];
_ppgrain ppEffectAdjust [1, 2.5, 3, 0.5, 1];
_ppgrain ppEffectCommit 0;
_ppgrain ppEffectEnable TRUE;


// camera overlay
"cameraOverlay" cutRsc ["RscTitleDisplayEmpty", "PLAIN"];
private _display = uiNamespace getVariable ["RscTitleDisplayEmpty",displayNull];
private _background = _display ctrlCreate ["RscPicture",-1];
_background ctrlSetText "grad-stasi\data\campic.paa";
_background ctrlSetPosition [safezoneX,safezoneY,safeZoneW, safeZoneH];
_background ctrlCommit 0;

setAperture 15;

stasi_cutscene_officer switchMove "InBaseMoves_table1";
stasi_cutscene_victim switchMove "acex_sitting_HubSittingChairB_move1";
stasi_cutscene_officer setRandomLip true;

stasi_cutscene_officer disableAI "ANIM";
stasi_cutscene_victim disableAI "ANIM";
// stasi_cutscene_officer enableAI "ALL";
// stasi_cutscene_victim enableAI "ALL";

{
    _x addEventHandler ["AnimDone", {
        params ["_unit", "_anim"];

        _unit switchMove _anim;

    }];
} forEach [stasi_cutscene_officer, stasi_cutscene_victim];

_cam camSetPos _position_2;
_cam camCommit 180;


diwako_dui_main_toggled_off = true;


// workaround for mouseEnter events not firing on picture
/*
private _mouseOverArea = (uiNamespace getVariable ["ace_common_dlgDisableMouse", displayNull]) ctrlCreate ["RscStructuredText",-1];
_mouseOverArea ctrlSetPosition _controlPosition;
_mouseOverArea ctrlSetText "";
_mouseOverArea ctrlSetBackgroundColor [0,0,0,0.01];
_mouseOverArea ctrlCommit 0;

_mouseOverArea ctrlAddEventHandler ["ButtonClick", "hint 'end cutscene';"];

_mouseOverArea ctrlAddEventHandler ["MouseEnter",{
    private _icon = uiNamespace getVariable ["grad_permaChoice_icon", controlNull];
    if (!isNull _icon) then { _icon ctrlSetText "grad-permaChoice\data\dieAndSpectate_act.paa"; false };
}];
_mouseOverArea ctrlAddEventHandler ["MouseExit",{
    private _icon = uiNamespace getVariable ["grad_permaChoice_icon", controlNull];
    if (!isNull _icon) then { _icon ctrlSetText "grad-permaChoice\data\dieAndSpectate_def.paa"; false };
}];
*/
private _controlPosition =
[
    safeZoneX + (safeZoneW/2) - 0.3,
    safeZoneY + safeZoneH - 0.21,
    0.2 * 3 / 4,
    0.2
];

private _button = findDisplay 49 ctrlCreate ["RscButton",-1];
uiNamespace setVariable ["grad_permaChoice_button", _button];
_button ctrlSetPosition _controlPosition;
_button ctrlSetText "MfS-Spitzelvertrag unterschreiben";
_button ctrlSetTooltip "Einknicken und sofort als Stasi respawnen";
_button ctrlSetBackgroundColor [0,0,0,0.01];
_button ctrlCommit 0;

createDialog "rscAbortCutscene";