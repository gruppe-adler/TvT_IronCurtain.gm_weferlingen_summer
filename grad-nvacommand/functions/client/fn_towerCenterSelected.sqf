private _tower = missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];

if (!isNull _tower) then {
	diag_log format ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED %1", _tower];

	private _positionAboveBehind = _tower getPos [75, 220];
	_positionAboveBehind set [2,50];

    if (!(missionNamespace getVariable ["GRAD_nvaCommand_zeusCameraRunning", false])) then {
	   [_positionAboveBehind, _tower, 3] spawn GRAD_nvacommand_fnc_curatorSetCamera;
    };
};