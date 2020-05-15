if (!isServer) exitWith {};

private _reinforcements = [];
private _allClasses = "true" configClasses (missionConfigFile >> "CfgReinforcements"); 
  
{ 
    // private _categoryConfigName = [(_x >> "displayName"), "text", ""] call CBA_fnc_getConfigEntry;
    private _className = _x;
    _reinforcements pushBackUnique _className;
} forEach _allClasses;

GRAD_reinforcements_fnc_refreshGUI = {
    ["grad-nvacommand\functions\client\fn_reinforcementsGUI.sqf"] remoteExec ["execVM"]; // todo after debug: make call 
}; 


GRAD_reinforcements_fnc_getMaxCount = {
    params ["_configName"];
    
    [(_x >> "maxCount"), "number", 0] call CBA_fnc_getConfigEntry
};

GRAD_reinforcements_fnc_getClassName = {
    params ["_config"];
    
    configName _config
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


    {   
        _x addEventHandler ["Fired", {
            params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

            (group _unit) setVariable ["IC_isFiring", true, true];
            call GRAD_reinforcements_fnc_refreshGUI;
            
            [{
                params ["_unit"];
                
                (group _unit) setVariable ["IC_isFiring", false, true];
                call GRAD_reinforcements_fnc_refreshGUI;

            },5,[]] call CBA_fnc_waitAndExecute;
        }];

        _x addEventHandler ["Dammaged", {
            params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];

            (group _unit) setVariable ["IC_isDamaged", true, true];
            call GRAD_reinforcements_fnc_refreshGUI;
            
            [{
                params ["_unit"];
                
                (group _unit) setVariable ["IC_isDamaged", false, true];
                call GRAD_reinforcements_fnc_refreshGUI;

            },5,[]] call CBA_fnc_waitAndExecute;
        }];

        _x addEventHandler ["Killed", {
            call GRAD_reinforcements_fnc_refreshGUI;
        }];

    } forEach units _group;

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
        private _count = [_x] call GRAD_reinforcements_fnc_getMaxCount;

        for "_i" from 0 to _count do {

            private _group = [_x] call GRAD_reinforcements_fnc_spawnGroup;
            
            _groupsOfAKind pushBackUnique _group;

            systemChat str _group;

            sleep 1;
        };

        IC_reinforcements pushBackUnique _groupsOfAKind;
        missionNamespace setVariable ["IC_reinforcements", IC_reinforcements, true];

    } forEach _reinforcements;

    [{
        params ["_args", "_handle"];

        private _reinforcements = missionNamespace getVariable ["IC_reinforcements", []];

        {
            private _groupsOfAKind = _x;

            {
                private _vehicle = _x getVariable ["assignedVehicle", objNull];
                private _completelyDead = {alive _x} count units _x < 1;

                if (_completelyDead) then {
                    private _path = [_reinforcements, _x] call BIS_fnc_findNestedElement;
                    _path params ["_selector", "_index"];

                    private _config = _x getVariable ["configCache", grpNull];
                    private _group = [_config] call GRAD_reinforcements_fnc_spawnGroup;

                    call GRAD_reinforcements_fnc_refreshGUI;
                    (_reinforcements select _selector) set [_index, _x]; // replace former unit with new one

                    // broadcast after delay, so client can gracefully show unit died
                    [{
                        params ["_reinforcements"];
                        missionNamespace setVariable ["IC_reinforcements", _reinforcements, true];

                    }, [_reinforcements], 10] call CBA_fnc_waitAndExecute;
                };
            } forEach _groupsOfAKind;
            
        } forEach _reinforcements;

    }, 1, []] call CBA_fnc_addPerFrameHandler;
};