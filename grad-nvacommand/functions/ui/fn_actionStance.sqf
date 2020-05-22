params ["_ctrl", "_group"];

(ctrlPosition _ctrl) params ["_xPos", "_yPos"];

private _display = findDisplay 312;
private _controlsCreated = [];

{
    _x params ["_xPos", "_yPos", "_color", "_path", "_string"];


    private _btn = _display ctrlCreate ["grad_nvaCommand_RscButtonSilent", -1];
    _btn ctrlEnable true;
    _btn ctrlSetPosition [_xPos, _yPos, 0.05, 0.05*4/3];
    _btn ctrlSetFade 0;

    _btn ctrlSetEventHandler ["ButtonClick", "params ['_control']; private _group = _control getVariable ['GRAD_nvacommand_groupassigned', grpNull]; [_control, _group] execVM (_control getVariable ['GRAD_nvacommand_code', '']);"];
    _btn setVariable ["GRAD_nvacommand_groupassigned", _group];
    _btn setVariable ["GRAD_nvacommand_code", _string];

    _btn ctrlCommit 0;

    _controlsCreated pushBackUnique _btn;

    private _bgPic = _display ctrlCreate ["RscPicture", -1];
    _bgPic ctrlSetPosition [_xPos, _yPos, 0.05, 0.05*4/3];
    _bgPic ctrlSetText "grad-nvacommand\vehicles\empty.paa";
    _bgPic ctrlSetFade 0;
    _bgPic ctrlCommit 0;

    _controlsCreated pushBackUnique _bgPic;

    _btn setVariable ["GRAD_nvacommand_bgPic", _bgPic];

    private _icon = _display ctrlCreate ["RscPicture", -1];
    _icon ctrlSetPosition [_xPos, _yPos, 0.05, 0.05*4/3];
    _icon ctrlSetText _path;
    _icon ctrlSetTextColor _color;
    _icon ctrlSetFade 0;
    _icon ctrlCommit 0;


    _btn setVariable ["GRAD_nvacommand_icon", _icon];

    _controlsCreated pushBackUnique _icon;

    _btn setVariable ["GRAD_nvacommand_subcontrols", _controlsCreated];
} forEach [
    [_xPos - 0.10, _yPos, [235/255, 87/255, 87/255, 1], "\A3\UI_F_Curator\Data\default_ca.paa", "grad-nvacommand\functions\ui\fn_actionStanceAuto.sqf" ],
    [_xPos - 0.05, _yPos, [235/255, 87/255, 87/255, 1], "\a3\ui_f\Data\IGUI\RscIngameUI\RscUnitInfo\SI_prone_ca.paa", "grad-nvacommand\functions\ui\fn_actionStanceProne.sqf" ],
    [_xPos + 0.0, _yPos, [235/255, 87/255, 87/255, 1], "\a3\ui_f\Data\IGUI\RscIngameUI\RscUnitInfo\SI_crouch_ca.paa", "grad-nvacommand\functions\ui\fn_actionStanceCrouch.sqf" ],
    [_xPos + 0.05, _yPos, [235/255, 87/255, 87/255, 1], "\a3\ui_f\Data\IGUI\RscIngameUI\RscUnitInfo\SI_stand_ca.paa", "grad-nvacommand\functions\ui\fn_actionStanceStand.sqf" ],
    [_xPos + 0.10, _yPos, [255/255, 255/255, 255/255, 1], "\a3\ui_f\Data\GUI\Rsc\RscDisplayArcadeMap\top_close_gs.paa", "grad-nvacommand\functions\ui\fn_actionStanceAbort.sqf" ]
];

private _controlsCreatedBefore = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS", []];

uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS", _controlsCreatedBefore + _controlsCreated];
