params ["_objects", "_locked"];

(_objects select 0) setVariable ['locked', _locked, true]; 
{
    _x setVariable ['locked', _locked, true]; 

    [_x, 1, [1,0] select _locked] call BIS_fnc_Door;

} forEach ((_objects select 0) getVariable ['GRAD_nvaCommand_gateControlGates', []]);