/*

	create Rope

*/

// ACTUAL FNC

params ["_poleA", "_poleB"];

_poleA allowDamage false;
_poleB allowDamage false;

private _distanceDogToPole = 10;

private _posA = getPos _poleA;
private _posAPole = _posA;
_posAPole set [2,1.8];

private _posB = getPos _poleB;
private _posBPole = _posB;
_posBPole set [2,1.8];

private _posAdog = _posAPole getPos [_distanceDogToPole,90];
private _posBdog = _posBPole getPos [_distanceDogToPole,90];

"Sign_Arrow_Large_Pink_F" createVehicle _posAdog;
"Sign_Arrow_Large_Pink_F" createVehicle _posBdog;

private _direction =  _posA getDir _posB;
private _positionDog = (_posAPole getPos [(_posAPole distance2D _posBPole)/2, _direction]) getPos [10, 90];

// WAYPOINT OF DOGGY
// private _group = createGroup east;
// private _dog = createAgent ["Alsatian_Sandblack_F", _posA, [], 0, "FORM"]; 
// [_dog] joinSilent _group;

// private _dog = "Alsatian_Sandblack_F" createUnit [_posA, _group, "", 1, "private"];
private _realDog = createAgent ["Alsatian_Sandblack_F", _positionDog, [], 2, "CAN_COLLIDE"];
_realDog setVariable ["BIS_fnc_animalBehaviour_disable", true];
_realDog setSpeedMode "FULL";
_realDog setAnimSpeedCoef 3;
_realDog allowDamage false;
_realDog setSpeaker "NoVoice";  // If dog is a Unit, need to stop him talking!  If dog is an Agent, you don't need this.
_realDog setBehaviour "CARELESS";
_realDog disableAI "FSM";
_realDog disableAI "COVER";
_realDog disableAI "TARGET";
_realDog disableAI "AUTOTARGET";
_realDog disableAI "AUTOCOMBAT";
_realDog setSkill 1;
_realDog playMoveNow "Dog_Walk";
// _realDog setMass 10000;
/*
private _wp = _group addWaypoint [_posA, 0]; 
_wp setWaypointType "MOVE"; 
private _wp1 = _group addWaypoint [_posB, 0];  
_wp1 setWaypointType "MOVE"; 
private _wp2 = _group addWaypoint [_posA, 0]; 
_wp2 setWaypointType "CYCLE";

_group setCurrentWaypoint _wp1;
*/



// CREATE ROPES AND ROPE HELPER
private _positionAnchor = (_posAPole getPos [(_posAPole distance2D _posBPole)/2, _direction]);

private _ropeAnchor = "ace_fastroping_helper" createVehicle [0, 0, 0];
_ropeAnchor allowDamage false;
_ropeAnchor hideObject true;
_ropeAnchor setPos _positionAnchor;

private _anchorA = "ace_fastroping_helper" createVehicle [0, 0, 0];
_anchorA allowDamage false;
 _anchorA hideObject true;
_anchorA setPos _posAPole;


private _anchorB = "ace_fastroping_helper" createVehicle [0, 0, 0];
_anchorB allowDamage false;
 _anchorB hideObject true;
_anchorB setPos _posBPole;

private _ropeAnchorDog = "ace_fastroping_helper" createVehicle [0, 0, 0];
_ropeAnchorDog allowDamage false;
_ropeAnchor hideObject true;
_ropeAnchorDog attachTo [_realDog, [0, -0.1, 0], "head"];


private _fakeRope = ropeCreate [
    _anchorA, [0, 0, 0],
    _anchorB, [0, 0, 0],
    (_poleA distance _poleB)
];

ropeUnwind [_fakeRope, 0.5, -2, true];
// ropeCreate [_poleA, [0,0,2.5], _poleB, [0,0,2.5], (_poleA distance _poleB) - 5];

// [_anchorB, _dog] call GRAD_nvaCommand_fnc_ropeCreate;
/* private _ropeB = [_anchorB, _ropeAnchor] call GRAD_nvaCommand_fnc_ropeCreate;
private _ropeC = [_dog, _ropeAnchor] call GRAD_nvaCommand_fnc_ropeCreate;*/


private _ropeC = ropeCreate [
    _ropeAnchor, [0, 0, 0],
    _ropeAnchorDog, [0, 0, 0],
    (_realDog distance _ropeAnchor)
];

_realDog setDestination [_posBDog, "LEADER DIRECT", true];

[{   
        params ["_args", "_handle"];
        _args params ["_realDog", "_posA", "_posB", "_posAdog", "_posBdog", "_anchorA", "_anchorB", "_ropeAnchor", "_direction"];

        if (!alive _realDog) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        private _positionDogCurrent = getPos _realDog;
        private _targetPos = _realDog getVariable ['targetPos', _posAdog];

        if (random 100 > 99) then {
            _realDog playMoveNow (selectRandom ["Dog_Stop", "Dog_Sit", "Dog_Walk", "Dog_Run", "Dog_Sprint"]);
            [_realDog, selectRandom ["nomi_bark1", "nomi_bark2", "nomi_bark3"]] remoteExec ["say3D", [0,-2] select isDedicated];
        };

        if (_realDog distance2d _posADog < 1) then {
            _realDog setVariable ['targetPos', _posBDog];
            _realDog setDestination [_posBDog, "LEADER DIRECT", true];
        };
        if (_realDog distance2d _posBDog < 1) then {
            _realDog setVariable ['targetPos', _posADog];
            _realDog setDestination [_posADog, "LEADER DIRECT", true];
        };

        private _ropeLengthA = _posAdog distance2d _positionDogCurrent;
        private _ropeLengthB = _posBdog distance2d _positionDogCurrent;
        
        private _relativePosition = (_anchorA getPos [_ropeLengthA, -_direction]);
        _relativePosition params ["_xPos", "_yPos"];
        _ropeAnchor setPos [_xPos, _yPos, 1.8];

}, 0, [_realDog, _posA, _posB, _posAdog, _posBdog, _anchorA, _anchorB, _ropeAnchor, _direction]] call CBA_fnc_addPerFrameHandler;


[{   
        params ["_args", "_handle"];
        _args params ["_realDog"];

        if (!alive _realDog) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };        

        private _nearEnemies = _realDog nearEntities [["Car", "Motorcycle", "Tank"], 150];
        private _enemyFound = { side _x != east } count _nearEnemies > 0;

        if (_enemyFound) then {
            ["dog", [_realDog]] call CBA_fnc_globalEvent;

            _realDog playMoveNow (selectRandom ["Dog_Stop"]);
            [_realDog, selectRandom ["nomi_growl1", "nomi_growl2", "nomi_growl3", "nomi_growl4"]] remoteExec ["say3D", [0,-2] select isDedicated];
        };

}, 5, [_realDog]] call CBA_fnc_addPerFrameHandler;