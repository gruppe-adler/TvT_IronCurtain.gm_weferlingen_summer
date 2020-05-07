/*
   [vehicle player] execVM "grad-vopo\functions\client\fn_detectSpikes.sqf";
*/

addMissionEventHandler ["Draw3D", {
    private _car = vehicle player;
    private _wheelLeft = _car selectionPosition "wheel_1_1_axis";
    private _wheelRight = _car selectionPosition "wheel_1_2_axis";
    private _wheelLeftB = _car selectionPosition "wheel_2_1_axis";
    private _wheelRightB = _car selectionPosition "wheel_2_2_axis";

    private _wheelRightPosition = _car modelToWorld _wheelRight;
    _wheelRightPosition params ["__wheelRightPositionX", "__wheelRightPositionY"];
    private _wheelLeftPosition = _car modelToWorld _wheelLeft;
    _wheelLeftPosition params ["__wheelLeftPositionX", "__wheelLeftPositionY"];
    private _wheelRightPositionB = _car modelToWorld _wheelRightB;
    _wheelRightPositionB params ["__wheelRightPositionXB", "__wheelRightPositionYB"];
    private _wheelLeftPositionB = _car modelToWorld _wheelLeftB;
    _wheelLeftPositionB params ["__wheelLeftPositionXB", "__wheelLeftPositionYB"];

    private _startPositionLeft = [__wheelLeftPositionX,__wheelLeftPositionY,0];
    private _startPositionRight = [__wheelRightPositionX,__wheelRightPositionY,0];
    private _endPositionLeft = [__wheelLeftPositionX,__wheelLeftPositionY,1];
    private _endPositionRight = [__wheelRightPositionX,__wheelRightPositionY,1];

    private _startPositionLeftB = [__wheelLeftPositionXB,__wheelLeftPositionYB,0];
    private _startPositionRightB = [__wheelRightPositionXB,__wheelRightPositionYB,0];
    private _endPositionLeftB = [__wheelLeftPositionXB,__wheelLeftPositionYB,1];
    private _endPositionRightB = [__wheelRightPositionXB,__wheelRightPositionYB,1];

    private _leftWheelObjects = (lineIntersectsObjs [AGLtoASL _startPositionLeft, AGLtoASL _endPositionLeft, _car, objNull, false, 32]);
    private _rightWeelObjects = (lineIntersectsObjs [AGLtoASL _startPositionRight, AGLtoASL _endPositionRight, _car, objNull, false, 32]);
    private _leftWheelObjectsB = (lineIntersectsObjs [AGLtoASL _startPositionLeftB, AGLtoASL _endPositionLeftB, _car, objNull, false, 32]);
    private _rightWeelObjectsB = (lineIntersectsObjs [AGLtoASL _startPositionRightB, AGLtoASL _endPositionRightB, _car, objNull, false, 32]);


   
    if (count _leftWheelObjects > 0) then {
        _leftWheelObjects params ["_possibleTrap"];
        
        // systemChat str typeOf _possibleTrap;
        if (typeOf _possibleTrap == "Land_TankTracks_01_short_F") then {
            _car setHit ["hitpoint_wheel_1_1", 1];
            // [_possibleTrap, _car] call ace_concertina_wire_fnc_vehicleDamage;
        };
    };

    if (count _rightWheelObjects > 0) then {
        _rightWheelObjects params ["_possibleTrap"];
        
        // systemChat str typeOf _possibleTrap;
        if (typeOf _possibleTrap == "Land_TankTracks_01_short_F") then {
            _car setHit ["hitpoint_wheel_1_2", 1];
            // [_possibleTrap, _car] call ace_concertina_wire_fnc_vehicleDamage;
        };
    };

    if (count _leftWheelObjectsB > 0) then {
        _leftWheelObjectsB params ["_possibleTrap"];
        
        // systemChat str typeOf _possibleTrap;
        if (typeOf _possibleTrap == "Land_TankTracks_01_short_F") then {
            _car setHit ["hitpoint_wheel_2_1", 1];
            // [_possibleTrap, _car] call ace_concertina_wire_fnc_vehicleDamage;
        };
    };

    if (count _rightWeelObjectsB > 0) then {
        _rightWheelObjectsB params ["_possibleTrap"];
        
        // systemChat str typeOf _possibleTrap;
        if (typeOf _possibleTrap == "Land_TankTracks_01_short_F") then {
            _car setHit ["hitpoint_wheel_2_2", 1];
            // [_possibleTrap, _car] call ace_concertina_wire_fnc_vehicleDamage;
        };
    };
    
    
    drawLine3D [_startPositionRight, _endPositionRight, [0,1,1,1]];
    drawLine3D [_startPositionLeft, _endPositionLeft, [1,0,1,1]];
    drawLine3D [_startPositionRightB, _endPositionRightB, [0,1,1,1]];
    drawLine3D [_startPositionLeftB, _endPositionLeftB, [1,0,1,1]];
}];



/*
private _handle = [{
    params ["_args", "_handle"];
    _args params ["_car"];

    private _wheelLeft = _car selectionPosition "wheel_1_1_axis";
    private _wheelRight = _car selectionPosition "wheel_1_2_axis";
    private _wheelLeftB = _car selectionPosition "wheel_2_1_axis";
    private _wheelRightB = _car selectionPosition "wheel_2_2_axis";

    private _wheelRightPosition = _car modelToWorld _wheelRight;
    _wheelRightPosition params ["__wheelRightPositionX", "__wheelRightPositionY", "__wheelRightPositionZ"];
    private _wheelLeftPosition = _car modelToWorld _wheelLeft;
    _wheelLeftPosition params ["__wheelLeftPositionX", "__wheelLeftPositionY", "__wheelLeftPositionZ"];
    private _wheelRightPositionB = _car modelToWorld _wheelRightB;
    _wheelRightPositionB params ["__wheelRightPositionXB", "__wheelRightPositionYB", "__wheelRightPositionZB"];
    private _wheelLeftPositionB = _car modelToWorld _wheelLeftB;
    _wheelLeftPositionB params ["__wheelLeftPositionXB", "__wheelLeftPositionYB", "__wheelLeftPositionZB"];

    private _startPositionLeft = [__wheelLeftPositionX,__wheelLeftPositionY,0];
    private _startPositionRight = [__wheelRightPositionX,__wheelRightPositionY,0];
    private _endPositionLeft = [__wheelLeftPositionX,__wheelLeftPositionY,1];
    private _endPositionRight = [__wheelRightPositionX,__wheelRightPositionY,1];

    private _startPositionLeftB = [__wheelLeftPositionXB,__wheelLeftPositionYB,0];
    private _startPositionRightB = [__wheelRightPositionXB,__wheelRightPositionYB,0];
    private _endPositionLeftB = [__wheelLeftPositionXB,__wheelLeftPositionYB,1];
    private _endPositionRightB = [__wheelRightPositionXB,__wheelRightPositionYB,1];

    private _leftWheelObjects = (lineIntersectsObjs [AGLtoASL _startPositionLeft, AGLtoASL _endPositionLeft, _car, objNull, false, 32]);
    private _rightWeelObjects = (lineIntersectsObjs [AGLtoASL _startPositionRight, AGLtoASL _endPositionRight, _car, objNull, false, 32]);
    private _leftWheelObjectsB = (lineIntersectsObjs [AGLtoASL _startPositionLeftB, AGLtoASL _endPositionLeftB, _car, objNull, false, 32]);
    private _rightWeelObjectsB = (lineIntersectsObjs [AGLtoASL _startPositionRightB, AGLtoASL _endPositionRightB, _car, objNull, false, 32]);

    if (count _leftWheelObjects > 0) then {
        _leftWheelObjects params ["_possibleTrap"];
        
        // systemChat str typeOf _possibleTrap;
        if (typeOf _possibleTrap == "Land_TankTracks_01_short_F") then {
            _car setHit ["hitpoint_wheel_1_1", 1];
        };
    };

    if (count _rightWheelObjects > 0) then {
        _rightWheelObjects params ["_possibleTrap"];
        
        // systemChat str typeOf _possibleTrap;
        if (typeOf _possibleTrap == "Land_TankTracks_01_short_F") then {
            _car setHit ["hitpoint_wheel_1_2", 1];
        };
    };

    if (count _leftWheelObjectsB > 0) then {
        _leftWheelObjectsB params ["_possibleTrap"];
        
        // systemChat str typeOf _possibleTrap;
        if (typeOf _possibleTrap == "Land_TankTracks_01_short_F") then {
            _car setHit ["hitpoint_wheel_2_1", 1];
        };
    };

    if (count _rightWeelObjectsB > 0) then {
        _rightWheelObjectsB params ["_possibleTrap"];
        
        // systemChat str typeOf _possibleTrap;
        if (typeOf _possibleTrap == "Land_TankTracks_01_short_F") then {
            _car setHit ["hitpoint_wheel_2_2", 1];
        };
    };
    
    drawLine3D [_startPositionRight, _endPositionRight, [0,1,1,1]];
    drawLine3D [_startPositionLeft, _endPositionLeft, [1,0,1,1]];
    drawLine3D [_startPositionRightB, _endPositionRightB, [0,1,1,1]];
    drawLine3D [_startPositionLeftB, _endPositionLeftB, [1,0,1,1]];

}, 0, [_car]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_handle"];

    [_handle] call CBA_fnc_removePerFrameHandler;

}, [_handle], 60] call CBA_fnc_waitAndExecute;
*/