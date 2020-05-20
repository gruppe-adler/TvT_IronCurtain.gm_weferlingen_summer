params ["_ctrl", "_group"];

private _onRoad = _group getVariable ["forceFollowRoad", false];
_group setVariable ["forceFollowRoad", !_onRoad];

private _vehicle = _group getVariable ["assignedVehicle", objNull];

if (!alive _vehicle || !canMove _vehicle || isNull _vehicle) exitWith {
    hint "Kein Fahrzeug vorhanden";
};

_vehicle forceFollowRoad !_onRoad;

if (!_onRoad) then {
    [_vehicle, "Bleibe auf Straßen", 7] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
} else {
    [_vehicle, "Bewegung nach eigenem Ermessen", 7] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
};