if (!isServer) exitWith {};

private _dummies = missionNamespace getVariable ["GRAD_NVACOMMAND_SECTORRAWDATA", []];
private _sectors = [_dummies] call GRAD_nvacommand_fnc_generateSectors;

// copyToClipboard str _sectors;

// normalize _sectors into individual arrays for easier management into active/inactive
private _normalizedSectors = [];
{
	// [sectorData, isAlarmed, tower]
    _normalizedSectors pushBack [_x, ([_x] call GRAD_nvacommand_fnc_getTrianglesForSector), false];
} forEach _sectors;

// copyToClipboard str _normalizedSectors;

missionNamespace setVariable ["GRAD_nvacommand_sectors", _normalizedSectors, true];

// diag_log format ["_normalizedSectors %1", _normalizedSectors];
// systemChat str _normalizedSectors;

if (count _normalizedSectors == 0) exitWith {
     systemChat "please add sectors with '[this] call GRAD_nvacommand_fnc_addSectorPoint'; in object inits";
};

[] call GRAD_nvacommand_fnc_initTowers;