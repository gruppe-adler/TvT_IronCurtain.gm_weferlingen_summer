params ["_index", "_position"];

private _searchLights = nearestObjects [_position, ["gm_gc_bgs_searchlight_01"], 1500];

private _identifier = format ["GRAD_nvacommand_alertIndex_%1", _index];
private _isRunning = missionNamespace setVariable [_identifier, true];

// get nearest searchlights

if (count _searchLights > 0) then {
    _searchLights params ["_searchlightNearest", "_searchlight2ndNearest"];

    private _unit = _searchlightNearest findNearestEnemy _searchlightNearest;
    if (isNull _unit) then {
        _unit =  nearestObject [_position, "Man"];
    };

    if (!isNull _searchlightNearest && !(_searchlightNearest getVariable ["GRAD_nvacommand_alert", false])) then {
        _searchlightNearest reveal [_unit,4];
        _searchlightNearest doWatch _unit;
        _searchlightNearest doTarget _unit;
        _searchlightNearest setVariable ["GRAD_nvacommand_alert", true];
    };

    if (!isNull _searchlight2ndNearest && !(_searchlight2ndNearest getVariable ["GRAD_nvacommand_alert", false])) then {
        _searchlight2ndNearest reveal [_unit,4];
        _searchlight2ndNearest doWatch _unit;
        _searchlight2ndNearest doTarget _unit;
        _searchlight2ndNearest setVariable ["GRAD_nvacommand_alert", true];
    };


    [{
        params ["_args", "_handle"];
        _args params ["_index", "_searchlightNearest", "_searchlight2ndNearest"];

        private _identifier = format ["GRAD_nvacommand_alertIndex_%1", _index];
        private _isRunning = missionNamespace getVariable [_identifier, false];

        if (!_isRunning) exitWith {
            [_handle] call CBA_fnc_removePerFramehandler;
            _searchlightNearest setVariable ["GRAD_nvacommand_alert", false];
            _searchlight2ndNearest setVariable ["GRAD_nvacommand_alert", false];
           
        };
        
        [_searchlightNearest, ["GRAD_nvacommand_alarm", 1000]] remoteExec ["say3D", [0,-2] select isDedicated];
        [_searchlight2ndNearest, ["GRAD_nvacommand_alarm", 1000]] remoteExec ["say3D", [0,-2] select isDedicated];    
        
    }, 3.5, [_index, _searchlightNearest, _searchlight2ndNearest]] call CBA_fnc_addPerFramehandler;
};