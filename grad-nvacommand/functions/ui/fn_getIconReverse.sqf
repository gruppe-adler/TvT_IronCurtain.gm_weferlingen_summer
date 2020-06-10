params ["_group"];

private _return = _group getVariable ["GRAD_nvacommand_isReversing", false];

if (_return) then {
    _return = "grad-nvacommand\vehicles\reverse_active.paa";
} else {
    _return = "grad-nvacommand\vehicles\reverse.paa";
};

_return