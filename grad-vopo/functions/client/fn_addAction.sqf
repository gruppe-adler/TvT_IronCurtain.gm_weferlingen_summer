/*
    [_car] call GRAD_vopo_fnc_addAction;
*/

params ["_car"];

// blaulicht

/*
_car addAction [
    "<t color='#333399'>Blaulicht AN</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["IC_vopo_blaulicht", true, true];
        [_target] remoteExec ["GRAD_vopo_fnc_blaulicht", 0];
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "!(_originalTarget getVariable ['IC_vopo_blaulicht', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];

_car addAction [
    "<t color='#333399'>Blaulicht AUS</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["IC_vopo_blaulicht", false, true];
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "(_originalTarget getVariable ['IC_vopo_blaulicht', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];

*/


_car addEventHandler ["AnimStateChanged", {
    params ["_unit", "_anim"];

    if (_anim = "beacon_01_org_on") then {
            _unit setVariable ["IC_vopo_presston", true, true];
            [_unit] spawn GRAD_vopo_fnc_presston;
    };

    if (_anim = "beacon_01_org_off") then {
            _unit setVariable ["IC_vopo_presston", false, true];
    };
}];



/*
// presston
_car addAction [
    "<t color='#339933'>Sirene AN</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["IC_vopo_presston", true, true];
        [_target] spawn GRAD_vopo_fnc_presston;
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "!(_originalTarget getVariable ['IC_vopo_presston', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];

_car addAction [
    "<t color='#339933'>Sirene AUS</t>", {
    params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["IC_vopo_presston", false, true];
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "(_originalTarget getVariable ['IC_vopo_presston', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];
*/

// motorsirene
_car addAction [
    "<t color='#993333'>Motorsirene AN</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];

        if (!(isEngineOn _target)) exitWith {
            hint "Erst Motor starten.";
        };
        _target setVariable ["IC_vopo_motorsirene", true, true];        
        [_target] spawn GRAD_vopo_fnc_motorsirene;
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "!(_originalTarget getVariable ['IC_vopo_motorsirene', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];

_car addAction [
    "<t color='#993333'>Motorsirene AUS</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["IC_vopo_motorsirene", false, true];
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "(_originalTarget getVariable ['IC_vopo_motorsirene', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];