params ["_car"];


/*
    todo id should be done by server, test
*/

/*
private _carID = _car getVariable ["GRAD_vopo_carID", "none"];

if (_carID != "none") then {
    _carID = format ["vopo_lautsprecher_%1", position _car];
    _car setVariable ["GRAD_vopo_carID", _carID, true];
};

[_car, _carID, "", true] call GRAD_vopo_fnc_setTFARFakeRadio;

*/

_car addAction [
    "<t color='#993333'>Lautsprecher AN</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [_target, format ["vopo_lautsprecher_%1", _target]] call GRAD_vopo_fnc_callPluginActivate;

        _target setVariable ["IC_vopo_lautsprecher", true, true];        
        [_target] spawn GRAD_vopo_fnc_motorsirene;
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "!(_originalTarget getVariable ['IC_vopo_lautsprecher', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];

_car addAction [
    "<t color='#993333'>Lautsprecher AUS</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["IC_vopo_lautsprecher", false, true];

        [_target, format ["vopo_lautsprecher_%1", _target]] call GRAD_vopo_fnc_callPluginDeactivate;
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "(_originalTarget getVariable ['IC_vopo_lautsprecher', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];