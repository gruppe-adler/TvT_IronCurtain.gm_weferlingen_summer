params ["_unit"];

_unit addEventHandler ["Respawn", {
    params ["_unit", "_corpse"];

    [_unit] call IC_missionFlow_fnc_onRespawnEquip;
}];