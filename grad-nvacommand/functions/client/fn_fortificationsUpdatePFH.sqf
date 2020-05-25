grad_nvacommand_fortifications_updatePFH = [{
    params ["_args", "_handle"];
    _args params ["_unit", "_fort", "_surfaceNormal", "_magneticTo"];

    _pos =  screentoworld getMousePosition;
    _pos set [2, 0]; // (_unit getVariable ["grad_fortifications_currentHeight",0])];

    private _nearestObjects = [];
    if (_magneticTo != "") then {
       _nearestObjects = _pos nearObjects [_magneticTo, sizeOf _magneticTo];
       _nearestObjects = [_nearestObjects, [], { _pos distance _x }, "ASCEND"] call BIS_fnc_sortBy;
       // systemChat str _nearestObjects;
       _unit setVariable ["grad_fortifications_isSnapped",1];
    };

    if (count _nearestObjects > 0) then {
        _nearestObjects params ["_objMagnetic"];
        _fort setPosATL getPosATL _objMagnetic;
        _fort setDir getDir _objMagnetic;
        // systemChat str _objMagnetic;

        _unit setVariable ["grad_fortifications_isSnapped",2];
    } else {
        _dir = (getDir _unit);
        _currentDirection = _unit getVariable ["grad_fortifications_currentDirection",_dir];
        _fort setPos _pos;
        _fort setDir _currentDirection;

        // [_unit, _fort, _surfaceNormal] call grad_fortifications_fnc_setUp;
    };

    // locking camera in place for placement when no key is pressed
    if (!(_unit getVariable ["grad_fortifications_keyDown",false]) ||
        _unit getVariable ["grad_fortifications_ctrlDown",false] ||
        _unit getVariable ["grad_fortifications_altDown",false] ||
        _unit getVariable ["grad_fortifications_shiftDown",false]) then {
        curatorCamera setPos (missionNamespace getVariable ["grad_nvacommand_curatorCamPos", getPos curatorCamera]);
    } else {
        missionNamespace setVariable ["grad_nvacommand_curatorCamPos", getPos curatorCamera];
    };

},0,_this] call CBA_fnc_addPerFrameHandler;


grad_nvacommand_fortifications_updatePFH
