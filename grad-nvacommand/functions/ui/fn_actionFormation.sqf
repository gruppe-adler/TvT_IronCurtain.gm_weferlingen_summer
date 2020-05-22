params ["_ctrl", "_group"];

(ctrlPosition _ctrl) params ["_xPos", "_yPos"];

private _display = findDisplay 312;
private _controlsCreated = [];

private _btnBelow = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIBUTTONS", []];
{
    _x ctrlEnable false;
} forEach _btnBelow;

{
    _x params ["_xPos", "_yPos", "_color", "_path", "_string", "_formation"];


    private _btn = _display ctrlCreate ["grad_nvaCommand_RscButtonSilent", -1];
    _btn ctrlEnable true;
    _btn ctrlSetPosition [_xPos, _yPos, 0.05, 0.05*4/3];

    _btn ctrlSetEventHandler ["ButtonClick", "params ['_control']; private _group = _control getVariable ['GRAD_nvacommand_groupassigned', grpNull]; [_control, _group] execVM (_control getVariable ['GRAD_nvacommand_code', '']);"];
    _btn setVariable ["GRAD_nvacommand_groupassigned", _group];
    _btn setVariable ["GRAD_nvacommand_code", _string];
    _btn setVariable ["GRAD_nvacommand_formation", _formation];
    _btn setVariable ["GRAD_nvacommand_originalCtrl", _ctrl];

    _btn ctrlCommit 0;

    _controlsCreated pushBackUnique _btn;

    private _bgPic = _display ctrlCreate ["RscPicture", -1];
    _bgPic ctrlSetPosition [_xPos, _yPos, 0.05, 0.05*4/3];
    _bgPic ctrlSetText "grad-nvacommand\vehicles\empty.paa";
    _bgPic ctrlCommit 0;

    _controlsCreated pushBackUnique _bgPic;

    _btn setVariable ["GRAD_nvacommand_bgPic", _bgPic];

    private _icon = _display ctrlCreate ["RscPicture", -1];
    _icon ctrlSetPosition [_xPos, _yPos, 0.05, 0.05*4/3];
    _icon ctrlSetText _path;
    _icon ctrlSetTextColor _color;
    _icon ctrlCommit 0;


    _btn setVariable ["GRAD_nvacommand_icon", _icon];

    _controlsCreated pushBackUnique _icon;

    _btn setVariable ["GRAD_nvacommand_subcontrols", _controlsCreated];
} forEach [
    [_xPos - 0.20, _yPos, [255/255, 255/255, 255/255, 1], "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\column_ca.paa", "grad-nvacommand\functions\ui\fn_actionSetFormation.sqf", "column"],
    [_xPos - 0.15, _yPos, [255/255, 255/255, 255/255, 1], "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\diamond_ca.paa", "grad-nvacommand\functions\ui\fn_actionSetFormation.sqf", "diamond"],
    [_xPos - 0.10, _yPos, [255/255, 255/255, 255/255, 1], "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\stag_column_ca.paa", "grad-nvacommand\functions\ui\fn_actionSetFormation.sqf", "stag_column"],
    [_xPos - 0.05, _yPos, [255/255, 255/255, 255/255, 1], "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\wedge_ca.paa", "grad-nvacommand\functions\ui\fn_actionSetFormation.sqf", "wedge"],
    [_xPos + 0.00, _yPos, [255/255, 255/255, 255/255, 1], "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\ech_left_ca.paa", "grad-nvacommand\functions\ui\fn_actionStanceAbort.sqf", "ech_left"],
    [_xPos + 0.05, _yPos, [255/255, 255/255, 255/255, 1], "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\ech_right_ca.paa", "grad-nvacommand\functions\ui\fn_actionSetFormation.sqf", "ech_right"],
    [_xPos + 0.10, _yPos, [255/255, 255/255, 255/255, 1], "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\vee_ca.paa", "grad-nvacommand\functions\ui\fn_actionSetFormation.sqf", "vee"],
    [_xPos + 0.15, _yPos, [255/255, 255/255, 255/255, 1], "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\line_ca.paa", "grad-nvacommand\functions\ui\fn_actionSetFormation.sqf", "line"],
    [_xPos + 0.20, _yPos, [255/255, 255/255, 255/255, 1], "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\file_ca.paa", "grad-nvacommand\functions\ui\fn_actionSetFormation.sqf", "file"],
    [_xPos + 0.25, _yPos, [255/255, 255/255, 255/255, 1], "\a3\ui_f\Data\GUI\Rsc\RscDisplayArcadeMap\top_close_gs.paa", "grad-nvacommand\functions\ui\fn_actionStanceAbort.sqf", ""]
];

private _controlsCreatedBefore = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS", []];

uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS", _controlsCreatedBefore + _controlsCreated];