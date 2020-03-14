params ["_tower"];

private _soundDummy = "Sign_Sphere10cm_Geometry_F" createVehicle [0,0,0];
_soundDummy attachTo [_tower, [0,0,0]];

private _soundHandle = [{
    params ["_args", "_handle"];
    _args params ["_soundDummy"];
    
    [_soundDummy, ["GRAD_nvacommand_alarm", 500]] remoteExec ["say3D", [0,-2] select isDedicated];
    
}, 3.5, [_soundDummy]] call CBA_fnc_addPerFramehandler;

_tower setVariable ["GRAD_nvacommand_soundDummy", _soundDummy, true];
_tower setVariable ["GRAD_nvacommand_soundHandle", _soundHandle, true];