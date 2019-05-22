if (!isServer) exitWith {};



["ace_tripflareTriggered", {
        
        params ["_flare", "_position"];

        [_position, "flare"] call GRAD_nvacommand_fnc_raiseAlarm;
        deleteVehicle _flare;

}] call CBA_fnc_addEventHandler;


["ace_wireCuttingStarted", {
        
        params ["_unit", "_fence"];

        private _position = position _fence;

        [_position, "fence", _unit] call GRAD_nvacommand_fnc_raiseAlarm;

}] call CBA_fnc_addEventHandler;