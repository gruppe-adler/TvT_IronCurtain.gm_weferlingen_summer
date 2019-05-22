// [this] call GRAD_nvacommand_fnc_addSectorPoint;

params ["_object"];

if (!isServer) exitWith {};

private _existingObjects = missionNamespace getVariable ["GRAD_NVACOMMAND_SECTORRAWDATA", []];

_existingObjects pushBack _object;

missionNamespace setVariable ["GRAD_NVACOMMAND_SECTORRAWDATA", _existingObjects];