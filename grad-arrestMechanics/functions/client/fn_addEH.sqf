["ace_interactMenuOpened", {_this call grad_arrestMechanics_fnc_interactEH}] call CBA_fnc_addEventHandler;

["ace_captiveStatusChanged", {
    params ["_unit", "_state"];
    
    if (_state) then {
        _unit setVariable ["grad_arrestMechanics_isHandCuffed", true];
    } else {
        _unit setVariable ["grad_arrestMechanics_isHandCuffed", false];
    };
}] call CBA_fnc_addEventHandler;

["isNotHandcuffed"] call ace_common_fnc_removeCanInteractWithCondition;