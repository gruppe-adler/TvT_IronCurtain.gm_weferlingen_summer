params ["_tower"];

private _positionBehindDoor = _tower modelToWorld [0,3,-3];
private _positionInFrontOfDoor = _tower modelToWorld [0,30,-3];
_positionBehindDoor set [2,0];
_positionInFrontOfDoor set [2,0];
private _towerCrewCount = _tower getVariable ["GRAD_nvaCommand_towerIsManned", 4];
private _group = createGroup east;

if (_towerCrewCount < 1) exitWith {};

systemChat "tower alarm";

for "_i" from 1 to (_towerCrewCount) do {
	_group createUnit ["gm_gc_bgs_rifleman_mpikm72_80_str", _positionBehindDoor, [], 0, "NONE"];
    sleep 0.5;
};

// mark for auto deletion when necessary
_group deleteGroupWhenEmpty true;

// set tower crew to zero
_tower setVariable ["GRAD_nvaCommand_towerIsManned", 0, true];

// set group BFT name
private _towerID = _tower getVariable ["GRAD_nvaCommand_towerID", 0];
private _groupID = format ["Alarmtruppe T%1", _towerID];

// move out
_group setGroupIdGlobal [_groupID];
_group addWaypoint [_positionInFrontOfDoor, 0];


private _groupSearchLight = createGroup east;
private _searchLightGuy = _groupSearchLight createUnit ["gm_gc_bgs_rifleman_mpikm72_80_str", [0,0,0], [], 0, "CAN_COLLIDE"];
private _searchLight = (_tower getVariable ["GRAD_nvaCommand_towerSearchLight", objNull]);
if (!isNull _searchLight && count (crew _searchLight) < 1) then {
    _searchLightGuy moveInAny _searchLight;
    _searchLight setPilotLight true;
    _searchLightGuy action ["SearchLightOn", _searchLight];
};


