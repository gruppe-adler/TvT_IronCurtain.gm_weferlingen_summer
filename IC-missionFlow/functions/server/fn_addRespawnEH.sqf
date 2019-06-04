{
    [_x] remoteExec ["IC_missionFlow_fnc_onRespawnEH", _x, true];
} forEach playableUnits + switchableUnits;