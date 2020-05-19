params ["_oldGroup"];

systemChat "actionFleeReplace";

// if param is group leader
if (_oldGroup isEqualType objNull) then {
    _oldGroup = group _oldGroup;
};

private _reinforcements = missionNamespace getVariable ["IC_reinforcements", []];
private _path = [_reinforcements, _oldGroup] call BIS_fnc_findNestedElement;
_path params ["_selector", "_index"];

private _config = _oldGroup getVariable ["configCache", grpNull];
private _vehicle = _oldGroup getVariable ["assignedVehicle", objNull];

{
    deleteVehicle _x;
} forEach units _oldGroup + [_vehicle];

deleteGroup _oldGroup;

private _group = [_config] call GRAD_reinforcements_fnc_spawnGroup;
(_reinforcements select _selector) set [_index, _group]; // replace former unit with new one

missionNamespace setVariable ["IC_reinforcements", _reinforcements, true];

[
    "GRAD_reinforcements_GUIEvent", 
    [_group,"respawned"]
] call CBA_fnc_globalEvent;