/*

    test call
    [position player, getDir player] execVM "grad-vopo\functions\server\fn_createSpikes.sqf";

*/

params ["_pos", "_dir"];

private _spikes = [];

for "_i" from 0 to 3 do {
    _pos params ["_xPos", "_yPos", "_zPos"];

    private _newPos = _pos getPos [1.1*_i, _dir];
    private _track = createVehicle ["Land_TankTracks_01_short_F", _newPos, [], 0, "CAN_COLLIDE"];
    _track setDir _dir;

    _spikes pushBackUnique _track;
};

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

        private _leftWheelObjects = (lineIntersectsWith [_wheelLeftPosition, _endPositionLeft, vehicle player, player]);
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

