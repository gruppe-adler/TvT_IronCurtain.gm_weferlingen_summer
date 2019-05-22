params ["_object"];

[{
    params ["_args", "_handle"];
    _args params ["_object"];

    if ([_object, "idle"] call GRAD_landline_fnc_callGetStatus) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler; 
    };

    [selectRandom ["GRAD_landline_phoneBusy1", "GRAD_landline_phoneBusy2", "GRAD_landline_phoneBusy3"]] call BIS_fnc_playSound;
    systemChat "ending beep";

}, 0.5, [_object]] call CBA_fnc_addPerFrameHandler;