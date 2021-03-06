params ["_tower"];
_tower setVariable ["GRAD_nvaCommand_towerAlarm", false, true];
_tower setVariable ["GRAD_nvaCommand_towerWatchMode", "auto", true];

private _towerGroup = _tower getVariable ["GRAD_nvaCommand_towerGroup", grpNull];

if (!isNull _towerGroup) then {
    private _positionBehindDoor = _tower modelToWorld [0,3,-3];
    private _fallBackWP = _towerGroup addWaypoint [_positionBehindDoor, 0];
    _fallBackWP setWaypointStatements ["true", "
    private _group = group this;
    private _tower = [getPos this] call GRAD_nvaCommand_fnc_towerGetNearest;
    private _count = _tower getVariable ['GRAD_nvaCommand_towerIsManned', 0];
    {
        deleteVehicle _x;
        _count = _count + 1;
    } forEach thislist; 
    _tower setVariable ['GRAD_nvaCommand_towerIsManned', _count, true];
    {
        [] remoteExec ['GRAD_nvaCommand_fnc_GUI_refreshSelects', getAssignedCuratorUnit _x];
    } forEach allCurators;
    deleteGroup _group;"];
};