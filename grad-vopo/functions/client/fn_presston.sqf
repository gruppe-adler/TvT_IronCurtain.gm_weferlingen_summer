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

private _soundSource = createSoundSource ["pressTon7512Sound", position _car, [], 0]; 
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

    private _nearEntities =  _car nearEntities [["Man"], 200];

    {
        private _cansee = [_car, "VIEW"] checkVisibility [visiblePositionASL _x, visiblePositionASL _car] > 0.5;
        
        if (_cansee) then {
            ["GRAD_VOPO_SIGNAL", [_car, "motorsirene"], _x] call CBA_fnc_targetEvent;
        };
    } forEach _nearEntities;
    
}, 2, [_car]] call CBA_fnc_addPerFrameHandler;



[{
    params ["_car", "_soundSource"];
    !(_car getVariable ["IC_vopo_presston", false]) || isNull _car || !alive _car

},{
    params ["_car", "_soundSource", "_sirenEH"];
    deleteVehicle _soundSource;
    [_sirenEH] call CBA_fnc_removePerFrameHandler;
}, [_car, _soundSource, _sirenEH]] call CBA_fnc_waitUntilAndExecute;