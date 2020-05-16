grad_nvacommand_fortifications_updatePFH = [{
    params ["_args", "_handle"];
    _args params ["_unit", "_fort", "_surfaceNormal"];

    _pos = screentoworld getMousePosition;
    _pos set [2, (_unit getVariable ["grad_fortifications_currentHeight",0]) + (getPosATL _unit select 2)];

    _fort setPos _pos;

    _currentDirection = _unit getVariable ["grad_fortifications_currentDirection",0];
    _fort setDir _dir;

    [_unit, _fort, _surfaceNormal] call grad_fortifications_fnc_setUp;

},0,_this] call CBA_fnc_addPerFrameHandler;


grad_nvacommand_fortifications_updatePFH