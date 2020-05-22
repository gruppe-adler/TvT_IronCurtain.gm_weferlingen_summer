params ["_groups"];

// dont create bottom window for multiple entities
if (count _groups > 1) exitWith {};

// yes foreach is quite meaningless here. maybe in the future support multiple selections?
{
    private _group = _x;
    private _picturePath = _group getVariable ["pic", ""];
    private _displayName = _group getVariable ["displayName", ""];
    private _vehicle = _group getVariable ["assignedVehicle", objNull];

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
    _vehiclePic ctrlsetText _picturePath;
    _vehiclePic ctrlSetPosition [0.01, 1.1, 0.20, 0.20];
    _vehiclePic ctrlSetBackgroundColor [0,0,0,0];
    _vehiclePic setVariable ["IC_GUI_BGCOLOR", [0,0,0,0]];
    _vehiclePic ctrlSetFade 1;
    _vehiclePic ctrlCommit 0;

    _vehiclePic ctrlSetPosition [0.01, 1.01, 0.20, 0.20];
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
    _vehicleLabel ctrlsetText _displayName;
    _vehicleLabel ctrlSetPosition [0.02, 1, 0.18, 0.18];
    _vehicleLabel ctrlSetBackgroundColor [0,0,0,0];
    _vehicleLabel ctrlSetFade 1;
    _vehicleLabel ctrlCommit 0;

    _vehicleLabel ctrlSetPosition [0.02, 1, 0.18, 0.05];
    _vehicleLabel ctrlSetFade 0;
    _vehicleLabel ctrlCommit 0.1;

    _controlsCreated pushBackUnique _vehicleLabel;

    // GM trucks have mostly turret slots instead of cargo
    // select 4 is PersonTurret
    private _fullCrew = fullCrew [_vehicle, "", true];
    private _fullCargo = [];

    {
        _x params ["_unit", "_role"];

        if (_role == "turret" || _role == "cargo") then {
            _fullCargo pushBackUnique _x;
        };
    } forEach _fullCrew;

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
        _x params ["_xPos", "_yPos", "_colorDefault", "_colorActive", "_path", "_string", "_colorBgPic", "_type"];

        private _offset = 0.016;        
        private _ctrlActive = [_group, _type] call grad_nvacommand_fnc_getButtonActive;

        private _btn = _display ctrlCreate ["grad_nvaCommand_RscButtonSilent", -1];
        _btn ctrlEnable true;
        _btn ctrlSetPosition [_xPos, _yPos+_offset, 0.05, 0.05*4/3];

        _btn ctrlSetEventHandler ["ButtonClick", "params ['_control']; private _group = _control getVariable ['GRAD_nvacommand_groupassigned', grpNull]; [_control, _group] execVM (_control getVariable ['GRAD_nvacommand_code', '']);"];
        _btn setVariable ["GRAD_nvacommand_groupassigned", _group];
        _btn setVariable ["GRAD_nvacommand_code", _string];

        _btn ctrlCommit 0;

        _controlsCreated pushBackUnique _btn;

        private _bgPic = _display ctrlCreate ["RscPicture", -1];
        _bgPic ctrlSetPosition [_xPos, _yPos+_offset, 0.05, 0.05*4/3];

        if (_ctrlActive) then {
            _bgPic ctrlSetText "grad-nvacommand\vehicles\empty_active_" + _colorBgPic + ".paa";
        } else {
            _bgPic ctrlSetText "grad-nvacommand\vehicles\empty.paa";
        };
        _bgPic ctrlCommit 0;

        _controlsCreated pushBackUnique _bgPic;

        _btn setVariable ["GRAD_nvacommand_bgPic", _bgPic];

        private _icon = _display ctrlCreate ["RscPicture", -1];
        _icon ctrlSetPosition [_xPos, _yPos+_offset, 0.05, 0.05*4/3];
        _icon ctrlSetText _path;
        if (_ctrlActive) then {
            _icon ctrlSetTextColor _colorActive;
        } else {
            _icon ctrlSetTextColor _colorDefault;
        };
        _icon ctrlCommit 0;


        _btn setVariable ["GRAD_nvacommand_icon", _icon];

        _controlsCreated pushBackUnique _icon;
    } forEach [
        [0.76, 1.0, [1, 1, 1, 1], [1, 1, 1, 1], "grad-nvacommand\vehicles\stop2.paa", "grad-nvacommand\functions\ui\fn_actionStop.sqf", "red", "actionStop"],
        [0.82, 1.0, [235/255, 87/255, 87/255, 1], [0, 0, 0, 1], "\a3\ui_f\Data\GUI\Cfg\Notifications\tridentFriendly_ca.paa", "grad-nvacommand\functions\ui\fn_actionIgnore.sqf", "red", "actionIgnore"],
        [0.88, 1.0, [235/255, 87/255, 87/255, 1], [0, 0, 0, 1],"\a3\ui_f_curator\Data\CfgWrapperUI\Cursors\curatorPlaceWaypointDestroyMulti_ca.paa", "grad-nvacommand\functions\ui\fn_actionSuppress.sqf", "red", "actionSuppress"],
        [0.94, 1.0, [1, 1, 1, 1], [1, 1, 1, 1], "grad-nvacommand\vehicles\flee2.paa", "grad-nvacommand\functions\ui\fn_actionFlee.sqf", "red", "actionFlee"],
        [0.76, 1.08, [196/255, 196/255, 196/255, 1], [0, 0, 0, 1], "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\column_ca.paa", "grad-nvacommand\functions\ui\fn_actionFormation.sqf", "white", "actionFormation"],
        [0.82, 1.08, [196/255, 196/255, 196/255, 1], [0, 0, 0, 1], [_group] call grad_nvacommand_fnc_getIconStance, "grad-nvacommand\functions\ui\fn_actionStance.sqf", "white", "actionStance"],
        [0.88, 1.08, [1, 1, 1, 1], [1, 1, 1, 1], [_group] call grad_nvacommand_fnc_getIconSpeed, "grad-nvacommand\functions\ui\fn_actionSpeed.sqf", "white", "actionSpeed"],
        [0.94, 1.08, [1, 1, 1, 1], [1, 1, 1, 1], "grad-nvacommand\vehicles\road2.paa", "grad-nvacommand\functions\ui\fn_actionRoad.sqf", "white", "actionRoad"],
        [0.76, 1.16, [1, 1, 1, 1], [1, 1, 1, 1], "grad-nvacommand\vehicles\getout2.paa", "grad-nvacommand\functions\ui\fn_actionGetOut.sqf", "yellow", "actionGetOut"],
        [0.82, 1.16, [1, 1, 1, 1], [1, 1, 1, 1], "grad-nvacommand\vehicles\heal2.paa", "grad-nvacommand\functions\ui\fn_actionHeal.sqf", "yellow", "actionHeal"],
        [0.88, 1.16, [1, 1, 1, 1], [1, 1, 1, 1], "grad-nvacommand\vehicles\build2.paa", "grad-nvacommand\functions\ui\fn_actionBuild.sqf", "yellow", "actionBuild"]
    ];



    uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS",
            _controlsCreated
    ];

    missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLEGROUPS_SELECTED", _groups];

} forEach _groups;
/*
[{
    private _uiElements = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS",
        []
    ];

    {
        ctrlDelete _x;
    } forEach _uiElements;
}, [], 4] call CBA_fnc_waitAndExecute;
*/
