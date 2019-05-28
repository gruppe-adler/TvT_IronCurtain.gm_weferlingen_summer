// execVM "GRAD-nvaCommand\functions\server\fn_createTower.sqf";
// only for testing positioning of searchlight
private _cached = missionNamespace getVariable ["Fuck", objNull];
private _cachedSL = missionNamespace getVariable ["FuckSL", objNull];
if (!isNull _cached) then { deleteVehicle _cached; };
if (!isNull _cachedSL) then { deleteVehicle _cachedSL; };

private _position = [0,0,0];
private _newTower = "land_gm_tower_bt_11_60" createVehicle _position;
private _dir = getDir _newTower;
_newTower animateSource ['searchlight_source',1,true];
_newTower setVectorUp [0,0,1];

private _searchLight = "gm_gc_bgs_searchlight_01" createVehicle [0,0,0];
// [-0.615234,0.277344,-6.94839]
private _searchLightPosition = _newTower modelToWorld [0,-0.1, 6.94839]; // [0,-0.1,6.795];
_searchLight setPos _searchLightPosition;
_searchLight addWeaponTurret ["fakeweapon", [0]];


 missionNamespace setVariable ["Fuck", _newTower];
 missionNamespace setVariable ["FuckSL", _searchLight];

//_searchLights pushBackUnique _searchLight;

/*
private _groupSearchLight = createGroup east;
private _searchLightGuy = _groupSearchLight createUnit ["gm_gc_bgs_rifleman_mpikm72_80_str", [0,0,0], [], 0, "CAN_COLLIDE"];
_searchLightGuy moveInAny _searchLight;
_searchLightGuy action ["SearchLightOn", _searchLight];
[_searchLight] call GRAD_nvaCommand_fnc_searchLightScanRandom;
*/