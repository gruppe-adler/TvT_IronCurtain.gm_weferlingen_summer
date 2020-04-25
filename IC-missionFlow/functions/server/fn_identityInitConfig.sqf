diag_log "identityInitConfig running...";

if (isNil "IC_facesAvailable") then {missionNamespace setVariable ["IC_facesAvailable",[missionConfigFile >> "cfgCustomIdentities","customFaces",[]] call BIS_fnc_returnConfigEntry]};
if (isNil "IC_firstNamesAvailable") then {missionNamespace setVariable ["IC_firstNamesAvailable",[missionConfigFile >> "cfgCustomIdentities","firstNames",[]] call BIS_fnc_returnConfigEntry]};
if (isNil "IC_lastNamesAvailable") then {missionNamespace setVariable ["IC_lastNamesAvailable",[missionConfigFile >> "cfgCustomIdentities","lastNames",[]] call BIS_fnc_returnConfigEntry]};

if (isNil "IC_customFaceAllowSame") then {missionNamespace setVariable ["IC_customFaceAllowSame",([missionConfigFile >> "cfgGradCivs","customFaceAllowSame",0] call BIS_fnc_returnConfigEntry) == 1]};
if (isNil "IC_firstNameAllowSame") then {missionNamespace setVariable ["IC_firstNameAllowSame",([missionConfigFile >> "cfgGradCivs","firstNameAllowSame",0] call BIS_fnc_returnConfigEntry) == 1]};
if (isNil "IC_lastNameAllowSame") then {missionNamespace setVariable ["IC_lastNameAllowSame",([missionConfigFile >> "cfgGradCivs","lastNameAllowSame",0] call BIS_fnc_returnConfigEntry) == 1]};
