"BIS_zoneRestriction" setMarkerAlpha 0;


private _passportNumber = [11,
    ["S","T","A","S","I",true,true,true,true,true,true, true]
] call grad_passport_fnc_generateSerial;

player setVariable ["grad_passport_serial", _passportNumber, true];
player setVariable ["grad_passport_passportRsc","DDR_Reisepass"];



[trg_populationZone] call GRAD_civs_fnc_addPopulationZone;