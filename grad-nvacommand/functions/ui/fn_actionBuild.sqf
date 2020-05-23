params ["_ctrl", "_group"];

(ctrlPosition _ctrl) params ["_xPos", "_yPos"];

private _display = findDisplay 312;
private _controlsCreated = [];

private _btnBelow = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIBUTTONS", []];
{
    _x ctrlEnable false;
} forEach _btnBelow;

{
    _x params ["_xPos", "_yPos", "_color", "_classname", "_string", "_isAbort", ["_magneticTo", ""]];

    private _offsetX = -0.1;
    private _offsetY = -0.1;
    _xPos = _xPos + _offsetX;
    _yPos = _yPos + _offsetY;
    private _path =  getText (configfile >> "CfgVehicles" >> _classname >> "editorPreview");
    if (_isAbort) then {
        _path = "\a3\ui_f\Data\GUI\Rsc\RscDisplayArcadeMap\top_close_gs.paa";
    };

    private _btn = _display ctrlCreate ["grad_nvaCommand_RscButtonSilent", -1];
    _btn ctrlEnable true;
    _btn ctrlSetPosition [_xPos, _yPos, 0.20, 0.20*4/3];

    _btn ctrlSetEventHandler ["ButtonClick", "params ['_control']; private _group = _control getVariable ['GRAD_nvacommand_groupassigned', grpNull]; [_control, _group] execVM (_control getVariable ['GRAD_nvacommand_code', '']);"];
    _btn setVariable ["GRAD_nvacommand_groupassigned", _group];
    _btn setVariable ["GRAD_nvacommand_code", _string];
    _btn setVariable ["GRAD_nvacommand_classname", _classname];
    _btn setVariable ["GRAD_nvacommand_originalCtrl", _ctrl];
    _btn setVariable ["GRAD_nvacommand_magneticTo", _magneticTo];

    _btn ctrlCommit 0;

    _controlsCreated pushBackUnique _btn;

    private _bgPic = _display ctrlCreate ["RscPicture", -1];
    _bgPic ctrlSetPosition [_xPos, _yPos, 0.20, 0.20*4/3];
    _bgPic ctrlSetText "grad-nvacommand\vehicles\empty.paa";
    _bgPic ctrlCommit 0;

    _controlsCreated pushBackUnique _bgPic;

    _btn setVariable ["GRAD_nvacommand_bgPic", _bgPic];

    private _icon = _display ctrlCreate ["grad_nvaCommand_RscPictureKeepAspect", -1];
    _icon ctrlSetPosition [_xPos, _yPos, 0.20, 0.20*4/3];
    _icon ctrlSetText _path;
    _icon ctrlSetTextColor _color;
    _icon ctrlCommit 0;


    _btn setVariable ["GRAD_nvacommand_icon", _icon];

    _controlsCreated pushBackUnique _icon;

    _btn setVariable ["GRAD_nvacommand_subcontrols", _controlsCreated];
} forEach [
    [_xPos - 0.40, _yPos, [255/255, 255/255, 255/255, 1], "land_gm_gc_lamp_02_01", "grad-nvacommand\functions\ui\fn_actionBuildStart.sqf", false],
    [_xPos - 0.20, _yPos, [255/255, 255/255, 255/255, 1], "ACE_FlareTripMine", "grad-nvacommand\functions\ui\fn_actionBuildStart.sqf", false],
    [_xPos - 0.00, _yPos, [255/255, 255/255, 255/255, 1], "land_gm_tanktrap_02", "grad-nvacommand\functions\ui\fn_actionBuildStart.sqf", false],
    [_xPos + 0.20, _yPos, [255/255, 255/255, 255/255, 1], "land_gm_flanders_fence_01", "grad-nvacommand\functions\ui\fn_actionBuildStart.sqf", false],
    [_xPos + 0.40, _yPos, [255/255, 255/255, 255/255, 1], "land_gm_gc_g501_sm70_02", "grad-nvacommand\functions\ui\fn_actionBuildStart.sqf", false, "land_gm_fence_border_gz1_600"],    
    [_xPos + 0.60, _yPos, [255/255, 255/255, 255/255, 1], "land_gm_flanders_fence_01", "grad-nvacommand\functions\ui\fn_actionStanceAbort.sqf", true]
];

private _controlsCreatedBefore = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS", []];

uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS", _controlsCreatedBefore + _controlsCreated];