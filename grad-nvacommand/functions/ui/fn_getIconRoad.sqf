params ["_group"];

private _return = _group getVariable ["GRAD_nvaCommand_forceFollowRoad", false];

if (_return) then {
    _return = "grad-nvacommand\vehicles\road_active.paa";
} else {
    _return = "grad-nvacommand\vehicles\road2.paa";
};

_return