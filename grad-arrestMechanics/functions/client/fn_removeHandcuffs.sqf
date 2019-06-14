params ["_unit"];

[{
    params ["_args", "_handle"];
    _args params ["_unit"];

    if (captive _unit && {_unit getVariable ["GRAD_arrestMechanics_idle", true]}) then { 
        [_unit] call GRAD_arrestMechanics_fnc_freeUnit;
    };


}, 1, [_unit]] call CBA_fnc_perFrameHandler;