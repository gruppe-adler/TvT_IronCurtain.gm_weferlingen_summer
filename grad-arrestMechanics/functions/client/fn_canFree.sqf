params ["_unit", "_tree"];

if (_unit distance _tree > 5) exitWith {
    hint "aborted rubbing";
};

[] call GRAD_arrestMechanics_fnc_freeUnit;