params ["_player", "_target"];

_player distance _target < 2 &&
{ (
    [_target, "calling"] call GRAD_landline_fnc_callGetStatus || 
    [_target, "waiting"] call GRAD_landline_fnc_callGetStatus || 
    [_target, "busy"] call GRAD_landline_fnc_callGetStatus ||
    [_target, "ending"] call GRAD_landline_fnc_callGetStatus
) }