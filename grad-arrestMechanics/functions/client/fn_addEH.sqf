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
["isNotSwimming"] call ace_common_fnc_removeCanInteractWithCondition;

// restore default behaviour and add own condition
["isNotSwimming", {
    !((_this select 0) getVariable ["grad_arrestMechanics_isHandCuffed",false]) || {!(_this call ace_common_fnc_isSwimming)}
}] call ace_common_fnc_addCanInteractWithCondition;

// ["isNotHandcuffed", {!((_this select 0) getVariable ["ace_captives_isHandcuffed",false])}] call ace_common_fnc_addCanInteractWithCondition;


/*
[219, [false, false, false], {
    if (
        {(vehicle ACE_player) == ACE_player} || 
        {(ACE_player getVariable ["ace_captives_isHandcuffed", false])}
    )then {
        [] call FUNC(interactionEH);
    };  
},"keydown", nil, false] call CBA_fnc_addKeyHandler;
*/