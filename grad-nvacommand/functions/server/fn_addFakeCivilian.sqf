params ["_searchLight"];


private _searchLightConeCarrier = createAgent ["C_Man_1", position _searchLight, [], 50, "NONE"];
_searchLightConeCarrier disableAI "FSM";
_searchLightConeCarrier setBehaviour "CARELESS";
_searchLightConeCarrier forceSpeed (_searchLightConeCarrier getSpeed "FAST");
_searchLightConeCarrier enableDynamicSimulation true;

_searchLightConeCarrier