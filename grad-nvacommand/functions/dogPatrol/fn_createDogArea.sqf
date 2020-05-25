params ["_pos", "_radius"]];


private _dog = [_pos] execVM "GRAD-nvacommand\functions\dogPatrol\fn_spawnDog.sqf";

[ _dog,
  _dog,
  _radius,
  7,
  "MOVE",
  "AWARE",
  "YELLOW",
  "FULL",
  "STAG COLUMN",
  "group this setSpeedMode selectRandom ['limited', 'normal', 'full']",
  [0, 6, 12]
] call CBA_fnc_taskPatrol;

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
