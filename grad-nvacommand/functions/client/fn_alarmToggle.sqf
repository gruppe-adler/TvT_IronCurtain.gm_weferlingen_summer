/*

	toggles alarm for given position/tower

*/


params ["_position"];

private _sectorIndex = [_position] call GRAD_nvaCommand_fnc_alarmGetSector;

private _sectors = missionNamespace getVariable ["GRAD_nvacommand_sectors", []];

_sectors select _sectorIndex params ["_sector", "_isAlarmed", "_tower"];