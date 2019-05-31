private _tower = missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];

diag_log format ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED %1", _tower];


private _positionAboveBehind = _tower getPos [50, ((curatorCamera getDir _tower) - 180)];
_positionAboveBehind set [2,50];
[_positionAboveBehind, _tower, 1] spawn BIS_fnc_setCuratorCamera;