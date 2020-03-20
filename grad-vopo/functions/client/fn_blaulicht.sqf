/*
    optimized for GM trabant

    not used
*/

/*
params ["_car"];

// handle CBA events
if (isServer) then {

    private _sirenEH = [{
        params ["_args", "_handle"];
        _args params ["_car"];

        if (!(_car getVariable ["IC_vopo_motorsirene", false])) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        private _nearEntities =  _car nearEntities [["Man", "Car", "Motorcycle"], 400];

        {
            private _cansee = [_car, "VIEW"] checkVisibility [visiblePositionASL _x, visiblePositionASL _car] > 0.5;
            
            if (_cansee && !(_x getVariable ["GRAD_vopo_blaulichtAffected", false])) then {
                // ["GRAD_civs_customActivity_start", [_x], _x] call CBA_fnc_targetEvent;
                ["grad_civs_panicking", [_x], [_x]] call CBA_fnc_targetEvent;
                _x setVariable ["GRAD_vopo_blaulichtAffected", true];
                // [_x] call GRAD_vopo_fnc_blaulichtReaction;
            } else {
                // ["GRAD_civs_customActivity_end", [_x], _x] call CBA_fnc_targetEvent;
                ["grad_civs_panicking_end", [_x], [_x]] call CBA_fnc_targetEvent;
                _x setVariable ["GRAD_vopo_blaulichtAffected", false];
            };

        } forEach _nearEntities;
        
    }, 2, [_car]] call CBA_fnc_addPerFrameHandler;

};

fnc_SetPitchBankYaw = { 
    private ["_object","_rotations","_aroundX","_aroundY","_aroundZ","_dirX","_dirY",
    "_dirZ","_upX","_upY","_upZ","_dir","_up","_dirXTemp","_upXTemp"];
    _object = _this select 0; 
    _rotations = _this select 1; 
    _aroundX = _rotations select 0; 
    _aroundY = _rotations select 1; 
    _aroundZ = (360 - (_rotations select 2)) - 360; 
    _dirX = 0; 
    _dirY = 1; 
    _dirZ = 0; 
    _upX = 0; 
    _upY = 0; 
    _upZ = 1; 
    if (_aroundX != 0) then { 
        _dirY = cos _aroundX; 
        _dirZ = sin _aroundX; 
        _upY = -sin _aroundX; 
        _upZ = cos _aroundX; 
    }; 
    if (_aroundY != 0) then { 
        _dirX = _dirZ * sin _aroundY; 
        _dirZ = _dirZ * cos _aroundY; 
        _upX = _upZ * sin _aroundY; 
        _upZ = _upZ * cos _aroundY; 
    }; 
    if (_aroundZ != 0) then { 
        _dirXTemp = _dirX; 
        _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ); 
        _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);        
        _upXTemp = _upX; 
        _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ); 
        _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ);       
    }; 
    _dir = [_dirX,_dirY,_dirZ]; 
    _up = [_upX,_upY,_upZ]; 
    _object setVectorDirAndUp [_dir,_up]; 
};  


private _positionLeft = [0.4,-0.2,0.15];
private _positionRight = [-0.6,-0.2,0.15];





private _reflectorLeftBlue = "Reflector_Cone_01_narrow_blue_F" createVehicleLocal [0,0,0];
_reflectorLeftBlue attachTo [_car, _positionLeft];

private _reflectorRightBlue = "Reflector_Cone_01_narrow_blue_F" createVehicleLocal [0,0,0];
_reflectorRightBlue attachTo [_car, _positionRight];

private _reflectorLeftBlue2 = "Reflector_Cone_01_wide_blue_F" createVehicleLocal [0,0,0];
_reflectorLeftBlue attachTo [_car, _positionLeft];

private _reflectorRightBlue2 = "Reflector_Cone_01_wide_blue_F" createVehicleLocal [0,0,0];
_reflectorRightBlue attachTo [_car, _positionRight];


private _reflectorLeftWhite = "Reflector_Cone_01_wide_blue_F" createVehicleLocal [0,0,0];
_reflectorLeftWhite attachTo [_car, _positionLeft];

private _reflectorRightWhite = "Reflector_Cone_01_wide_blue_F" createVehicleLocal [0,0,0];
_reflectorRightWhite attachTo [_car, _positionRight];


private _positionLeft = [0.385,-0.255,0.14];
private _positionRight = [-0.585,-0.255,0.14];


private _lightLeft = "#lightpoint" createVehicleLocal _positionLeft;
_lightLeft setLightFlareSize 0.5;
_lightLeft setLightFlareMaxDistance 300;
_lightLeft setLightUseFlare true;
_lightLeft setLightAmbient [0, 0, 0];
_lightLeft setLightIntensity 400; 
_lightLeft setLightColor [1,1,1];
_lightLeft lightAttachObject [_car, _positionLeft];

private _lightRight = "#lightpoint" createVehicleLocal _positionRight;
_lightRight setLightFlareSize 0.5;
_lightRight setLightFlareMaxDistance 300;
_lightRight setLightUseFlare true;
_lightRight setLightAmbient [0, 0, 0];
_lightRight setLightIntensity 400; 
_lightRight setLightColor [1,1,1];
_lightRight lightAttachObject [_car, _positionRight];


private _lightIntensityLeft = 900;
private _lightIntensityRight = 30;



private _soundSource = createSoundSource ["pressTon7512Sound", position _car, [], 0]; 
_soundSource attachTo [_car];

[{
    params ["_args", "_handle"];
    _args params [
        "_car",
        "_reflectorLeftBlue",
        "_reflectorRightBlue",
        "_reflectorRightWhite",
        "_reflectorLeftWhite",
        "_reflectorLeftBlue2",
        "_reflectorRightBlue2", 
        "_lightLeft", 
        "_lightRight"
    ];


    if (!(_car getVariable ["IC_vopo_blaulicht", false]) || isNull _car || !alive _car) exitWith {
    
        {
          deleteVehicle _x;
        } forEach [
            _reflectorLeftBlue,
            _reflectorRightBlue,
            _reflectorRightWhite,
            _reflectorLeftWhite,
            _reflectorLeftBlue2,
            _reflectorRightBlue2,
            _lightLeft,
            _lightRight
        ];
        
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _rotationLeft = _car getVariable ["rotationLeft", 0];
    private _rotationRight = _car getVariable ["rotationRight", 90];
    _rotationLeft = _rotationLeft + 6;
    _rotationRight = _rotationRight + 6;
    _car setVariable ["rotationLeft", _rotationLeft];
    _car setVariable ["rotationRight", _rotationRight];

    
    _lightIntensityLeft = sin _rotationLeft * 400;
    _lightIntensityRight = sin _rotationRight * 400;

    _lightLeft setLightIntensity _lightIntensityLeft; 
    _lightRight setLightIntensity _lightIntensityRight; 
    

   
    [_reflectorLeftBlue,[0,0,_rotationLeft+270]] call fnc_SetPitchBankYaw;
    [_reflectorRightBlue,[0,0,_rotationRight+270]] call fnc_SetPitchBankYaw;
    
    [_reflectorLeftBlue2,[0,0,_rotationLeft+90]] call fnc_SetPitchBankYaw;
    [_reflectorRightBlue2,[0,0,_rotationRight+90]] call fnc_SetPitchBankYaw;

    [_reflectorLeftWhite,[0,0,_rotationLeft]] call fnc_SetPitchBankYaw;
    [_reflectorRightWhite,[0,0,_rotationRight]] call fnc_SetPitchBankYaw;

}, 0, [
    _car, 
    _reflectorLeftBlue, 
    _reflectorRightBlue, 
    _reflectorRightWhite, 
    _reflectorLeftWhite, 
    _reflectorLeftBlue2, 
    _reflectorRightBlue2, 
    _lightLeft, 
    _lightRight]
] call CBA_fnc_addPerFrameHandler;

*/