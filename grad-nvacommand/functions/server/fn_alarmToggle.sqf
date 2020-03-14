/*

	toggles alarm for given position/tower

	executed on server
*/


params ["_position"];

private _sectorIndex = [_position] call GRAD_nvaCommand_fnc_alarmGetSector;
private _sectors = missionNamespace getVariable ["GRAD_nvacommand_sectors", []];


(_sectors select _sectorIndex) params ["_sector", "_isAlarmed", "_tower"];
(_sectors select _sectorIndex) set [1, !_isAlarmed];

// toggle sector alarm
missionNamespace setVariable ["GRAD_nvacommand_sectors", _sectors, true];

// do things with tower
if (!_isAlarmed) then {
	[_tower] call GRAD_nvaCommand_fnc_towerAlarmRaiseGroup;
	[_tower] call GRAD_nvaCommand_fnc_towerAlarmRaiseLamp;
	[_tower] call GRAD_nvaCommand_fnc_towerAlarmRaiseSound;
} else {
	[_tower] call GRAD_nvaCommand_fnc_towerAlarmDismissGroup;
	[_tower] call GRAD_nvaCommand_fnc_towerAlarmDismissLamp;
	[_tower] call GRAD_nvaCommand_fnc_towerAlarmDismissSound;
};