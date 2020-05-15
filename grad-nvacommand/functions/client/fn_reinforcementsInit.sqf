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

GRAD_reinforcements_fnc_getPic = {
    params ["_config"];
    
    [(_x >> "pic"), "string", ""] call CBA_fnc_getConfigEntry
};


GRAD_reinforcements_fnc_spawnGroup = {
    params ["_config"];

    private _className = [_config] call GRAD_reinforcements_fnc_getClassName;
    private _crew = [_config] call GRAD_reinforcements_fnc_getCrew;
    private _cargo = [_config] call GRAD_reinforcements_fnc_getCargo;
    private _count = [_config] call GRAD_reinforcements_fnc_getMaxCount;
    private _name = [_config] call GRAD_reinforcements_fnc_getDisplayName;
    private _pic = [_config] call GRAD_reinforcements_fnc_getPic;

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
    _group setVariable ["pic", _pic, true];
    _group setVariable ["assignedVehicle", _vehicle, true];
    _group setVariable ["configCache", _config, true];

    {
        private _curator = _x;
        _curator addCuratorEditableObjects [units _group, true];

    } forEach allCurators;

    _group
};

// create and manage reinforcements

[_reinforcements] spawn {
    params ["_reinforcements"];

    IC_reinforcements = [];

    {
        private _groupsOfAKind = [];

        for "_i" from 0 to _count do {

            [_x] call GRAD_reinforcements_fnc_spawnGroup;
            
            _groupsOfAKind pushBackUnique _group;

            sleep 1;
        };

        IC_reinforcements pushBackUnique _groupsOfAKind;
        missionNamespace setVariable ["IC_reinforcements", IC_reinforcements, true];

    } forEach _reinforcements;
};

[{
    params ["_args", "_handle"];

    private _reinforcements = missionNamespace getVariable ["IC_reinforcements", []];

    {
        private _vehicle = _x getVariable ["assignedVehicle", objNull];
        private _completelyDead = {alive _x} count units _x < 1;

        if (_completelyDead) exitWith {
            _reinforcements deleteAt (_reinforcements find _x);
            missionNamespace setVariable ["IC_reinforcements", _reinforcements, true];

            private _config = _x getVariable ["configCache", grpNull];
            [_config] call GRAD_reinforcements_fnc_spawnGroup;
        };
    } forEach _reinforcements;

}, 1, []] call CBA_fnc_addPerFrameHandler;