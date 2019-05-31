params ["_position"];

private _nearestTowers = nearestObjects [_position, ["land_gm_tower_bt_11_60", "land_gm_tower_bt_6_fuest_80"], 1500];


// get nearest searchlights

if (count _nearestTowers > 0) then {
    _nearestTowers params ["_towerNearest"];

    // systemChat str _towerNearest;

    private _warnLamp = _towerNearest getVariable ["GRAD_nvacommand_towerWarnLamp", objNull];
    private _warnLight = "Reflector_Cone_01_wide_red_F" createVehicle [0,0,0];

    /*
    private _warnLampPosition = if (typeOf _towerNearest == "land_gm_tower_bt_11_60") then { 
        [0.742188,0.0195313,-4.7576]
    } else { 
        [-0.268555,2.23633,-2.76051]
    };
    */
    // ([-2.73352,-2.13086,0.319336])
    _warnLight attachTo [_warnLamp, [0,0,0]];

    private _y = 0; private _p = 0; private _r = 00; 
        _warnLight setVectorDirAndUp [ 
            [ sin _y * cos _p,cos _y * cos _p,sin _p], 
            [ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D 
        ];
    // systemChat str _warnLight;

    _towerNearest setVariable ["GRAD_nvacommand_towerWarnLampLight", _warnLight, true];

    private _searchLight = _towerNearest getVariable ["GRAD_nvaCommand_towerSearchLight", objNull];

    private _unit = _towerNearest findNearestEnemy _towerNearest;
    if (isNull _unit) then {
        _unit =  nearestObject [_position, "Man"];
    };

    if (!isNull _towerNearest && !(_towerNearest getVariable ["GRAD_nvacommand_alarm", false])) then {
        _searchLight reveal [_unit,4];
        _searchLight doWatch _unit;
        _searchLight doTarget _unit;
        _searchLight setVariable ["GRAD_nvacommand_alarm", true];
    };


    [{
        params ["_args", "_handle"];
        _args params ["_towerNearest"];

        private _isRunning = _towerNearest getVariable ["GRAD_nvacommand_alarm", false];
        if (!_isRunning) exitWith {
            [_handle] call CBA_fnc_removePerFramehandler;
        };
        
        [_towerNearest, ["GRAD_nvacommand_alarm", 500]] remoteExec ["say3D", [0,-2] select isDedicated];
        
    }, 3.5, [_towerNearest]] call CBA_fnc_addPerFramehandler;
};