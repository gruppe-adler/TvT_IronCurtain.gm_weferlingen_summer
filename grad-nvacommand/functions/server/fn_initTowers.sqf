// private _towers = nearestTerrainObjects [[worldSize/2, worldSize/2], ["watchtowerclassname"], worldSize/2];

// (allMissionObjects "Land_Hlaska")

private _towers = 
    ([worldSize/2, worldSize/2] nearObjects ["land_gm_tower_bt_11_60", worldsize/2]) +
    ([worldSize/2, worldSize/2] nearObjects ["land_gm_tower_bt_6_fuest_80", worldsize/2]);

private _newTowers = [];
private _searchLights = [];

{
	private _tower = _x;

    private _dir = getDir _x;
    private _position = getPos _x;
    private _type = typeOf _tower;

    hideObjectGlobal _tower;
    _tower allowDamage false;
   

    private _newTower = _type createVehicle [0,0,0];
    _newTower setPos _position;
    _newTower setDir _dir;
    _newTower animateSource ['searchlight_source',1,true];

	_newTower setVariable ["GRAD_nvaCommand_towerIsManned", 4, true];
	_newTower setVariable ["GRAD_nvaCommand_towerID", _forEachIndex, true];

    // searchlight pos
    if (_type == "land_gm_tower_bt_11_60") then { _position set [2,13.6]; } else { _position set [2,8.4]; };

    private _searchLight = "gm_gc_bgs_searchlight_01" createVehicle [0,0,0];
    _searchLight setPos _position;
    _searchLight attachTo [_newTower];
    _searchLights pushBackUnique _searchLight;

    _newTower setVariable ["GRAD_nvaCommand_towerSearchLight", _searchLight, true];
    _newTowers pushBackUnique _newTower;

} forEach _towers;



// add towers to all curators to edit/access
{
	private _curator = _x;
	_curator addCuratorEditableObjects [_newTowers, true];
	
	{ 
        private _towerID = _x getVariable ["GRAD_nvaCommand_towerID", -1];
	  [ _curator, ["", [1,1,1,1], position _x, 1, 1, 45, format ["BT-11 - %1", _towerID], 1, 0.05, "TahomaB"], false ] call BIS_fnc_addCuratorIcon;
	} forEach _newTowers;

     // make curator selectable
    [_x] call GRAD_nvaCommand_fnc_curatorTowerHandler;
    [] call GRAD_nvaCommand_fnc_curatorInterfaceDetection;

} forEach allCurators;

missionNamespace setVariable ["GRAD_nvaCommand_towerList", _newTowers, true];
missionNamespace setVariable ["GRAD_nvaCommand_searchLightList", _searchLights, true];