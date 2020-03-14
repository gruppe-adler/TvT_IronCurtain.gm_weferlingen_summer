params ["_position"];

private _relatedSector = [];

// get sectors and already triggered sectors
private _triggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_triggeredSectors", []];
private _untriggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_untriggeredSectors", []];

// check in which sector alarm did go off
{
    private _sector = _x;

    if (_position inPolygon _sector) exitWith {

        _sectorTriggered = _sector;
    };

} forEach (_untriggeredSectors + _triggeredSectors);

_relatedSector