params ["_towerNearest"];

private _warnLamp = _towerNearest getVariable ["GRAD_nvaCommand_towerWarnLamp", objNull];
// systemChat ("warn Lamp: " + str _warnLamp);

private _warnLight = "Reflector_Cone_01_wide_red_F" createVehicle [0,0,0];
// systemChat ("warn Lamp: " + str _warnLight);

_warnLight setPos getPosVisual _warnLamp;
_warnLight attachTo [_towerNearest];

private _y = if (typeOf _towerNearest == "land_gm_tower_bt_6_fuest_80") then { 180 } else { 90 };
private _p = 0; private _r = 00; 
    _warnLight setVectorDirAndUp [ 
        [ sin _y * cos _p,cos _y * cos _p,sin _p], 
        [ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D 
    ];
// systemChat str _warnLight;

_towerNearest setVariable ["GRAD_nvacommand_towerWarnLampLight", _warnLight, true];


/*
private _searchLight = _towerNearest getVariable ["GRAD_nvaCommand_towerSearchLight", objNull];

private _unit = _towerNearest findNearestEnemy _towerNearest;
if (isNull _unit) then {
    _unit =  nearestObject [_position, "Man"];
};

if (!isNull _towerNearest && !(_towerNearest getVariable ["GRAD_nvacommand_towerAlarm", false])) then {
    _searchLight reveal [_unit,4];
    _searchLight doWatch _unit;
    _searchLight doTarget _unit;
};
*/