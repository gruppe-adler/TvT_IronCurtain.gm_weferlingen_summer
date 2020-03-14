/*
	gets triggered sector belonging to a position

	[positionArray,alarmBoolean]
*/

params ["_position"];

private _sectorTriggered = -1;

// get sectors
private _sectors = missionNamespace getVariable ["GRAD_nvacommand_sectors", []];


// check in which sector alarm did go off
{
	_x params ["_sector", "_isAlarmed", "_tower"];

    if (_position inPolygon _sector) exitWith {

        _sectorTriggered = _forEachIndex;
    };

} forEach _sectors;

_sectorTriggered