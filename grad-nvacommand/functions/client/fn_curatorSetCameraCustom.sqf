/*
    Author: revide, pimped by nomisum

    Description:
    Move curator camera to a position and direction. But less buggy than BIS one.
    Has to be tun in scheduled environment. Finished when animation ends.

    Parameter(s):
        0 - positon, for supported types see BIS_fnc_position
        1: ARRAY - vector dir or target object / position
        2: NUMBER - commit time

    Returns:
    BOOL
*/

if (isnull curatorcamera) exitwith {false};

missionNamespace setVariable ["GRAD_nvaCommand_zeusCameraRunning", true];

params ["_origin", "_targetPos", ["_targetObj", objNull], ["_duration", 1]];

private _cam = "camera" camcreate getposatl curatorcamera;
_cam cameraeffect ["internal","back"];
_cam campreparefocus [-1,-1];
_cam camCommand "inertia on";
_cam campreparepos getposatl curatorcamera;
_cam campreparetarget screentoworld [0.5,0.5];
_cam camcommitprepared 0;

if (!isNull _targetObj) then {
    _cam campreparetarget _targetObj;
};
_cam campreparepos _targetPos;
_cam camcommitprepared _duration;

waituntil {camcommitted _cam};

curatorcamera setpos _targetPos;
curatorcamera setvectordir vectordir _cam;
curatorcamera setvectorup vectorup _cam;
curatorcamera camcommitprepared 0;

_cam cameraeffect ["terminate","back"];
camdestroy _cam;
curatorcamera cameraeffect ["internal","back"];
/*
[{
    params ["_args", "_handle"];
    _args params ["_targetObj"];
    
    
    private _distance = curatorCamera distance _targetObj;
    private _fov = (10 / (_distance)) min 0.7 max 0.01;
    curatorCamera camcommitprepared _duration;
    _camera campreparetarget _cameraTarget;
    _camera campreparefov _fov;

    private ["_camera","_cameraTarget","_refresh"];
    _camera =   _this param [0,objnull,[objnull]];
    _cameraTarget = _this param [1,objnull,[objnull,[]],[2,3]];
    _refresh =  _this param [2,1,[1]];

    if (_refresh < 0) then {
        _refresh = abs _refresh;
        while {!isnull _camera} do {
            CAMUPDATE
            _camera camcommitprepared _refresh;
            sleep _refresh;
        };
    } else {
        CAMUPDATE
        _camera camCommitPrepared _refresh;
    };

}, 0, [_targetObj]] call CBA_fnc_addPerFrameHandler;
*/
/*
[{    
    params ["_args", "_handle"];  
    _args params ["_originPos", "_targetPos", "_time"];  
  
    private _position = [getPos curatorCamera, _targetPos, time - _time, 10] call BIS_fnc_interpolateVector;  
      
    systemChat str _position;  
     
    curatorCamera setPos _position;  
  
    if (time - _time > _duration) exitWith {  
        [_handle] call CBA_fnc_removePerFrameHandler;  
        systemChat "removing handler";  
    };  
  
}, 0, [
    getPos curatorCamera, 
    getpos (curatorSelected select 0 select 0),  
    10 
]] call CBA_fnc_addPerFrameHandler;
*/
/*
    _cam = "camera" camcreate getposatl curatorcamera;
    _cam cameraeffect ["internal","back"];
    curatorcamera setpos _pos;
    curatorcamera setvectordir vectordir _cam;
    curatorcamera setvectorup vectorup _cam;
    curatorcamera camcommitprepared 0;
    */

/*_cam cameraeffect ["terminate","back"];
camdestroy _cam;
curatorcamera cameraeffect ["internal","back"];
*/

missionNamespace setVariable ["GRAD_nvaCommand_zeusCameraRunning", false];

true