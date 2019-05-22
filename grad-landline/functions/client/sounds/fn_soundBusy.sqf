params ["_callerPhoneObject"];

[{
    params ["_args", "_handle"];
    _args params ["_callerPhoneObject"];

    if (!([_callerPhoneObject, "busy"] call GRAD_landline_fnc_callGetStatus) ||
        !(player getVariable ['GRAD_landline_isCalling', false])) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler; 
    };

    [selectRandom ["GRAD_landline_phoneBusy1", "GRAD_landline_phoneBusy2", "GRAD_landline_phoneBusy3"]] call BIS_fnc_playSound;
    systemChat "busybeep";

}, 0.5, [_callerPhoneObject]] call CBA_fnc_addPerFrameHandler;