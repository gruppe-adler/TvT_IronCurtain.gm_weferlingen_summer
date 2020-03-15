params ["_position"];

private _relatedSector = -1;

// get sectors and already triggered sectors
private _sectors = missionNamespace getVariable ["GRAD_nvacommand_sectors", []];

// check in which sector alarm did go off
{
    _x params ["_sector", "_triangles", "_isAlarmed", "_tower"];

    if (_position inPolygon _sector) exitWith {

        _relatedSector = _forEachIndex;
    };

    diag_log format ["_position %1 not in %2", _sector];

} forEach _sectors;

if (_relatedSector < 0) then {
    diag_log format ["no sector found for %1", _position];
};

_relatedSector