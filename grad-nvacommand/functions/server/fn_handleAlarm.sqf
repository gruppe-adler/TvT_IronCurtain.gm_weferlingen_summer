params ["_index", "_position"];

private _nearestTowers = nearestObjects [_position, ["land_gm_tower_bt_11_60", "land_gm_tower_bt_6_fuest_80"], 1500];

private _identifier = format ["GRAD_nvacommand_alertIndex_%1", _index];
private _isRunning = missionNamespace setVariable [_identifier, true];


// get nearest searchlights

if (count _nearestTowers > 0) then {
    _nearestTowers params ["_towerNearest"];

    private _warnLamp = _towerNearest getVariable ["GRAD_nvacommand_towerWarnLamp", objNull];
    private _warnLight = "Reflector_Cone_01_wide_red_F" createVehicle [0,0,0];
    _warnLight setPos (getPos _warnLamp);
    _towerNearest setVariable ["GRAD_nvacommand_towerWarnLampLight", _warnLight, true];

    private _searchLight = _towerNearest getVariable ["GRAD_nvaCommand_towerSearchLight", objNull];

    private _unit = _towerNearest findNearestEnemy _towerNearest;
    if (isNull _unit) then {
        _unit =  nearestObject [_position, "Man"];
    };

    if (!isNull _towerNearest && !(_towerNearest getVariable ["GRAD_nvacommand_alert", false])) then {
        _searchLight reveal [_unit,4];
        _searchLight doWatch _unit;
        _searchLight doTarget _unit;
        _searchLight setVariable ["GRAD_nvacommand_alert", true];
    };


    [{
        params ["_args", "_handle"];
        _args params ["_index", "_towerNearest"];

        private _identifier = format ["GRAD_nvacommand_alertIndex_%1", _index];
        private _isRunning = missionNamespace getVariable [_identifier, false];

        if (!_isRunning) exitWith {
            [_handle] call CBA_fnc_removePerFramehandler;
            _towerNearest setVariable ["GRAD_nvacommand_alert", false];
           
        };
        
        [_towerNearest, ["GRAD_nvacommand_alarm", 1000]] remoteExec ["say3D", [0,-2] select isDedicated];
        
    }, 3.5, [_index, _towerNearest]] call CBA_fnc_addPerFramehandler;
};