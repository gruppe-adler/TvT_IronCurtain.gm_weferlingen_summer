/*
    optimized for GM trabant
*/

params ["_car"];

// workaround attenuation bug
{
    if (isPlayer _x) then {
        _x switchCamera "External";
    };
} forEach crew _car;

sleep 1;

private _soundSource = createSoundSource ["motorSireneSound", position _car, [], 0]; 
_soundSource attachTo [_car];

sleep 1;

{
    if (isPlayer _x) then {
        _x switchCamera "Internal";
    };
} forEach crew _car;

private _sirenEH = [{
    params ["_args", "_handle"];
    _args params ["_car"];

    private _nearEntities =  _car nearEntities [["Man", "Car", "Motorcycle"], 400];

    {
        private _cansee = [_car, "VIEW"] checkVisibility [visiblePositionASL _x, visiblePositionASL _car] > 0.5;
        
        if (_cansee && !(_x getVariable ["GRAD_vopo_blaulichtAffected", false])) then {
            // ["GRAD_civs_customActivity_start", [_x], _x] call CBA_fnc_targetEvent;
            ["grad_civs_panicking", [_x], [_x]] call CBA_fnc_targetEvent;
            _x setVariable ["GRAD_vopo_blaulichtAffected", true];
            // [_x] call GRAD_vopo_fnc_blaulichtReaction;
        } else {
            // ["GRAD_civs_customActivity_end", [_x], _x] call CBA_fnc_targetEvent;
            ["grad_civs_panicking_end", [_x], [_x]] call CBA_fnc_targetEvent;
            _x setVariable ["GRAD_vopo_blaulichtAffected", false];
        };

    } forEach _nearEntities;
    
}, 2, [_car]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_car", "_soundSource"];
    !(_car getVariable ["IC_vopo_motorSirene", false]) || !(isEngineOn _car) || isNull _car || !alive _car

},{
    params ["_car", "_soundSource", "_sirenEH"];
    deleteVehicle _soundSource;
     [_sirenEH] call CBA_fnc_removePerFrameHandler;
    if (_car getVariable ["IC_vopo_motorSirene", false]) then {
        _car setVariable ["IC_vopo_motorSirene", false, true];
    };
}, [_car, _soundSource, _sirenEH]] call CBA_fnc_waitUntilAndExecute;