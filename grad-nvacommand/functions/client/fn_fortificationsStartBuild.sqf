params ["_buildTruck", "_type", ["_magneticTo", ""]];

// systemChat "bla";
private _boundingBoxSize = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "boundingBoxSize"),"number",1] call CBA_fnc_getConfigEntry;
private _boundingBoxOffset = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "boundingBoxOffset"),"array",[0,0,0]] call CBA_fnc_getConfigEntry;
private _minHeight = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "minHeight"),"number",-0.8] call CBA_fnc_getConfigEntry;
private _maxHeight = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "maxHeight"),"number",3] call CBA_fnc_getConfigEntry;
private _canFloat = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "canFloat"),"number",0] call CBA_fnc_getConfigEntry) == 1;
private _canCollide = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _type >> "canCollide"),"number",0] call CBA_fnc_getConfigEntry) == 1;
private _canPlaceOnRoad = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _type >> "canPlaceOnRoad"),"number",1] call CBA_fnc_getConfigEntry) == 1;
private _surfaceNormal = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _type >> "surfaceNormal"),"number",1] call CBA_fnc_getConfigEntry) == 1;
private _surfaceNormalForced = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _type >> "surfaceNormalForced"),"number",0] call CBA_fnc_getConfigEntry) == 1;

private _builder = player;

private _fort = _type createVehicleLocal [0,0,0];
private _size = [_type] call grad_fortifications_fnc_getObjectSize;
_fort allowDamage false;
_fort enableSimulation false;
_fort disableCollisionWith _builder;

_builder setVariable ["GRAD_nvacommand_activeBuildTruck", _buildTruck];
_builder setVariable ["grad_fortifications_currentFort", _fort];

[_builder,_fort,_surfaceNormal, _magneticTo] execVM "grad-nvacommand\functions\client\fn_fortificationsUpdatePFH.sqf";

private _boundingLines = [
    _fort,
    _boundingBoxSize,
    _boundingBoxOffset
] call grad_fortifications_fnc_getBoundingLines;

private _visualLines = [_fort] call grad_fortifications_fnc_getVisualLines;
private _groundLines = [_fort] call grad_fortifications_fnc_getGroundLines;

private _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;

// magnetic building is without collision check
[
    _builder,
    _visualLines,
    _boundingLines,
    _groundLines,
    _fort,
    _canFloat,
    _canCollide,
    _canPlaceOnRoad,
    _moduleRoot,
    _surfaceNormal,
    _surfaceNormalForced
] call grad_nvacommand_fnc_fortificationsCollisionPFH;


[] call grad_nvacommand_fnc_fortificationsMouseEH;
[] call grad_fortifications_fnc_addKeyEHs;

["Place", "Cancel"] call ace_interaction_fnc_showMouseHint;
