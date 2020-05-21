params ["_ctrl", "_group"];

private _vehicle = _group getVariable ["assignedVehicle", objNull];

if (count units _group < 1) exitWith {
    systemChat "replaced dead group with new one";
    [_group] execVM "grad-nvacommand\functions\ui\fn_actionFleeReplace.sqf";
};

// todo make server execute
{
    _x removeCuratorEditableObjects [units _group + [_vehicle], true];
} forEach allCurators;

for "_i" from count waypoints _group - 1 to 0 step -1 do
{
    deleteWaypoint [_group, _i];
};

sleep 1;

{
  _x disableAI "AUTOTARGET";
  _x disableAI "TARGET";
  _x disableAI "COVER";
  _x disableAI "AUTOCOMBAT";
  _x disableAI "SUPPRESSION";
  _x disableAI "FSM";
  _x forceSpeed 80;
} forEach units _group;

_group setSpeedMode "FULL";
_group setCombatMode "BLUE";
_group setBehaviour "CARELESS";

private _vehicle = _group getVariable ["assignedVehicle", objNull];
_vehicle forceFollowRoad true;

private _despawnPosition = getMarkerPos "mrk_reinforcements_despawn";

/*
isNil {calculatePath ["wheeled_APC", "careless", getPos _vehicle, _despawnPosition] addEventHandler ["PathCalculated",
{ 
  params ["_agent", "_path"];

  if (count _path < 1) then {
      hint str _path;
  };

  if (count _path > 1) then {
      _path params ["_pos1", "_pos2"];

      if (_pos1 isEqualTo _pos2) then {
          systemChat "double path";
      };
  };
}];};
*/


private _wp = _group addWaypoint [_despawnPosition, 0];
_wp setWaypointCompletionRadius 100;
_wp setWaypointStatements ["true", "[this] execVM 'grad-nvacommand\functions\ui\fn_actionFleeReplace.sqf';"]; 
_group setCurrentWaypoint _wp;


[{
    params ["_group"];
    systemChat str (unitReady (leader _group));
}, [_group], 3] call CBA_fnc_waitAndExecute;
// _group move getMarkerPos "mrk_reinforcements_spawn";

[{
    params ["_args", "_handle"];
    _args params ["_group"];

    // systemChat "framehandler";

    if (count units _group < 1) exitWith {
        systemChat "deleting unit";
        deleteGroup _group;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
    
    private _iconPosition = getPos (leader _group); // getPos (vehicle (leader _group));
    _iconPosition params ["_iconPosX", "_iconPosY"];

    // drawIcon3D [getMissionPath "grad-nvacommand\vehicles\flee2.paa", [1,1,1,1], [_iconPosX, _iconPosY, 2], 0, 0, 0, "", 1, 0.05, "PuristaMedium"];    
    drawIcon3D [getMissionPath "grad-nvacommand\vehicles\flee_overhead.paa", [1,1,1,1], [_iconPosX,_iconPosY,5], 1, 1, 0, "", 2, 0.05, "PuristaMedium"];

}, 0, [_group]] call CBA_fnc_addPerFrameHandler;