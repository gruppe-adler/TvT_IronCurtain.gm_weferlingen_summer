params ["_unit"];

private _strengthLeft = _unit getVariable ["GRAD_arrestMechanics_handCuffStrength", 100];

if (_strengthLeft < 0) exitWith {
    _unit say3D "GRAD_arrestMechanics_snap";
    _unit setVariable ["GRAD_arrestMechanics_removingHandcuffs", false, true];
    [_unit, false] call ace_captives_fnc_setHandcuffed;
    _unit setVariable ["GRAD_arrestMechanics_handCuffStrength", 100];
};

_unit say3D (selectRandom [
    "GRAD_arrestMechanics_rub1",
    "GRAD_arrestMechanics_rub2",
    "GRAD_arrestMechanics_rub3"
]);

_strengthLeft = _strengthLeft - (floor (random 3));
 _unit setVariable ["GRAD_arrestMechanics_handCuffStrength", _strengthLeft];
systemChat ("strength: " + str _strengthLeft);