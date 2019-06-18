params ["_unit", "_tree"];

_unit setVariable ["GRAD_arrestMechanics_removingHandcuffs", true, true];

[{
    params ["_args", "_handle"];
    _args params ["_unit", "_tree"];

    if ([_unit, _tree] call GRAD_arrestMechanics_fnc_canFree) then { 
        [_unit] call GRAD_arrestMechanics_fnc_freeUnit;
    };
}, 1, [_unit, _tree]] call CBA_fnc_perFrameHandler;