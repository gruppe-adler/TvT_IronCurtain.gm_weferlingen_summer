params ["_ctrl", "_group"];

private _classname = _ctrl getVariable ["GRAD_nvacommand_classname", ""];
private _magneticTo = _ctrl getVariable ["GRAD_nvacommand_magneticTo", ""];
private _buildTruck = _group getVariable ["assignedVehicle", objNull];

[_buildTruck, _classname, _magneticTo] execVM "GRAD-nvacommand\functions\client\fn_fortificationsStartBuild.sqf";
[_ctrl, _group] execVM "grad-nvacommand\functions\ui\fn_actionStanceAbort.sqf";