params ["_position"];

private _relatedSector = [];

// get sectors and already triggered sectors
private _sectors = missionNamespace getVariable ["GRAD_nvacommand_sectors", []];

// check in which sector alarm did go off
{
    _x params ["_sector"];

    if (_position inPolygon _sector) exitWith {

        _sectorTriggered = _sector;
    };

} forEach _sectors;

_relatedSector