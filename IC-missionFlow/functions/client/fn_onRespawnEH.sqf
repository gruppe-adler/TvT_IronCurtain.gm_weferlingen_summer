params ["_unit"];

_unit addMPEventHandler ["MPRespawn", {
    params ["_unit", "_corpse"];

    [_unit] call IC_missionFlow_fnc_setRespawnPosition; // move to right spot
    [_unit] call IC_missionFlow_fnc_onRespawnEquip; // loadout
    [_unit] call IC_missionFlow_fnc_createRespawnVehicle; // your drive man
    [_unit] call IC_missionFlow_fnc_createRespawnInfo; // fade in and show info
    [_unit] call IC_missionFlow_fnc_assignIdentity; // assign name and face
}];