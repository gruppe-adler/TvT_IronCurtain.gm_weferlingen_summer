params ["_tower"];

private _sectors = missionNamespace getVariable ["GRAD_nvacommand_sectors", []];
private _towerIsAlarmed = false;

// check in which sector alarm did go off
{
    _x params ["_sector", "_isAlarmed", "_tower"];

    if (_tower == _tower) exitWith {

        _towerIsAlarmed = _isAlarmed;
    };

} forEach _sectors;

_towerIsAlarmed