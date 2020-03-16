// private _towers = nearestTerrainObjects [[worldSize/2, worldSize/2], ["watchtowerclassname"], worldSize/2];

// (allMissionObjects "Land_Hlaska")

if (!isServer) exitWith {};

private _towers = 
    ([0, worldSize/2] nearObjects ["land_gm_tower_bt_11_60", worldsize]) +
    ([0, worldSize/2] nearObjects ["land_gm_tower_bt_6_fuest_80", worldsize]);

// sort to build a line
_towers = [_towers, [], { [worldSize/2, 0] distance _x }, "DESCEND"] call BIS_fnc_sortBy;
_towers resize 10;

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

    private _warnLamp = "Misc_Wall_lamp" createVehicle [0,0,0];
    private _warnLampPosition = if (_type == "land_gm_tower_bt_11_60") then { 
        [0.742188,0.0195313,-4.7576]
    } else { 
        [0.268555,-2.23633,2.76051]
    };

    _newTower setVariable ["GRAD_nvaCommand_towerWarnLamp", _warnLamp, true];
    _warnLamp attachTo [_newTower, _warnLampPosition];
    

    if (_type == "land_gm_tower_bt_11_60") then {
        private _y = -90; private _p = 0; private _r = 0; 
        _warnLamp setVectorDirAndUp [ 
            [ sin _y * cos _p,cos _y * cos _p,sin _p], 
            [ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D 
        ];
    };

    // searchlight pos
    private _searchLightPosition = if (_type == "land_gm_tower_bt_11_60") then { 
        (_newTower modelToWorld [0.615234,-0.277344,6.94839]) 
    } else { 
        (_newTower modelToWorld [-0.195313,0.713867,9.37675]) 
    };

    private _searchLight = "gm_gc_bgs_searchlight_01" createVehicle [0,0,0];
    _searchLight setDir _dir;
    _searchLight setPos _searchLightPosition;
    
    // _searchLight attachTo [_newTower];
    _searchLight addWeaponTurret ["fakeweapon", [0]];
    _searchLights pushBackUnique _searchLight;


    private _groupSearchLight = createVehicleCrew _searchLight;
    _groupSearchLight setCombatMode "BLUE";
    _groupSearchLight setBehaviourStrong "CARELESS";

    private _searchLightGuy = (units _groupSearchLight) select 0;
    _searchLightGuy action ["SearchLightOn", _searchLight];
    
    _searchLightGuy disableAI "ALL";
    _searchLightGuy enableAI "WeaponAim";

    private _searchLightTarget = "Sign_Sphere25cm_F" createVehicle _position;
    _newTower setVariable ["GRAD_nvaCommand_towerDummyTarget", _searchLightTarget, true];
    // _searchLight enableDynamicSimulation true;
    [_newTower, _searchLight] call GRAD_nvaCommand_fnc_searchLightScanRandom;

    _newTower setVariable ["GRAD_nvaCommand_towerSearchLight", _searchLight, true];
    _newTowers pushBackUnique _newTower;

    _newTower setVariable ["GRAD_nvaCommand_towerIsManned", 4, true];
    _newTower setVariable ["GRAD_nvaCommand_towerID", _forEachIndex, true];

} forEach _towers;


{
    [_x, position _x] call GRAD_nvaCommand_fnc_addTowerToSector;
} forEach _newTowers;


missionNamespace setVariable ["GRAD_nvaCommand_towerList", _newTowers, true];
missionNamespace setVariable ["GRAD_nvaCommand_searchLightList", _searchLights, true];

// make towers editable
{
    private _curator = _x;
    _curator addCuratorEditableObjects [_newTowers, true];

} forEach allCurators;

[] remoteExec ["GRAD_nvaCommand_fnc_initTowersLocal", [0,-2] select isDedicated, true];