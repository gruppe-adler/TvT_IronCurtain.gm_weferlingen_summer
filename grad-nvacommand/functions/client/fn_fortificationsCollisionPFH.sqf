grad_nvacommand_fortifications_checkCollisionPFH = [{
    params ["_args", "_handle"];
    _args params ["_builder","_visualLines","_boundingLines","_groundLines","_fort","_canFloat","_canCollide","_canPlaceOnRoad","_moduleRoot","_surfaceNormal","_surfaceNormalForced"];

    if (isNull _fort) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

    private _visualLinesWorld = [_visualLines,_fort] call grad_fortifications_fnc_linesToWorld;
    private _boundingLinesWorld = [_boundingLines,_fort] call grad_fortifications_fnc_linesToWorld;
    private _groundLinesWorld = [_groundLines,_fort] call grad_fortifications_fnc_linesToWorld;

    private _isOnGround = if (_canFloat) then {true} else {[_groundLinesWorld,_fort] call grad_fortifications_fnc_isOnGround};
    private _isOnRoad = if (_canPlaceOnRoad) then {false} else {isOnRoad _fort};
    private _customCondition = [_fort,_builder] call compile ([missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> typeOf _fort >> "condition","text","true"] call CBA_fnc_getConfigEntry);

    private _notSnappable = _builder getVariable ["grad_fortifications_isSnapped",0] == 0;
    private _notSnapped = _builder getVariable ["grad_fortifications_isSnapped",0] == 1;

    //check bounding box
    _builder setVariable ["grad_fortifications_isColliding",false];
    _builder setVariable ["grad_fortifications_isOnGround",_isOnGround];
    _builder setVariable ["grad_fortifications_isOnRoad",_isOnRoad];
    _builder setVariable ["grad_fortifications_isCustomCondition",_customCondition];

    {
        _isColliding = if (_canCollide) then {false} else {[_x,_fort] call grad_fortifications_fnc_isColliding};

        // systemChat str _isColliding;

        _color = [0,1,0,1];
        if (_isColliding && _notSnappable || _notSnapped) then {
            _color = [1,0,0,1];
            _builder setVariable ["grad_fortifications_isColliding",true];
        };

        if (!_isOnGround || _isOnRoad || !_customCondition) then {
            _color = [1,1,0,1];
        };

        if (missionNamespace getVariable ["grad_fortifications_collisionDebugMode",false]) then {
            drawLine3D [_x select 0, _x select 1, _color];
        } else {
            _visualLine = _visualLinesWorld select _forEachIndex;
            drawLine3D [_visualLine select 0, _visualLine select 1, _color];
        };
    } forEach _boundingLinesWorld;


    //draw ground lines if debug mode
    if (missionNamespace getVariable ["grad_fortifications_collisionDebugMode",false]) then {
        _color = if (!_isOnGround) then {[1,1,0,1]} else {[0,1,0,1]};
        {
            drawLine3D [_x select 0,_x select 1,_color];
            false
        } count _groundLinesWorld;
    };


    //update hint
    switch (true) do {
        case (!_customCondition): {
            ["CUSTOM",_moduleRoot,_surfaceNormal,_surfaceNormalForced,_builder,typeOf _fort] call grad_fortifications_fnc_updateHint;
        };
        case (!_isOnGround): {
            ["FLOATING",_moduleRoot,_surfaceNormal,_surfaceNormalForced,_builder] call grad_fortifications_fnc_updateHint;
        };
        case (_isOnRoad): {
            ["ONROAD",_moduleRoot,_surfaceNormal,_surfaceNormalForced,_builder] call grad_fortifications_fnc_updateHint;
        };
        case (_builder getVariable ["grad_fortifications_isColliding",true]): {
            ["COLLIDING",_moduleRoot,_surfaceNormal,_surfaceNormalForced,_builder] call grad_fortifications_fnc_updateHint;
        };
        default {
            ["CANPLACE",_moduleRoot,_surfaceNormal,_surfaceNormalForced,_builder] call grad_fortifications_fnc_updateHint;
        };
    };
},0,_this] call CBA_fnc_addPerFrameHandler;

grad_nvacommand_fortifications_checkCollisionPFH