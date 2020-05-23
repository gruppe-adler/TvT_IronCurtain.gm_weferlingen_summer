grad_fortifications_mousewheelEH = (findDisplay 312) displayAddEventHandler ["MouseZChanged", {
    params ["_control","_wheelChange"];

    _builder = ACE_player;
    _accelFactor = if (_builder getVariable ["grad_fortifications_altDown",false]) then {3} else {1};

    _currentDir = _builder getVariable ["grad_fortifications_currentDirection",0];
    _newDirection = _currentDir + _wheelChange*_accelFactor;
    _builder setVariable ["grad_fortifications_currentDirection", _newDirection];

    false
}];

grad_fortifications_mousebuttonEH = (findDisplay 312) displayAddEventHandler ["MouseButtonUp", {
    params ["_control","_button"];

    if !(_button in [0,1]) exitWith {};

    if (_button == 0) then {
        private _buildTruck = player getVariable ["GRAD_nvacommand_activeBuildTruck", objNull];

        [_buildTruck] execVM "grad-nvacommand\functions\client\fn_fortificationsPlaced.sqf";
    };

    if (_button == 1) then {
        [] call grad_fortifications_fnc_cancelPlacement;
    };

    false
}];

grad_fortifications_fireOverride = ACE_player addAction ["", {true}, "", 0, false, true, "DefaultAction", "true"];