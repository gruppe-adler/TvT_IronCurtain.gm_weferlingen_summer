/*
    [cursorObject] execVM "grad-nvacommand\functions\ui\fn_actionReverse.sqf";
*/

params ["_ctrl", "_group"];

private _vehicle = _group getVariable ["assignedVehicle", objNull];
private _isReversing = _vehicle getVariable ["GRAD_nvacommand_isReversing", false];
private _isEmpty = (count (crew _vehicle)) == 0;
private _icon = _ctrl getVariable ["GRAD_nvacommand_icon", controlNull];


if (_isEmpty) exitWith {
    systemChat "vehicle empty";
};

if (_isReversing) exitWith {
    _vehicle setVariable ["GRAD_nvacommand_isReversing", false, true];
    _icon ctrlSetText "grad-nvacommand\vehicles\reverse.paa";
    _icon ctrlCommit 0;
};

_vehicle setVariable ["GRAD_nvacommand_isReversing", true, true];
_icon ctrlSetText "grad-nvacommand\vehicles\reverse_active.paa";
_icon ctrlCommit 0;

// systemChat "reversing";

private _agent = (group driver _vehicle) createUnit ["C_Man_1", position _vehicle, [], 0, "CARGO"];
_agent moveInAny _vehicle;
_agent hideObjectGlobal true;
_vehicle setEffectiveCommander _agent;

[{ 
    params ["_args", "_handle"];
    _args params ["_vehicle", "_agent"];

    _vehicle sendSimpleCommand "BACK";

    if (!(_vehicle getVariable ["GRAD_nvacommand_isReversing", false])) then {
        [_handle] call CBA_fnc_removePerFrameHandler;
        deleteVehicle _agent;
    };
    
}, 0, [_vehicle, _agent]] call CBA_fnc_addPerFrameHandler;

