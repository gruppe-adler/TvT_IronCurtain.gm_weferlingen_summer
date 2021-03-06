params ["_buildTruck", "_type", ["_magneticTo", ""]];

private _buildInterface = (findDisplay 312) createDisplay "RscDisplayEmpty";
uiNamespace setVariable ["grad_nvacommand_buildInterface", _buildInterface];
cameraEffectEnableHUD true; // enable drawing of icons et al

// systemChat "bla";
private _boundingBoxSize = [(missionConfigFile >> "CfgNVAFortifications" >> "Fortifications" >> _type >> "boundingBoxSize"),"number",1] call CBA_fnc_getConfigEntry;
private _boundingBoxOffset = [(missionConfigFile >> "CfgNVAFortifications" >> "Fortifications" >> _type >> "boundingBoxOffset"),"array",[0,0,0]] call CBA_fnc_getConfigEntry;
private _minHeight = [(missionConfigFile >> "CfgNVAFortifications" >> "Fortifications" >> _type >> "minHeight"),"number",-0.8] call CBA_fnc_getConfigEntry;
private _maxHeight = [(missionConfigFile >> "CfgNVAFortifications" >> "Fortifications" >> _type >> "maxHeight"),"number",3] call CBA_fnc_getConfigEntry;
private _canFloat = ([(missionConfigFile >> "CfgNVAFortifications" >> "Fortifications" >> _type >> "canFloat"),"number",1] call CBA_fnc_getConfigEntry) == 1;
private _canCollide = ([(missionConfigFile >> "CfgNVAFortifications" >> "Fortifications"  >> _type >> "canCollide"),"number",0] call CBA_fnc_getConfigEntry) == 1;
private _canPlaceOnRoad = ([(missionConfigFile >> "CfgNVAFortifications" >> "Fortifications"  >> _type >> "canPlaceOnRoad"),"number",1] call CBA_fnc_getConfigEntry) == 1;
private _surfaceNormal = ([(missionConfigFile >> "CfgNVAFortifications" >> "Fortifications"  >> _type >> "surfaceNormal"),"number",1] call CBA_fnc_getConfigEntry) == 1;
private _surfaceNormalForced = ([(missionConfigFile >> "CfgNVAFortifications" >> "Fortifications"  >> _type >> "surfaceNormalForced"),"number",0] call CBA_fnc_getConfigEntry) == 1;

private _builder = ACE_player;

private _fort = _type createVehicleLocal [0,0,0];
private _size = [_type] call grad_fortifications_fnc_getObjectSize;
_fort allowDamage false;
_fort enableSimulation false;
_fort disableCollisionWith _builder;

_builder setVariable ["GRAD_nvacommand_activeBuildTruck", _buildTruck];
_builder setVariable ["grad_fortifications_currentFort", _fort];

missionNamespace setVariable ["grad_nvacommand_curatorCamPos", getPos curatorCamera];
[_builder,_fort,_surfaceNormal, _magneticTo] execVM "grad-nvacommand\functions\client\fn_fortificationsUpdatePFH.sqf";

private _boundingLines = [
    _fort,
    _boundingBoxSize,
    _boundingBoxOffset
] call grad_fortifications_fnc_getBoundingLines;

private _visualLines = [_fort] call grad_fortifications_fnc_getVisualLines;
private _groundLines = [_fort] call grad_fortifications_fnc_getGroundLines;

private _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;

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
[] call grad_nvacommand_fnc_fortificationsaddKeyEHs;

["Place", "Cancel"] call ace_interaction_fnc_showMouseHint;
