/*
    [curatorSelected select 0 select 0] execvM "grad-nvacommand\functions\client\fn_curatorInterfaceVehicleCreate.sqf";
*/

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
    private _btnsCreated = [];

    private _screenEdgeBottom = safeZoneY + safeZoneH;
    private _vehicleControl_height = 0.26;
    private _buttonSize = 0.05;

    private _vehicleBackground = _display ctrlCreate ["RscText", -1];
    _vehicleBackground ctrlSetBackgroundColor [0,0,0,0.7];
    [_vehicleBackground, [0, _screenEdgeBottom - _vehicleControl_height, 1, _vehicleControl_height], true] spawn GRAD_nvacommand_fnc_GUI_animate;

    private _vehiclePic = _display ctrlCreate ["RscPictureKeepAspect", -1];
    _vehiclePic ctrlsetText _picturePath;
    _vehiclePic ctrlSetBackgroundColor [0,0,0,0];
    [_vehiclePic, [0.01, _screenEdgeBottom - _vehicleControl_height + 0.01, 0.18, 0.18*4/3], true] spawn GRAD_nvacommand_fnc_GUI_animate;

    private _vehicleBtnCenter = _display ctrlCreate ["RscText", -1];
    _vehicleBtnCenter ctrlEnable true;
    _vehicleBtnCenter ctrlSetBackgroundColor [0,0,0,0];
    [_vehicleBtnCenter, [0.1, _screenEdgeBottom - _vehicleControl_height + 0.01, 0.18, 0.18*4/3], true] spawn GRAD_nvacommand_fnc_GUI_animate;

    private _vehicleLabel = _display ctrlCreate ["RscText", -1];
    _vehicleLabel ctrlsetText _displayName;
    _vehicleLabel ctrlSetBackgroundColor [0,0,0,0.8];
    [_vehicleLabel, [0.01, _screenEdgeBottom - _buttonSize - _buttonSize/2, 0.18, _buttonSize], true] spawn GRAD_nvacommand_fnc_GUI_animate;

    
    _controlsCreated pushBackUnique _vehicleBackground;
    _controlsCreated pushBackUnique _vehiclePic;
    _controlsCreated pushBackUnique _vehicleBtnCenter;
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

        private _offset = 0.21;
        private _breakPoint = 0.7;

        // ultra ugly multiline
        private _xPos = _offset + _forEachIndex/15;
        private _yPos = if (_xPos > _breakPoint) then { 
            _screenEdgeBottom - 3*_buttonSize - _buttonSize/4  // second line Y pos
        } else { 
            _screenEdgeBottom - 5*_buttonSize + _buttonSize/4  // single line Y pos
        };

        // second line
        if (_xPos > _breakPoint) then {
            _xPos = (_forEachIndex - 8)/15 + _offset;
        };

        // third line
        if (_xPos > _breakPoint && _yPos > (_screenEdgeBottom - 3*_buttonSize - _buttonSize/4)) then {
            _yPos = _screenEdgeBottom - _buttonSize - _buttonSize/2; // third line Y pos
            _xPos = (_forEachIndex - 15)/15 + _offset;
        };

        private _bg = _display ctrlCreate ["RscText", -1];
        _bg ctrlSetPosition [_xPos, _yPos, 0.05, 0.05*4/3];
        _bg ctrlSetBackgroundColor [1,1,1,0.1];
        [_bg, [_xPos, _yPos, 0.05, 0.05*4/3], true] spawn GRAD_nvacommand_fnc_GUI_animate;

        _controlsCreated pushBackUnique _bg;

        if (!isNull _unit) then {
            private _btn = _display ctrlCreate ["RscPicture", -1];
            _btn ctrlSetPosition [_xPos, _yPos, 0.05, 0.05*4/3];
            _btn ctrlSetText "grad-nvacommand\displays\alarmgroup.jpg";
            [_btn, [_xPos, _yPos, 0.05, 0.05*4/3], true] spawn GRAD_nvacommand_fnc_GUI_animate;

            _controlsCreated pushBackUnique _btn;
        };
    } forEach _fullCargo;


    
    // get all fortifications available
    private _allClasses = "true" configClasses (missionConfigFile >> "CfgNVAVehicleActions" >> "Fortifications");
    private _vehicleActions = [];

    {
        private _config = _x;

        private _name = configName _config;
        private _icon = [(_config >> "icon"), "string", ""] call CBA_fnc_getConfigEntry;
        private _script = [(_config >> "script"), "string", ""] call CBA_fnc_getConfigEntry;
        private _xPos = [(_config >> "xPos"), "number", 0.76] call CBA_fnc_getConfigEntry;
        private _color = [(_config >> "xPos"), "array", [0,0,0,0]] call CBA_fnc_getConfigEntry;
        private _row = [(_config >> "row"), "number", 1] call CBA_fnc_getConfigEntry;

        // systemChat _customScript;

        _vehicleActions pushBackUnique [_name, _icon, _script, _color, _xPos, _row];

        // systemChat str _vehicleActions;
    } forEach _allClasses;



    {
        _x params ["_name", "_icon", "_script", "_color", "_xPos", "_row"];

        private _offset = _buttonSize/8;        
        private _ctrlActive = [_group, _type] call grad_nvacommand_fnc_getButtonActive;

        private _yPos = _screenEdgeBottom - _vehicleControl_height + _row * _buttonSize/8;


        private _btn = _display ctrlCreate ["grad_nvaCommand_RscButtonSilent", -1];
        _btn ctrlEnable true;
        _btn ctrlSetEventHandler ["ButtonClick", "params ['_control']; private _group = _control getVariable ['GRAD_nvacommand_groupassigned', grpNull]; [_control, _group] execVM (_control getVariable ['GRAD_nvacommand_code', '']);"];
        _btn setVariable ["GRAD_nvacommand_groupassigned", _group];
        _btn setVariable ["GRAD_nvacommand_code", _script];

        [_btn, [_xPos, _yPos+_offset, _buttonSize, _buttonSize*4/3], true] spawn GRAD_nvacommand_fnc_GUI_animate;
        

        private _bgPic = _display ctrlCreate ["RscPicture", -1];
        if (_ctrlActive && _isNativeIcon) then {
            _bgPic ctrlSetText "grad-nvacommand\vehicles\empty_active_" + _colorBgPic + ".paa";
        } else {
            _bgPic ctrlSetText "grad-nvacommand\vehicles\empty.paa";
        };
        [_bgPic, [_xPos, _yPos+_offset, _buttonSize, _buttonSize*4/3], true] spawn GRAD_nvacommand_fnc_GUI_animate;       

        private _icon = _display ctrlCreate ["RscPicture", -1];
        _icon ctrlSetText _path;
        if (_ctrlActive && _isNativeIcon) then {
            _icon ctrlSetTextColor _colorActive;
        } else {
            _icon ctrlSetTextColor _colorDefault;
        };
        [_icon, [_xPos, _yPos+_offset, _buttonSize, _buttonSize*4/3], true] spawn GRAD_nvacommand_fnc_GUI_animate;


        _btn setVariable ["GRAD_nvacommand_icon", _icon];
        _btn setVariable ["GRAD_nvacommand_bgPic", _bgPic];
        
        _controlsCreated pushBackUnique _btn;
        _controlsCreated pushBackUnique _bgPic;
        _controlsCreated pushBackUnique _icon;
        _btnsCreated pushBackUnique _btn;

    } forEach _vehicleActions;



    uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS",
            _controlsCreated
    ];

    uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIBUTTONS",
            _btnsCreated
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
