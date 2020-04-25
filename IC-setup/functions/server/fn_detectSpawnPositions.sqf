if (!isServer) exitWith {};

private _spawnPositionsEast = [];

{
    _spawnPositionsEast pushBack (getPos _x);
} foreach (ic_spawnpositions call bis_fnc_moduleTriggers);

missionNamespace setVariable ["IC_spawnPositionsEast", _spawnPositionsEast, true];