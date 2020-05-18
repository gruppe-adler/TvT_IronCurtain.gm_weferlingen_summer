params ["_ctrl", "_group"];

// todo make server execute
{
    _x removeCuratorEditableObjects [units _group, true];
} forEach allCurators;

_group setCaptive true;
_group allowFleeing 1;
_group setSpeedMode "FULL";

_group spawn 
{
    [_this, (currentWaypoint _this)] setWaypointPosition [0,0,0];
    sleep 0.1;
    for "_i" from count waypoints _this - 1 to 0 step -1 do 
    {
        deleteWaypoint [_this, _i];
    };
};

[{
    params ["_args", "_handle"];
    _args params ["_group"];

    if (count units _group < 1) exitWith {
        deleteGroup _group;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
    
    drawIcon3D ["grad-nvacommand\vehicles\flee2.paa", [1,1,1,1], leader _group, 0, 0, 0, "", 1, 0.05, "PuristaMedium"];    

}, 0, [_group]] call CBA_fnc_addPerFrameHandler;