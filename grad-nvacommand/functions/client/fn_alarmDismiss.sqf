params ["_position"];

private _sector = [getPos _tower] call GRAD_nvaCommand_fnc_getSectorForPosition;
[_sector, false] call GRAD_nvaCommand_fnc_alarmSetSector;
[_tower] remoteExec ["GRAD_nvacommand_fnc_towerAlarmDismiss",2];