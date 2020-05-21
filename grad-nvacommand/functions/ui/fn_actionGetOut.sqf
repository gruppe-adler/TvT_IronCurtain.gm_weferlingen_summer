params ["_ctrl", "_group"];

private _getOut = _group getVariable ["actionGetOut", false];
_group setVariable ["actionGetOut", !_getOut];

private _vehicle = _group getVariable ["assignedVehicle", objNull];

if (!_getOut) then {
    _group leaveVehicle _vehicle;
    units _group allowGetIn false;
    [_vehicle, "Absitzen", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
} else {
    _group addVehicle _vehicle;
    units _group allowGetIn true;
    units _group orderGetIn true;
    [leader _group, "Aufsitzen", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
};