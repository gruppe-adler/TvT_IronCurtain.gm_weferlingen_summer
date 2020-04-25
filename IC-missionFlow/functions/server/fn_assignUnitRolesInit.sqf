/*

    assigns unit roles initially

*/

call IC_missionFlow_fnc_detectSpawnPositions;

{
    private _unit = _x;

    // assign role to everyone excluding those that are already assigned (nva zeus etc)
    if (_unit getVariable ["IC_unitRole", "none" ] == "none") then {

        private _role = selectRandomWeighted IC_ROLES;
        _unit setVariable ["IC_unitRole", _role, true];

        [_unit] call IC_missionFlow_fnc_setRespawnPosition; // move to right spot
        [_unit] call IC_missionFlow_fnc_onRespawnEquip; // loadout
        [_unit] call IC_missionFlow_fnc_createRespawnVehicle; // your drive man
        [_unit] call IC_missionFlow_fnc_createRespawnInfo; // fade in and show info
        [_unit] call IC_missionFlow_fnc_assignIdentity; // assign name and face
    };

} forEach playableUnits + switchableUnits;
