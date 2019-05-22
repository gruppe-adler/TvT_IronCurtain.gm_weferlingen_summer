player setVariable ["GRAD_nvacommand_isCommander", true];

/*
addMissionEventHandler ["Map", {
    params ["_mapIsOpened", "_mapIsForced"];

    if (player getVariable ["forceClose", false] && !_mapIsOpened) exitWith {
        player setVariable ["forceClose", false];
        openMap false;
    };

    if (_mapIsOpened) then {
       
        systemChat "isOpened";
        player setVariable ["forceClose", true];
        openMap false;

        [{
            [player, player] call GRAD_aiCommand_fnc_openCommandWindow;
        }, [], 0.1] call CBA_fnc_waitAndExecute;
        
    } else {
        systemChat "isClosed";
        openMap false;
    };
}];
*/