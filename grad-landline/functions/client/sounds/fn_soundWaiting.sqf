params ["_callerPhoneObject"];

[{
    params ["_args", "_handle"];
    _args params ["_callerPhoneObject"];

    if (!([_callerPhoneObject, "waiting"] call GRAD_landline_fnc_callGetStatus) ||
        !(player getVariable ['GRAD_landline_isCalling', false])) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler; 
    };

    [selectRandom ["GRAD_landline_phoneBeep1", "GRAD_landline_phoneBeep2"]] call BIS_fnc_playSound;
    systemChat "beep";

}, 3, [_callerPhoneObject]] call CBA_fnc_addPerFrameHandler;