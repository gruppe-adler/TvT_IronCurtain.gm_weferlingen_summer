params ["_pos", "_radius"]];


private _dog = [_pos] execVM "GRAD-nvacommand\functions\dogPatrol\fn_spawnDog.sqf";
private _rope = [_pos, _dog] execVM "GRAD-nvacommand\functions\dogPatrol\fn_createRope.sqf";

private _waypointA = getPos _pos [5,45];
private _waypointB = getPos _pos [5,45];

_dog setVariable ["dogPatrol_wpA", _waypointA];
_dog setVariable ["dogPatrol_wpB", _waypointB];


[{
    params ["_args", "_handle"];
    _args params ["_dog"];

    if (moveToCompleted _dog) then {
        // easier debugging when read in runtime
        private _waypointA = _dog getVariable ["dogPatrol_wpA", [0,0,0]];
        private _waypointB = _dog getVariable ["dogPatrol_wpB", [0,0,0]];
        private _currentWP = _dog getVariable ["dogPatrol_currentWP", _waypointA];

        // turn around dog on spot
        _dog doWatch [_waypointA, _waypointB] select (_currentWP == _waypointA);

        [{
            params ["_dog"];

            private _waypointA = _dog getVariable ["dogPatrol_wpA", [0,0,0]];
            private _waypointB = _dog getVariable ["dogPatrol_wpB", [0,0,0]];
            private _currentWP = _dog getVariable ["dogPatrol_currentWP", _waypointA];

            _dog setVariable ["dogPatrol_currentWP", [_waypointA, _waypointB] select (_currentWP == _waypointA)];
            _dog moveTo [_waypointA, _waypointB] select (_currentWP == _waypointA);
            _dog forceSpeed (bob getSpeed selectRandom ["SLOW", "NORMAL", "FAST"]);

        }, [_dog], random 3] call CBA_fnc_waitAndExecute;
    };

}, 1, [_dog]] call CBA_fnc_addPerFrameHandler;

/*
private _wpA = _dog addWaypoint [getPos _pos [5,45], 0, 0, "doggy_wp_a"];
_wpA setWaypointType "MOVE";

private _wpB = _dog addWaypoint [getPos _pos [5,-45], 0, 0, "doggy_wp_b"];
_wpB setWaypointType "MOVE";

private _wpC = _dog addWaypoint [getPos _pos [5,45], 0, 0, "doggy_wp_c"];
_wpB setWaypointType "CYCLE";

[group _dog, 2] setWaypointTimeout [5, 10, 6];
*/

[{
    params ["_args", "_handle"];
    _args params ["_dog"];

    if ({
    	    _nearestPlayer = _x;
    	    _nearestPlayer distance _dog < 150
    } count (playableUnits + switchableUnits) > 0) then {
        _dog doWatch _nearestPlayer;
        _dog say3D "bark";
        [position _dog, "dog", _dog] call GRAD_nvacommand_fnc_alarmRaise;
    };

}, 3, [_dog]] call CBA_fnc_addPerFrameHandler;
