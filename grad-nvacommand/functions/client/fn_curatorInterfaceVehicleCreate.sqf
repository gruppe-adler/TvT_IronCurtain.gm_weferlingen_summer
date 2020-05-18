params ["_entity"];

private _display = findDisplay 312;

private _controlsCreated = [];

private _vehicleBackground = _display ctrlCreate ["RscText", -1];
_vehicleBackground ctrlSetPosition [0, 1.1, 1, 0.26];
_vehicleBackground ctrlSetBackgroundColor [0,0,0,0.7]; 
_vehicleBackground ctrlSetFade 1;
_vehicleBackground ctrlCommit 0;

_vehicleBackground ctrlSetPosition [0, 1, 1, 0.26];
_vehicleBackground ctrlSetFade 0;
_vehicleBackground ctrlCommit 0.1;
_controlsCreated pushBackUnique _vehicleBackground;


private _vehiclePic = _display ctrlCreate ["RscPictureKeepAspect", -1];
_vehiclePic ctrlsetText "grad-nvacommand\displays\alarmgroup.jpg"; 
_vehiclePic ctrlSetPosition [0.01, 1.1, 0.18, 0.18];
_vehiclePic ctrlSetBackgroundColor [0,0,0,0];
_vehiclePic setVariable ["IC_GUI_BGCOLOR", [0,0,0,0]];
_vehiclePic ctrlSetFade 1;
_vehiclePic ctrlCommit 0;

_vehiclePic ctrlSetPosition [0.01, 1.01, 0.18, 0.18];
_vehiclePic ctrlSetFade 0;
_vehiclePic ctrlCommit 0.1;
_controlsCreated pushBackUnique _vehiclePic;

_vehiclePic ctrlAddEventHandler ["MouseEnter", {
    params ["_control"];
    _control ctrlSetForegroundColor [0,0,0,0.2];

}];
_vehiclePic ctrlAddEventHandler ["MouseExit", {
    params ["_control"];
    _control ctrlSetForegroundColor (_control getVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]]);
}];

private _vehicleBtnCenter = _display ctrlCreate ["RscText", -1];
_vehicleBtnCenter ctrlEnable true;
_vehicleBtnCenter ctrlSetPosition [0.1, 1.1, 0.18, 0.18];
_vehicleBtnCenter ctrlSetBackgroundColor [0,0,0,0]; 
_vehicleBtnCenter ctrlSetFade 1;
_vehicleBtnCenter ctrlCommit 0;

_vehicleBtnCenter ctrlSetPosition [0.1, 1.01, 0.18, 0.18];
_vehicleBtnCenter ctrlSetFade 0;
_vehicleBtnCenter ctrlCommit 0.1;
_controlsCreated pushBackUnique _vehicleBtnCenter;

private _vehicleLabel = _display ctrlCreate ["RscText", -1];
_vehicleLabel ctrlsetText (format ["%1", getText (configFile >> "cfgVehicles" >> typeOf _entity >> "displayName")]);
_vehicleLabel ctrlSetPosition [0.02, 1, 0.18, 0.18];
_vehicleLabel ctrlSetBackgroundColor [0,0,0,0]; 
_vehicleLabel ctrlSetFade 1;
_vehicleLabel ctrlCommit 0;

_vehicleLabel ctrlSetPosition [0.02, 1, 0.18, 0.05];
_vehicleLabel ctrlSetFade 0;
_vehicleLabel ctrlCommit 0.1;

_controlsCreated pushBackUnique _vehicleLabel;

// GM trucks have mostly turret slots instead of cargo
private _fullCargo = fullCrew [_entity, "cargo", true] + fullCrew [_entity, "turret", true];

_fullCargo sort true;

private _count = count _fullCargo;
{
    _x params ["_unit", "_role"];

    private _offset = 0.20;
    private _breakPoint = 0.7;

    // ultra ugly multiline
    private _xPos = _offset + _forEachIndex/15;
    private _yPos = if (_xPos > _breakPoint) then { 1.15 } else { 1.05 };

    // second line
    if (_xPos > _breakPoint) then {
        _xPos = (_forEachIndex - 8)/15 + _offset;
    };

    // third line
    if (_xPos > _breakPoint && _yPos > 1.05) then {
        _yPos = 1.25;
        _xPos = (_forEachIndex - 15)/15 + _offset;
    };

    private _bg = _display ctrlCreate ["RscText", -1];
    _bg ctrlSetPosition [_xPos, _yPos, 0.05, 0.05*4/3];
    _bg ctrlSetBackgroundColor [1,1,1,0.1];
    _bg ctrlSetFade 0;
    _bg ctrlCommit 0;

    _controlsCreated pushBackUnique _bg;

    if (!isNull _unit) then {
        private _btn = _display ctrlCreate ["RscPicture", -1];
        _btn ctrlSetPosition [_xPos, _yPos, 0.05, 0.05*4/3]; 

        _btn ctrlSetText "grad-nvacommand\displays\alarmgroup.jpg";
        _btn ctrlSetFade 0;
        _btn ctrlCommit 0;

        _controlsCreated pushBackUnique _btn;
    };
} forEach _fullCargo;


{
    _x params ["_xPos", "_yPos", "_color", "_path", "_string"];

    private _offset = 0.016;

    private _btn = _display ctrlCreate ["RscButton", -1];
    _btn ctrlEnable true;
    _btn ctrlSetPosition [_xPos, _yPos+_offset, 0.05, 0.05*4/3];
    _btn ctrlSetFade 0;

    _btn ctrlSetEventHandler ["ButtonClick", "params ['_control']; private _group = _control getVariable ['GRAD_nvacommand_groupassigned', grpNull]; [_control, _group] execVM (_control getVariable ['GRAD_nvacommand_code', '']);"];
    _btn setVariable ["GRAD_nvacommand_groupassigned", group _entity];
    _btn setVariable ["GRAD_nvacommand_code", _string];

    _btn ctrlCommit 0;



    _controlsCreated pushBackUnique _btn;

    private _btn = _display ctrlCreate ["RscPicture", -1];
    _btn ctrlSetPosition [_xPos, _yPos+_offset, 0.05, 0.05*4/3]; 
    _btn ctrlSetText "grad-nvacommand\vehicles\empty.paa";
    _btn ctrlSetFade 0;
    _btn ctrlCommit 0;

    _controlsCreated pushBackUnique _btn;

    private _btn = _display ctrlCreate ["RscPicture", -1];
    _btn ctrlSetPosition [_xPos, _yPos+_offset, 0.05, 0.05*4/3]; 
    _btn ctrlSetText _path;
    _btn ctrlSetTextColor _color;
    _btn ctrlSetFade 0;
    _btn ctrlCommit 0;

    _controlsCreated pushBackUnique _btn;
} forEach [
    [0.76, 1.0, [1, 1, 1, 1], "grad-nvacommand\vehicles\stop2.paa", "grad-nvacommand\functions\ui\fn_actionStop.sqf" ],
    [0.82, 1.0, [235/255, 87/255, 87/255, 1], "\a3\ui_f\Data\GUI\Cfg\Notifications\tridentFriendly_ca.paa", "grad-nvacommand\functions\ui\fn_actionStop.sqf" ],
    [0.88, 1.0, [235/255, 87/255, 87/255, 1], "\a3\ui_f_curator\Data\CfgWrapperUI\Cursors\curatorPlaceWaypointDestroyMulti_ca.paa", "grad-nvacommand\functions\ui\fn_actionStop.sqf" ],
    [0.94, 1.0, [1, 1, 1, 1], "grad-nvacommand\vehicles\flee2.paa", "grad-nvacommand\functions\ui\fn_actionFlee.sqf" ],
    [0.76, 1.08, [196/255, 196/255, 196/255, 1], "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\column_ca.paa", "grad-nvacommand\functions\ui\fn_actionFormation.sqf"],
    [0.82, 1.08, [196/255, 196/255, 196/255, 1], "\a3\ui_f\Data\IGUI\RscIngameUI\RscUnitInfo\SI_crouch_ca.paa", "grad-nvacommand\functions\ui\fn_actionStance.sqf"],
    [0.88, 1.08, [1, 1, 1, 1], "grad-nvacommand\vehicles\speed2.paa", "grad-nvacommand\functions\ui\fn_actionSpeed.sqf"],
    [0.94, 1.08, [1, 1, 1, 1], "grad-nvacommand\vehicles\road2.paa", "grad-nvacommand\functions\ui\fn_actionRoad.sqf"],
    [0.76, 1.16, [1, 1, 1, 1], "grad-nvacommand\vehicles\getout2.paa", "grad-nvacommand\functions\ui\fn_actionGetOut.sqf"],
    [0.82, 1.16, [1, 1, 1, 1], "grad-nvacommand\vehicles\heal2.paa", "grad-nvacommand\functions\ui\fn_actionHeal.sqf"],
    [0.88, 1.16, [1, 1, 1, 1], "grad-nvacommand\vehicles\build2.paa", "grad-nvacommand\functions\ui\fn_actionBuild.sqf"]
];



uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLE_UIELEMENTS", 
        _controlsCreated
];

missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLE_SELECTED", _entity];


[{
    private _uiElements = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLE_UIELEMENTS", 
        []
    ];

    {
        ctrlDelete _x;
    } forEach _uiElements;
}, [], 4] call CBA_fnc_waitAndExecute;