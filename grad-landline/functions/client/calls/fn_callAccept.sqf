/*
    
    callAccept is always executed by player2
    [cursorObject] call GRAD_landline_fnc_callAccept;
*/

params ["_object"];

private _storedData = [_object] call GRAD_landline_fnc_callGetInfo;

_storedData params [
    ["_phone1", objNull], 
    ["_phone2", objNull], 
    ["_number1", "undefined"], 
    ["_number2", "undefined"], 
    ["_player1", objNull], 
    ["_player2", objNull]
];

_phone2 = _object;
_player2 = player;

[_phone1, _phone2, _player1, _player2] call GRAD_landline_fnc_callSaveInfo;


[player, _phone2] call GRAD_landline_fnc_callSetOwner;

systemChat format ["callAccept - %1 received call from %2", _number2, _number1];

// activate tfar with own phone
[_phone2, _number1 + _number2] call GRAD_landline_fnc_callPluginActivate;

[_phone2, "calling"] call GRAD_landline_fnc_callSetStatus;
[_phone1, "calling"] call GRAD_landline_fnc_callSetStatus;

// register call
[_phone1, _phone2] remoteExec ["GRAD_landline_fnc_callRegister", 2];