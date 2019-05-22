waitUntil { player == player };

private _dummies = missionNamespace getVariable ["GRAD_NVACOMMAND_SECTORRAWDATA", []];
private _sectors = [_dummies] call GRAD_nvacommand_fnc_generateSectors;

copyToClipboard str _sectors;

// normalize _sectors into individual arrays for easier management into active/inactive
private _normalizedSectors = [];
{

    _normalizedSectors pushBack ([_forEachIndex, [_x] call GRAD_nvacommand_fnc_getTrianglesForSector]);
} forEach _sectors;

// copyToClipboard str _normalizedSectors;

missionNamespace setVariable ["GRAD_nvacommand_untriggeredSectors", _normalizedSectors, true];

diag_log format ["_normalizedSectors %1", _normalizedSectors];
systemChat str _normalizedSectors;

if (count _normalizedSectors == 0) exitWith {
     systemChat "please add sectors with '[this] call GRAD_nvacommand_fnc_addSectorPoint'; in object inits";
};

/*
[{

    params ["_args", "_handle"];
    _args params ["_sectors"];

    private _triggeredSectors = [];

    {   
        private _sector = _x;
        {
            private _player = _x;

            if ((position _player) inPolygon _sector) then {
                private _triangles = [_sector] call GRAD_nvacommand_fnc_getTrianglesForSector;
                _triggeredSectors append _triangles;
                missionNamespace setVariable ["GRAD_nvacommand_triggeredSectors", _triggeredSectors];
            };
        } forEach allPlayers;
    } forEach _sectors;
    
}, 1, [_sectors]] call CBA_fnc_addPerFrameHandler;
*/