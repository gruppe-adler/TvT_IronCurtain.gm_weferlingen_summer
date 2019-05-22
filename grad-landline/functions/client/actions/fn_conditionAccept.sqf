params ["_player", "_target"];

_player distance _target < 2 &&
{ [_target, "ringing"] call GRAD_landline_fnc_callGetStatus &&
(!(player getVariable ['GRAD_landline_isCalling', false])) }