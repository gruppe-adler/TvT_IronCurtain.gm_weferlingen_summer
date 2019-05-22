params ["_pos"];

private _nearestTower = objNull;
private _allTowers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];
private _minDist = 5;
{
    _distance = _pos distance2D _x;
    if (_distance < _minDist) exitWith {
        _nearestTower = _x;
    };
} forEach _allTowers;

_nearestTower