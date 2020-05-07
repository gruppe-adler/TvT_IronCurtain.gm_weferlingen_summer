/*

    test call
    [position player, getDir player] execVM "grad-vopo\functions\server\fn_createSpikes.sqf";

*/

params ["_pos", "_dir", ["_wallZOffset",-0.8]];

private _spikes = [];

private _visualSpikesType = "Land_TankTracks_01_short_F";
private _detectionHelperType = "Land_InvisibleBarrier_F";
private _visualCount = 3;

for "_i" from 0 to _visualCount do {
    _pos params ["_xPos", "_yPos", "_zPos"];

    private _newPos = _pos getPos [1.1*_i, _dir];
    _newPos set [2,-0.1];

    private _track = createVehicle [_visualSpikesType, _newPos, [], 0, "CAN_COLLIDE"];
    _track setDir _dir;
    _track enableSimulationGlobal false;
    _track enableSimulation false;

    _spikes pushBackUnique _track;
};

private _positionMiddle = _pos getPos [1.1*_visualCount/2, _dir];
_positionMiddle set [2,_wallZOffset];
private _detectionHelper = createVehicle [_detectionHelperType, _positionMiddle, [], 0, "CAN_COLLIDE"];
_detectionHelper setDir _dir+90;

[_detectionHelper,0,[0,0,0],[1, 0, 0, 1]] execVM "grad-vopo\functions\server\fn_drawBoundingBox.sqf";

_detectionHelper addEventHandler ["EpeContactStart", {
    params ["_object1", "_object2", "_selection1", "_selection2", "_force"];

    // systemChat "hitStart";

    if (_object2 isKindOf "Car_F") then {

        // systemChat "isCar";

        private _boundingBox = boundingBox _object1;
        _boundingBox params ["_p1", "_p2"];
        _p1 params ["_x1","_y1", "_z1"];
        _p2 params ["_x2","_y2", "_z2"];
        private _maxWidth = abs (_x2 - _x1);
        private _maxLength = abs (_y1 - _y2);
        private _maxHeight = abs (_z1 - _z2);

        private _triggerArea = [getPos _object1, _maxLength/2, _maxWidth/2, getDir _object1, true];

        private _wheelPositions = [_object2] call ace_repair_fnc_getWheelHitPointsWithSelections;
        _wheelPositions params ["_hitpoints", "_hitpointSelections"];

        // [["hitlfwheel","hitrfwheel","hitlf2wheel","hitrf2wheel"],
        // ["hitpoint_wheel_1_1","hitpoint_wheel_1_2","hitpoint_wheel_2_1","hitpoint_wheel_2_2"]]
        private _hits = [];
        {   
            private _selectionPart = _x;
            private _position = _object2 modelToWorld (_object2 selectionPosition _selectionPart);
            
            if (_position inArea _triggerArea) then {
                systemChat format ["_selection hit: %1", _x];
                _hits pushBackUnique [_forEachIndex, _position, _selectionPart];
            };
          
        } forEach _hitpointSelections;

        {   
            _x params ["_index", "_position", "_selectionPart"];
              _object2 setHitPointDamage [_hitPoints select _index, 1, false];
            // _object2 setHitIndex [_index, 1, false];
            // _object2 setHit [_selection, 1];
            ["GRAD_vopo_sparkSmall", [_position]] call CBA_fnc_globalEvent;

            for "_i" from 0 to 30 do {
                [{
                    params ["_object2", "_selectionPart"];
                    private _position = _object2 modelToWorld (_object2 selectionPosition _selectionPart);
                    ["GRAD_vopo_sparkSmall", [asltoagl _position]] call CBA_fnc_globalEvent;
                }, [_object2, _selectionPart], random 3] call CBA_fnc_waitAndExecute; 
            };
        } forEach _hits;

        
        
    };
}];




/*
{
    _x addEventHandler ["EpeContactStart", {
        params ["_object1", "_object2", "_selection1", "_selection2", "_force"];

        systemchat (typeOf _object2);
        if (_object2 isKindOf "Car_F") then {
             systemchat "epecontact is car";
            _object2 setHit ["wheel_1_1_steering", 1];
            _object2 setHit ["wheel_1_2_steering", 1];
        };
    }];
} forEach _spikes;

_spikes
*/

//// 
/*
[] spawn {
    for "_i" from 0 to 1000 do {
        private _wheelLeft = vehicle player selectionPosition "wheel_1_1_damper";
        private _wheelRight = vehicle player selectionPosition "wheel_1_2_damper";

        private _wheelRightPosition = vehicle player modelToWorld _wheelRight;
        _wheelRightPosition params ["__wheelRightPositionX", "__wheelRightPositionY", "__wheelRightPositionZ"];

        private _wheelLeftPosition = vehicle player modelToWorld _wheelLeft;
        _wheelLeftPosition params ["__wheelLeftPositionX", "__wheelLeftPositionY", "__wheelLeftPositionZ"];

        private _endPositionLeft = [__wheelLeftPositionX,__wheelLeftPositionY,__wheelLeftPositionZ-1];
        private _endPositionRight = [__wheelRightPositionX,__wheelRightPositionY,__wheelRightPositionZ-1];

        private _leftWheelObjects = (lineIntersectsObjs [_wheelLeftPosition, _endPositionLeft, vehicle player, player]);
        if (count _leftWheelObjects > 0) then {
            systemChat str _leftWheelObjects;
        };
        
        drawLine3D [_wheelRightPosition, _endPositionRight, [0,1,1,1]];
        drawLine3D [_wheelLeftPosition, _endPositionLeft, [1,0,1,1]];

        sleep 0.01;
    };
};














private _car = vehicle player;

[{
    params ["_args", "_handle]; 
    _args params ["_car"];

    private _wheelLeft = _car selectionPosition "wheel_1_1_axis";
    private _wheelRight = _car selectionPosition "wheel_1_2_axis";

    private _wheelRightPosition = _car modelToWorld _wheelRight;
    _wheelRightPosition params ["__wheelRightPositionX", "__wheelRightPositionY", "__wheelRightPositionZ"];

    private _wheelLeftPosition = _car modelToWorld _wheelLeft;
    _wheelLeftPosition params ["__wheelLeftPositionX", "__wheelLeftPositionY", "__wheelLeftPositionZ"];

    private _endPositionLeft = [__wheelLeftPositionX,__wheelLeftPositionY,__wheelLeftPositionZ-1];
    private _endPositionRight = [__wheelRightPositionX,__wheelRightPositionY,__wheelRightPositionZ-1];

    systemChat str (lineIntersectsWith [_wheelRightPosition,_endPositionRight,objNull,_car,false]);
    systemChat str (lineIntersectsWith [_wheelLeftPosition,_endPositionLeft,objNull,_car,false]);
    

    drawLine3D [_wheelRightPosition, _endPositionRight, [0,1,1,1]];
    drawLine3D [_wheelLeftPosition, _endPositionLeft, [1,0,1,1]];
    
}, 0, [_car]] call CBA_fnc_addPerFrameHandler;




*/

