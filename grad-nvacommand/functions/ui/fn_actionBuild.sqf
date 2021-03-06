params ["_ctrl", "_group"];

private _vehicle = _group getVariable ["assignedVehicle", objNull];

(ctrlPosition _ctrl) params ["_xPos", "_yPos"];

private _display = findDisplay 312;
private _controlsCreated = [];
private _offsetX = 0.42;
private _offsetY = 0.27;
_yPos = _yPos - _offsetY/2;

private _uiItemSize = 0.10;

private _btnBelow = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIBUTTONS", []];
{
    _x ctrlEnable false;
} forEach _btnBelow;

// get all fortifications available
private _allClasses = "true" configClasses (missionConfigFile >> "CfgNVAFortifications" >> "Fortifications");
private _fortifications = [];

{
    private _config = _x;

    private _className = configName _config;
    private _displayName = [(_config >> "displayName"), "string", getText (configFile >>  "CfgVehicles" >> _classname >> "displayName")] call CBA_fnc_getConfigEntry;
    private _magneticTo = [(_config >> "magneticTo"), "string", ""] call CBA_fnc_getConfigEntry;
    private _demolitionTime = [(_config >> "demolitionTime"), "number", 3] call CBA_fnc_getConfigEntry;
    private _iconPathRaw = [(_config >> "icon"), "string", ""] call CBA_fnc_getConfigEntry;
    private _iconPath = _iconPathRaw + ".paa";
    private _iconPathActive = _iconPathRaw + "_active.paa";
    private _customScript = [(_config >> "customScript"), "string", ""] call CBA_fnc_getConfigEntry;
    private _amountMax = [(_config >> "amount"), "number", 5] call CBA_fnc_getConfigEntry;
    private _amountString = format ["grad_nvaCommand_fortificationAmount_%1", _classname];
    private _amountActual = _vehicle getVariable [_amountString, -2];

    // init vehicle if not done yet
    if (_amountActual == -2) then {
        _vehicle setVariable [_amountString, _amountMax, true];
        _amountActual = _amountMax;
    };

    // systemChat _customScript;

    _fortifications pushBackUnique [_className, _displayName, _iconPath, _iconPathActive, _magneticTo, _amountMax, _amountActual, _customScript];

    // systemChat str _fortifications;
} forEach _allClasses;

// abort button
_fortifications pushBackUnique ["UIabort", "Abbrechen", "grad-nvacommand\vehicles\build_abort.paa", "grad-nvacommand\vehicles\build_abort_active.paa", "", 0, 0, ""];


private _ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_ctrlGroup ctrlSetPosition [_offsetX, _yPos, _uiItemSize * (count _fortifications + 1) + _offsetX, _uiItemSize*4/3];
_ctrlGroup ctrlSetFade 1;
_ctrlGroup ctrlCommit 0;

{
    // [_className, _iconPath, _magneticTo, _amountMax, _amountActual]

    // _x params ["_xPos", "_yPos", "_color", "_iconPath", "_classname", "_string", ["_magneticTo", ""]];
    _x params ["_classname", "_displayName", "_iconPath", "_iconPathActive", "_magneticTo", "_amountMax", "_amountActual", "_customScript"];

    private _amountOfItems = count _fortifications;
    private _isLast = _classname == "UIabort";

    private _isCustom = _customScript != "";

    _xPos = _uiItemSize * (_forEachIndex + 1);

    private _btn = _display ctrlCreate ["grad_nvaCommand_RscButtonSilent", -1, _ctrlGroup];

    if (_amountActual > 0) then {
        _btn ctrlEnable true;
    };

    _btn ctrlSetEventHandler ["ButtonClick", "params ['_control']; private _group = _control getVariable ['GRAD_nvacommand_groupassigned', grpNull]; [_control, _group] execVM (_control getVariable ['GRAD_nvacommand_code', '']);"];
    _btn setVariable ["GRAD_nvacommand_groupassigned", _group];
    
    if (_isCustom) then {
        _btn setVariable ["GRAD_nvacommand_code",
            [
                _customScript,
                "grad-nvacommand\functions\ui\fn_actionStanceAbort.sqf"
            ] select _isLast
        ];
    } else {
        _btn setVariable ["GRAD_nvacommand_code",
            [
                "grad-nvacommand\functions\ui\fn_actionBuildStart.sqf",
                "grad-nvacommand\functions\ui\fn_actionStanceAbort.sqf"
            ] select _isLast
        ];
    };
    _btn setVariable ["GRAD_nvacommand_classname", _classname];
    _btn setVariable ["GRAD_nvacommand_originalCtrl", _ctrl];
    _btn setVariable ["GRAD_nvacommand_magneticTo", _magneticTo];
    _btn setVariable ["GRAD_nvacommand_fortification_isCustom", _isCustom];
    _btn setVariable ["GRAD_nvacommand_iconPath", _iconPath];
    _btn setVariable ["GRAD_nvacommand_iconPathActive", _iconPathActive];
    _btn ctrlSetPosition [_xPos, 0, _uiItemSize, _uiItemSize*4/3];
    _btn ctrlCommit 0;


    private _icon = _display ctrlCreate ["grad_nvaCommand_RscPictureKeepAspect", -1, _ctrlGroup];
    _icon ctrlSetText _iconPath;
    _icon ctrlSetPosition [_xPos, 0, _uiItemSize, _uiItemSize*4/3];
    _icon ctrlCommit 0;
    // [_icon, [_xPos, _yPos, _uiItemSize, _uiItemSize*4/3], true] call GRAD_nvacommand_fnc_GUI_animate;

    _btn ctrlAddEventHandler ["MouseEnter",{
        params ["_control"];
        private _icon = _control getVariable ["GRAD_nvacommand_icon", controlNull];
        private _iconPathActive = _control getVariable ["GRAD_nvacommand_iconPathActive", ""];
        _icon ctrlSetText _iconPathActive;
        _icon ctrlCommit 0;
    }];

    _btn ctrlAddEventHandler ["MouseExit",{
        params ["_control"];
        private _icon = _control getVariable ["GRAD_nvacommand_icon", controlNull];
        private _iconPath = _control getVariable ["GRAD_nvacommand_iconPath", ""];
        _icon ctrlSetText _iconPath;
        _icon ctrlCommit 0;
    }];

    // [_btn, [_xPos, _yPos, _uiItemSize, _uiItemSize*4/3], true] call GRAD_nvacommand_fnc_GUI_animate;

    _controlsCreated pushBackUnique _btn;

    private _label = _display ctrlCreate ["RscText", -1, _ctrlGroup];
    _label ctrlsetText _displayName;
    _label ctrlSetFontHeight 0.02;
    _label ctrlSetBackgroundColor [0,0,0,0];
    _label ctrlSetPosition [_xPos, 0+_uiItemSize*4/3-0.02*4/3, _uiItemSize, 0.02*4/3];
    _label ctrlCommit 0;
    // [_label, [_xPos, _yPos+_uiItemSize*4/3-0.02*4/3, _uiItemSize, 0.02*4/3], true] call GRAD_nvacommand_fnc_GUI_animate;

    if (!_isLast) then {
        private _amount = _display ctrlCreate ["RscText", -1, _ctrlGroup];
        _amount ctrlsetText (str _amountActual + "|" + str _amountMax);
        _amount ctrlSetFontHeight 0.02;
        _amount ctrlSetBackgroundColor [0,0,0,0];
        if (_amountActual < 1) then {
            _amount ctrlSetTextColor [1,0,0,1];
        };
        _amount ctrlSetPosition [_xPos, 0, _uiItemSize, 0.02];
        _amount ctrlCommit 0;
        // [_amount, [_xPos, _yPos, _uiItemSize, 0.02], true] call GRAD_nvacommand_fnc_GUI_animate;
        _controlsCreated pushBackUnique _amount;
    };

    _controlsCreated pushBackUnique _label;



    _btn setVariable ["GRAD_nvacommand_icon", _icon];

    _controlsCreated pushBackUnique _icon;

    _btn setVariable ["GRAD_nvacommand_subcontrols", _controlsCreated];
} forEach _fortifications;

_controlsCreated pushBackUnique _ctrlGroup;
[_ctrlGroup, [_offsetX, _yPos, _uiItemSize * (count _fortifications + 1) + _offsetX, _uiItemSize*4/3], true] call GRAD_nvacommand_fnc_GUI_animate;

private _controlsCreatedBefore = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS", []];

uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS", _controlsCreatedBefore + _controlsCreated];
