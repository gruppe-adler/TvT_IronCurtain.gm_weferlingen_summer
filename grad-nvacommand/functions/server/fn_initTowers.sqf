// private _towers = nearestTerrainObjects [[worldSize/2, worldSize/2], ["watchtowerclassname"], worldSize/2];


private _towers = 
    ([worldSize/2, worldSize/2] nearObjects ["land_gm_tower_bt_11_60", worldsize/2]) +
    ([worldSize/2, worldSize/2] nearObjects ["land_gm_tower_bt_6_fuest_80", worldsize/2]);


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

    if (_type == "land_gm_tower_bt_11_60") then {
        _position set [2,13.6];
    } else {
        _position set [2,8.6];
    };

    private _searchlight = "gm_gc_bgs_searchlight_01" createVehicle [0,0,0];
    _searchlight setPos _position;


	_newTower setVariable ["GRAD_nvaCommand_towerIsManned", 4, true];
	_newTower setVariable ["GRAD_nvaCommand_towerID", _forEachIndex, true];
    _newTower setVariable ["GRAD_nvaCommand_towerSearchLight", _searchlight, true];

} forEach _towers;

// add towers to all curators to edit/access
{
	private _curator = _x;
	_curator addCuratorEditableObjects [_towers,true ];


	
	{
	  [ _curator, ["\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa", [1,1,1,1], position _x, 1, 1, 45, "Tower", 1, 0.05, "TahomaB"], false ] call BIS_fnc_addCuratorIcon;
	} forEach _towers;

} forEach allCurators;

missionNamespace setVariable ["GRAD_nvaCommand_towerList", _towers, true];