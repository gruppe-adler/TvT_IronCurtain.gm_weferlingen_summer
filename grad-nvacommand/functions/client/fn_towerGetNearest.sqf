params ["_position"];

private _allTowers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];
_allTowers = [_allTowers, [], { _position distance _x }, "ASCEND"] call BIS_fnc_sortBy;

(_allTowers select 0)