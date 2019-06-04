params ["_unit"];

_unit addEventHandler ["Respawn", {
    params ["_unit", "_corpse"];

    [_unit] call IC_missionFlow_fnc_setRespawnPosition; // move to right spot
    [_unit] call IC_missionFlow_fnc_onRespawnEquip; // loadout
    [_unit] call IC_missionFlow_fnc_createRespawnVehicle; // your drive man
    [_unit] call IC_missionFlow_fnc_createRespawnInfo; // fade in and show info
}];