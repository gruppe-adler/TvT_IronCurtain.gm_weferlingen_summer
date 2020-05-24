grad_nvacommand_fortifications_mousewheelEH = uiNamespace getVariable ["grad_nvacommand_buildInterface", displayNull] displayAddEventHandler ["MouseZChanged", {
    params ["_control","_wheelChange"];

    _builder = ACE_player;
    _accelFactor = if (_builder getVariable ["grad_fortifications_altDown",false]) then {5} else {30};

    _currentDir = _builder getVariable ["grad_fortifications_currentDirection",0];
    _newDirection = _currentDir + _wheelChange*_accelFactor;
    _builder setVariable ["grad_fortifications_currentDirection", _newDirection];

    switch (true) do {

        case (_builder getVariable ["grad_fortifications_ctrlDown",false]): {
            _currentHeight = _builder getVariable ["grad_fortifications_currentHeight",0];
            _minHeight = _builder getVariable ["grad_fortifications_minHeight",-0.8];
            _maxHeight = _builder getVariable ["grad_fortifications_maxHeight",3];
            _newHeight = ((_currentHeight + (_wheelChange/45)*_accelFactor) max _minHeight) min _maxHeight;
            _builder setVariable ["grad_fortifications_currentHeight",_newHeight];
        };

        default {
            _currentDistance = _builder getVariable ["grad_fortifications_currentDistance",4],
            _size = _builder getVariable ["grad_fortifications_currentSize",1];
            _newDistance = ((_currentDistance + (_wheelChange/20)*_accelFactor) max (((_size*2)^(1/2)) max 2)) min ((_size*6)^(1/2));
            _builder setVariable ["grad_fortifications_currentDistance",_newDistance];
        };
    };

    true
}];

grad_nvacommand_fortifications_mousebuttonEH = uiNamespace getVariable ["grad_nvacommand_buildInterface", displayNull] displayAddEventHandler ["MouseButtonUp", {
    params ["_control","_button"];

    if !(_button in [0,1]) exitWith {};

    if (_button == 0) then {
        private _buildTruck = player getVariable ["GRAD_nvacommand_activeBuildTruck", objNull];

        [_buildTruck] execVM "grad-nvacommand\functions\client\fn_fortificationsPlaced.sqf";
    };

    if (_button == 1) then {
        [] call grad_nvacommand_fnc_fortificationsPlacementCancel;
    };

    true
}];

grad_fortifications_fireOverride = ACE_player addAction ["", {true}, "", 0, false, true, "DefaultAction", "true"];