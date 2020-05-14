if (!isServer) exitWith {};

private _reinforcements = [];
private _allClasses = "true" configClasses (missionConfigFile >> "CfgReinforcements"); 
  
{ 
    // private _categoryConfigName = [(_x >> "displayName"), "text", ""] call CBA_fnc_getConfigEntry;
    private _className = _x;
    _reinforcements pushBackUnique _className;
} forEach _allClasses;


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


// create and manage reinforcements

[_reinforcements] spawn {
    params ["_reinforcements"];

    IC_reinforcements = [];

    {
        private _className = [_x] call GRAD_reinforcements_fnc_getClassName;
        private _crew = [_x] call GRAD_reinforcements_fnc_getCrew;
        private _cargo = [_x] call GRAD_reinforcements_fnc_getCargo;
        private _count = [_x] call GRAD_reinforcements_fnc_getMaxCount;
        private _name = [_x] call GRAD_reinforcements_fnc_getDisplayName;

        private _groupsOfAKind = [];

        for "_i" from 0 to _count do {
            private _result = [
                (getMarkerPos "mrk_reinforcements_spawn") findEmptyPosition [0,300], 
                markerDir "mrk_reinforcements_spawn", 
                _className, 
                east
            ] call BIS_fnc_spawnVehicle;

            _result params ["_vehicle", "_crew", "_group"];

            {
                private _unit = _group createUnit [_x, [0,0,0], [], 0, "NONE"];

                _unit assignAsCargo _vehicle;
                _unit moveInCargo _vehicle;
            } forEach _cargo;

            _group setVariable ["displayName", _name, true];

            _groupsOfAKind pushBackUnique _group;

            {
                private _curator = _x;
                _curator addCuratorEditableObjects [units _group, true];

            } forEach allCurators;

            sleep 1;
        };

        IC_reinforcements pushBackUnique _groupsOfAKind;
        missionNamespace setVariable ["IC_reinforcements", IC_reinforcements, true];

    } forEach _reinforcements;
};