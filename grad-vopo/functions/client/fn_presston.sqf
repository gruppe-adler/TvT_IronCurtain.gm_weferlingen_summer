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


[{
    params ["_car", "_soundSource"];
    !(_car getVariable ["IC_vopo_presston", false])

},{
    params ["_car", "_soundSource"];
    deleteVehicle _soundSource;
}, [_car, _soundSource]] call CBA_fnc_waitUntilAndExecute;