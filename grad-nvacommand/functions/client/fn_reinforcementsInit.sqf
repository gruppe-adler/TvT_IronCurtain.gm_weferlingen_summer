if (isNil "IC_reinforcements") then {
    private _allClasses = "true" configClasses (missionConfigFile >> "CfgReinforcements"); 

    private _reinforcements = [];
    { 
        // private _categoryConfigName = [(_x >> "displayName"), "text", ""] call CBA_fnc_getConfigEntry;
        private _className = _x;
        _reinforcements pushBackUnique _className;
    } forEach _allClasses;

    missionNamespace setVariable ["IC_reinforcements",_reinforcements, true];
};

GRAD_reinforcements_fnc_getMaxCount = {
    params ["_configName"];
    
    [(_x >> "maxCount"), "number", 0] call CBA_fnc_getConfigEntry
};

GRAD_reinforcements_fnc_getClassName = {
    params ["_config"];
    
    configName _x
};

GRAD_reinforcements_fnc_getCrew = {
    params ["_config"];
    
    [(_x >> "crew"), "array", []] call CBA_fnc_getConfigEntry
};

GRAD_reinforcements_fnc_getCargo = {
    params ["_config"];
    
    [(_x >> "cargo"), "array", []] call CBA_fnc_getConfigEntry
};

GRAD_reinforcements_fnc_getDisplayName = {
    params ["_config"];
    
    [(_x >> "displayName"), "string", configName _config] call CBA_fnc_getConfigEntry
};