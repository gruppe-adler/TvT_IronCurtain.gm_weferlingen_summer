params ["_tower"];


_tower setVariable ["GRAD_nvacommand_towerAlarm", true, true];

private _positionBehindDoor = _tower modelToWorld [0,3,-3];
private _positionInFrontOfDoor = _tower modelToWorld [0,30,-3];
_positionBehindDoor set [2,0];
_positionInFrontOfDoor set [2,0];
private _towerCrewCount = _tower getVariable ["GRAD_nvaCommand_towerIsManned", 4];
private _group = createGroup east;

if (_towerCrewCount < 1) exitWith {};

systemChat "towerAlarmRaise: spawning alarm group";

for "_i" from 1 to (_towerCrewCount) do {
	_group createUnit ["gm_gc_bgs_rifleman_mpikm72_80_str", _positionBehindDoor, [], 0, "NONE"];

    _tower setVariable ["GRAD_nvaCommand_towerIsManned", 4 - _i, true];
    _tower setVariable ["GRAD_nvaCommand_towerGroup", _group, true];
    
    [] remoteExec ["GRAD_nvaCommand_fnc_GUI_refreshSelects", [0,-2] select isDedicated];
    sleep 0.5;
};

// mark for auto deletion when necessary
_group deleteGroupWhenEmpty true;

// set tower crew to zero
_tower setVariable ["GRAD_nvaCommand_towerIsManned", 0, true];
_tower setVariable ["GRAD_nvaCommand_towerGroup", _group, true];

// set group BFT name
private _towerID = _tower getVariable ["GRAD_nvaCommand_towerID", 0];
private _groupID = format ["Alarmtruppe T%1", _towerID];

// move out
_group setGroupIdGlobal [_groupID];
_group addWaypoint [_positionInFrontOfDoor, 0];