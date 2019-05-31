params ["_entity"];

private _towerID = _entity getVariable ["GRAD_nvaCommand_towerID", -1];


private _display = findDisplay 312;

private _towerLabel = _display ctrlCreate ["RscText", -1];
_towerLabel ctrlSetPosition [0, 1.1, 1, 0.2];
_towerLabel ctrlSetBackgroundColor [0,0,0,0.7]; 
_towerLabel ctrlSetFade 1;
_towerLabel ctrlCommit 0;

_towerLabel ctrlSetPosition [0, 1, 1, 0.2];
_towerLabel ctrlSetFade 0;
_towerLabel ctrlCommit 0.1;


private _towerPic = _display ctrlCreate ["RscPictureKeepAspect", -1];
_towerPic ctrlsetText "grad-nvacommand\displays\bt11.jpg"; 
_towerPic ctrlSetPosition [0.01, 1.1, 0.18, 0.18];
_towerPic ctrlSetBackgroundColor [0,0,0,0]; 
_towerPic ctrlSetFade 1;
_towerPic ctrlCommit 0;

_towerPic ctrlSetPosition [0.01, 1.01, 0.18, 0.18];
_towerPic ctrlSetFade 0;
_towerPic ctrlCommit 0.1;

private _towerButtonCenter = _display ctrlCreate ["RscText", -1];
_towerButtonCenter ctrlEnable true;
_towerButtonCenter ctrlSetPosition [0.1, 1.1, 0.18, 0.18];
_towerButtonCenter ctrlSetBackgroundColor [0,0,0,0]; 
_towerButtonCenter ctrlSetFade 1;
_towerButtonCenter ctrlCommit 0;

_towerButtonCenter ctrlSetPosition [0.1, 1.01, 0.18, 0.18];
_towerButtonCenter ctrlSetFade 0;
_towerButtonCenter ctrlCommit 0.1;

private _towerPicLabel = _display ctrlCreate ["RscText", -1];
_towerPicLabel ctrlsetText (format ["BT-11 - %1", _towerID]);
_towerPicLabel ctrlSetPosition [0.02, 1, 0.18, 0.18];
_towerPicLabel ctrlSetBackgroundColor [0,0,0,0]; 
_towerPicLabel ctrlSetFade 1;
_towerPicLabel ctrlCommit 0;

_towerPicLabel ctrlSetPosition [0.02, 1, 0.18, 0.05];
_towerPicLabel ctrlSetFade 0;
_towerPicLabel ctrlCommit 0.1;

private _towerAlarmGroup1 = _display ctrlCreate ["RscPictureKeepAspect", -1];
_towerAlarmGroup1 ctrlsetText "grad-nvacommand\displays\alarmgroup.jpg"; 
_towerAlarmGroup1 ctrlSetPosition [0.2, 1.1, 0.10, 0.10];
_towerAlarmGroup1 ctrlSetBackgroundColor [1,1,1,0.5]; 
_towerAlarmGroup1 ctrlSetFade 1;
_towerAlarmGroup1 ctrlCommit 0;

_towerAlarmGroup1 ctrlSetPosition [0.2, 1.05, 0.10, 0.10];
_towerAlarmGroup1 ctrlSetFade 0;
_towerAlarmGroup1 ctrlCommit 0.1;

private _towerAlarmGroup2 = _display ctrlCreate ["RscPictureKeepAspect", -1];
_towerAlarmGroup2 ctrlsetText "grad-nvacommand\displays\alarmgroup.jpg"; 
_towerAlarmGroup2 ctrlSetPosition [0.3, 1.1, 0.10, 0.10];
_towerAlarmGroup2 ctrlSetBackgroundColor [1,1,1,0.5]; 
_towerAlarmGroup2 ctrlSetFade 1;
_towerAlarmGroup2 ctrlCommit 0;

_towerAlarmGroup2 ctrlSetPosition [0.3, 1.05, 0.10, 0.10];
_towerAlarmGroup2 ctrlSetFade 0;
_towerAlarmGroup2 ctrlCommit 0.1;

private _towerAlarmGroup3 = _display ctrlCreate ["RscPictureKeepAspect", -1];
_towerAlarmGroup3 ctrlsetText "grad-nvacommand\displays\alarmgroup.jpg"; 
_towerAlarmGroup3 ctrlSetPosition [0.4, 1.1, 0.10, 0.10];
_towerAlarmGroup3 ctrlSetBackgroundColor [1,1,1,0.5]; 
_towerAlarmGroup3 ctrlSetFade 1;
_towerAlarmGroup3 ctrlCommit 0;

_towerAlarmGroup3 ctrlSetPosition [0.4, 1.05, 0.10, 0.10];
_towerAlarmGroup3 ctrlSetFade 0;
_towerAlarmGroup3 ctrlCommit 0.1;

private _towerAlarmGroup4 = _display ctrlCreate ["RscPictureKeepAspect", -1];
_towerAlarmGroup4 ctrlsetText "grad-nvacommand\displays\alarmgroup.jpg"; 
_towerAlarmGroup4 ctrlSetPosition [0.5, 1.1, 0.10, 0.10];
_towerAlarmGroup4 ctrlSetBackgroundColor [1,1,1,0.5]; 
_towerAlarmGroup4 ctrlSetFade 1;
_towerAlarmGroup4 ctrlCommit 0;

_towerAlarmGroup4 ctrlSetPosition [0.5, 1.05, 0.10, 0.10];
_towerAlarmGroup4 ctrlSetFade 0;
_towerAlarmGroup4 ctrlCommit 0.1;





private _towerButtonAlarm = _display ctrlCreate ["RscText", -1];
_towerButtonAlarm ctrlEnable true;
_towerButtonAlarm ctrlsetText "Alarm"; 
_towerButtonAlarm ctrlSetPosition [0.85, 1.15, 0.1, 0.1];
_towerButtonAlarm ctrlSetBackgroundColor [0,0,0,0.5];
// _towerButtonAlarm ctrlSetForegroundColor [0,0,0,0];
 
_towerButtonAlarm ctrlSetFade 1;
_towerButtonAlarm ctrlCommit 0;

_towerButtonAlarm ctrlSetPosition [0.85, 1.05, 0.1, 0.1];
_towerButtonAlarm ctrlSetFade 0;
_towerButtonAlarm ctrlCommit 0.1;

_towerButtonAlarm ctrlAddEventHandler ["MouseEnter", {
    params ["_control"];
    _control ctrlSetBackgroundColor [0,0,0,0.7];

}];
_towerButtonAlarm ctrlAddEventHandler ["MouseExit", {
    params ["_control"];
    _control ctrlSetBackgroundColor [0,0,0,0.5];
}];

_towerButtonAlarm ctrlAddEventHandler ["MouseButtonClick", {
    params ["_control"]; 

    private _tower = missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];
    systemChat str _tower;
    if (_tower getVariable ["GRAD_nvacommand_towerAlarm", false]) then {
        _control ctrlSetBackgroundColor [0,0,0,0.5];
        // _control ctrlSetForegroundColor [0,0,0,0];
        _control ctrlCommit 0;
        private _sector = [getPos _tower] call GRAD_nvaCommand_fnc_alarmGetSector;
        [_sector, false] call GRAD_nvaCommand_fnc_alarmSetSector;
        [_tower] remoteExec ["GRAD_nvacommand_fnc_towerAlarmDismiss",2];
    } else {
        _control ctrlSetBackgroundColor [1,.1,.1,1];
        // _control ctrlSetForegroundColor [1,.3,.3,1];
        _control ctrlCommit 0;
        [getPos _tower, "manual"] call GRAD_nvaCommand_fnc_raiseAlarm;
        [_tower] remoteExec ["GRAD_nvacommand_fnc_towerAlarmRaise",2];
    };
}];



_towerButtonCenter ctrlAddEventHandler ["MouseButtonClick", {
    params ["_control"]; 

    private _tower = missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];
    private _positionAboveBehind = _tower getPos [50, ((curatorCamera getDir _tower) - 180)];
    _positionAboveBehind set [2,50];
    [_positionAboveBehind, _tower, 1] spawn BIS_fnc_setCuratorCamera;
}];


private _towerButtonDoWatch = _display ctrlCreate ["RscText", -1];
_towerButtonDoWatch ctrlEnable true;
_towerButtonDoWatch ctrlsetText "Suchlicht"; 
_towerButtonDoWatch ctrlSetPosition [0.7, 1.15, 0.1, 0.1];
_towerButtonDoWatch ctrlSetBackgroundColor [0,0,0,0.5];
_towerButtonDoWatch ctrlSetFade 1;
_towerButtonDoWatch ctrlCommit 0;

_towerButtonDoWatch ctrlSetPosition [0.7, 1.05, 0.1, 0.1];
_towerButtonDoWatch ctrlSetFade 0;
_towerButtonDoWatch ctrlCommit 0.1;

_towerButtonDoWatch ctrlAddEventHandler ["MouseEnter", {
    params ["_control"];
    _control ctrlSetBackgroundColor [0,0,0,0.7];

}];
_towerButtonDoWatch ctrlAddEventHandler ["MouseExit", {
    params ["_control"];
    _control ctrlSetBackgroundColor [0,0,0,0.5];
}];


_towerButtonDoWatch ctrlAddEventHandler ["MouseButtonClick", {
    params ["_control"]; 

    private _tower = missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];
    [_tower] call GRAD_nvacommand_fnc_towerSelectTarget;
}];

uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS", 
    [_towerLabel, _towerPic, _towerPicLabel, _towerButtonCenter, _towerAlarmGroup1, _towerAlarmGroup2, _towerAlarmGroup3, _towerAlarmGroup4, _towerButtonAlarm, _towerButtonDoWatch]
];

missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", _entity];