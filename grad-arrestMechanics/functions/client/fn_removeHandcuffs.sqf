params ["_unit", "_tree"];

_unit setVariable ["GRAD_arrestMechanics_removingHandcuffs", true, true];

[{
    params ["_args", "_handle"];
    _args params ["_unit", "_tree"];

    if (!(_unit getVariable ["GRAD_arrestMechanics_removingHandcuffs", false])) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if ([_unit, _tree] call GRAD_arrestMechanics_fnc_canFree) then { 
        [_unit] call GRAD_arrestMechanics_fnc_freeUnit;
    } else {
        hint "aborted rubbing";
        _unit setVariable ["GRAD_arrestMechanics_removingHandcuffs", false, true];
    };

}, 2, [_unit, _tree]] call CBA_fnc_addPerFrameHandler;