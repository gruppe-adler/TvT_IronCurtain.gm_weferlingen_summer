params ["_button"];

_button ctrlEnable false; 

if ([player, player] call GRAD_landline_fnc_conditionAccept) exitWith {
    [player] call GRAD_landline_fnc_callAccept;
};

if ([player, player] call GRAD_landline_fnc_conditionEnd) exitWith {
    private _state = player getVariable ['GRAD_landline_phoneStatus', 'idle']; 
    [player, _state] call GRAD_landline_fnc_callEnd;
};
