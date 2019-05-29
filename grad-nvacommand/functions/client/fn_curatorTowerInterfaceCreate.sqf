params ["_entity"];

private _towerID = _entity getVariable ["GRAD_nvaCommand_towerID", -1];


private _display = findDisplay 312;

private _towerLabel = _display ctrlCreate ["RscText", -1]; 
_towerLabel ctrlsetText (format ["BT-11 - %1", _towerID]); 
_towerLabel ctrlSetPosition [0, 1.1, 1, 0.2];
_towerLabel ctrlSetBackgroundColor [0,0,0,0.7]; 
_towerLabel ctrlSetFade 1;
_towerLabel ctrlCommit 0;

_towerLabel ctrlSetPosition [0, 1, 1, 0.2];
_towerLabel ctrlSetFade 0;
_towerLabel ctrlCommit 0.1;

private _towerPic = _display ctrlCreate ["RscPicture", -1];
_towerPic ctrlsetText "grad-nvacommand\displays\bt11.jpg"; 
_towerPic ctrlSetPosition [0.1, 1.1, 0.18, 0.18];
_towerPic ctrlSetBackgroundColor [1,1,1,0.5]; 
_towerPic ctrlSetFade 1;
_towerPic ctrlCommit 0;

_towerPic ctrlSetPosition [0.1, 1.01, 0.18, 0.18];
_towerPic ctrlSetFade 0;
_towerPic ctrlCommit 0.1;

private _towerButtonAlarm = _display ctrlCreate ["RscButton", -1];
_towerButtonAlarm ctrlsetText "Alarm"; 
_towerButtonAlarm ctrlSetPosition [0.7, 1.15, 0.1, 0.05];
_towerButtonAlarm ctrlSetBackgroundColor [0,0,0,0.5]; 
_towerButtonAlarm ctrlSetFade 1;
_towerButtonAlarm ctrlCommit 0;

_towerButtonAlarm ctrlSetPosition [0.7, 1.05, 0.1, 0.05];
_towerButtonAlarm ctrlSetFade 0;
_towerButtonAlarm ctrlCommit 0.1;


_towerButtonAlarm ctrlAddEventHandler ["ButtonClick", {
    params ["_control"]; 

    private _tower = missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];
    [getPos _tower, "manual"] call GRAD_nvaCommand_fnc_raiseAlarm;
    [_tower] remoteExec ["GRAD_nvacommand_fnc_towerAlarm",2];
}];

private _towerButtonCenter = _display ctrlCreate ["RscButton", -1];
_towerButtonCenter ctrlsetText "Zentrieren"; 
_towerButtonCenter ctrlSetPosition [0.85, 1.15, 0.1, 0.05];
_towerButtonCenter ctrlSetBackgroundColor [0,0,0,0.5]; 
_towerButtonCenter ctrlSetFade 1;
_towerButtonCenter ctrlCommit 0;

_towerButtonCenter ctrlSetPosition [0.85, 1.05, 0.1, 0.05];
_towerButtonCenter ctrlSetFade 0;
_towerButtonCenter ctrlCommit 0.1;


_towerButtonCenter ctrlAddEventHandler ["ButtonClick", {
    params ["_control"]; 

    private _tower = missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];
    private _positionAboveBehind = _tower getRelPos [100, curatorCamera getDir _tower];
    _positionAboveBehind set [2,50];
    [_positionAboveBehind, _tower, 1] spawn BIS_fnc_setCuratorCamera;
}];


private _towerButtonDoWatch = _display ctrlCreate ["RscButton", -1];
_towerButtonDoWatch ctrlsetText "Suchlicht"; 
_towerButtonDoWatch ctrlSetPosition [0.6, 1.15, 0.1, 0.05];
_towerButtonDoWatch ctrlSetBackgroundColor [0,0,0,0.5];
_towerButtonDoWatch ctrlSetFade 1;
_towerButtonDoWatch ctrlCommit 0;

_towerButtonDoWatch ctrlSetPosition [0.6, 1.05, 0.1, 0.05];
_towerButtonDoWatch ctrlSetFade 0;
_towerButtonDoWatch ctrlCommit 0.1;


_towerButtonDoWatch ctrlAddEventHandler ["ButtonClick", {
    params ["_control"]; 

    private _tower = missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];
    [_tower] call GRAD_nvacommand_fnc_towerSelectTarget;
}];

uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS", 
    [_towerLabel, _towerPic, _towerButtonAlarm, _towerButtonCenter, _towerButtonDoWatch]
];

missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", _entity];