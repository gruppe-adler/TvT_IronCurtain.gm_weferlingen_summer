/*

	finds sector in which tower is located, adds tower to sector list

*/

params ["_tower", "_position"];

private _sectorIndex = [_position] call GRAD_nvaCommand_fnc_getSectorForPosition;

private _sectors = missionNamespace getVariable ["GRAD_nvacommand_sectors", []];

(_sectors select _sectorIndex) set [2,_tower];

missionNamespace setVariable ["GRAD_nvacommand_sectors", _sectors, true];