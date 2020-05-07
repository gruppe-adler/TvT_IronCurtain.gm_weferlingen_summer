["GRAD_vopo_sparkSmall", {
    params ["_position"];
    
    [_position] spawn GRAD_vopo_fnc_sparkSmall;

}] call CBA_fnc_addEventHandler;