params ["_ctrl", "_group"];

// taken from biki
_group spawn 
{
    [_this, (currentWaypoint _this)] setWaypointPosition [getPosASL ((units _this) select 0), -1];
    sleep 0.1;
    for "_i" from count waypoints _this - 1 to 0 step -1 do 
    {
        deleteWaypoint [_this, _i];
    };
};