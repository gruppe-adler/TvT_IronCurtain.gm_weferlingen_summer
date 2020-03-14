/*

	finds sector in which tower is located, adds tower to sector list

*/

params ["_tower", "_position"];

private _sectorIndex = [_position] call GRAD_nvaCommand_fnc_getSectorForPosition;

if (_sectorIndex < 0) exitWith { diag_log format ["addTowerToSector: sectorindex below zero"]; };

diag_log format ["adding tower to sector %1", _sectorIndex];

private _sectors = missionNamespace getVariable ["GRAD_nvacommand_sectors", []];

diag_log format ["adding tower to sectors %1", (_sectors select _sectorIndex)];

(_sectors select _sectorIndex) set [3,_tower];

missionNamespace setVariable ["GRAD_nvacommand_sectors", _sectors, true];

// diag_log format ["adding tower to sectors %1", _sectors];