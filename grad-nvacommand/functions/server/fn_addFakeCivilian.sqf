params ["_searchLight"];

private _position = [[[position _searchLight, 40]],[[position _searchLight, 30]]] call BIS_fnc_randomPos;

private _searchLightConeCarrier = createAgent ["C_Man_1", _position, [], 10, "NONE"];
_searchLightConeCarrier disableAI "ALL";
_searchLightConeCarrier setBehaviour "CARELESS";
_searchLightConeCarrier enableDynamicSimulation true;
_searchLightConeCarrier hideObjectGlobal true;
_searchLightConeCarrier allowDamage false;

_searchLightConeCarrier