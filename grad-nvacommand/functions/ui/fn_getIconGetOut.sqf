params ["_group"];

private _return = "";

if (_group getVariable ["GRAD_nvaCommand_actionGetOut", false]) then {
    _return = "grad-nvacommand\vehicles\getout_active.paa";
} else {
    _return = "grad-nvacommand\vehicles\getout.paa";
};

_return