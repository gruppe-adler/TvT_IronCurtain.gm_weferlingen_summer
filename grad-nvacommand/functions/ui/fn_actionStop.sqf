params ["_ctrl", "_group"];

private _prefix = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\";
private _suffix = ".ogg";

private _sound = selectRandom ["VehStop_1", "VehStop_2", "VehStop_3"];
// todo define in description.ext and playSound
playSound3D [_prefix + _sound + _suffix, curatorCamera];

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

private _vehicle = _group getVariable ["assignedVehicle", objNull];

[_vehicle, "Stoppe", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";