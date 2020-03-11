player setVariable ["GRAD_nvacommand_isCommander", true];

[] spawn {
    waitUntil {
      time > 5
    };

    [[player, player, (findDisplay 12), (findDisplay 12 displayCtrl 51)]] call GRAD_nvaCommand_fnc_initMap;
    [] remoteExec ["GRAD_nvaCommand_fnc_hideFakeRunners", 2];
};

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