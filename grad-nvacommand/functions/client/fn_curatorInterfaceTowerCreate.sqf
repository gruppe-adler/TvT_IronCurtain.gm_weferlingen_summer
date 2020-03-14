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
_towerPic setVariable ["IC_GUI_BGCOLOR", [0,0,0,0]];
_towerPic ctrlSetFade 1;
_towerPic ctrlCommit 0;

_towerPic ctrlSetPosition [0.01, 1.01, 0.18, 0.18];
_towerPic ctrlSetFade 0;
_towerPic ctrlCommit 0.1;

_towerPic ctrlAddEventHandler ["MouseEnter", {
    params ["_control"];
    _control ctrlSetForegroundColor [0,0,0,0.2];

}];
_towerPic ctrlAddEventHandler ["MouseExit", {
    params ["_control"];
    _control ctrlSetForegroundColor (_control getVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]]);
}];

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
_towerAlarmGroup1 ctrlSetPosition [0.2, 1.1, 0.10, 0.10];
_towerAlarmGroup1 ctrlSetBackgroundColor [1,1,1,0.5]; 
_towerAlarmGroup1 ctrlSetFade 1;
_towerAlarmGroup1 ctrlCommit 0;

_towerAlarmGroup1 ctrlSetPosition [0.2, 1.05, 0.10, 0.10];
_towerAlarmGroup1 ctrlSetFade 0;
_towerAlarmGroup1 ctrlCommit 0.1;

private _towerAlarmGroup2 = _display ctrlCreate ["RscPictureKeepAspect", -1];
_towerAlarmGroup2 ctrlSetPosition [0.3, 1.1, 0.10, 0.10];
_towerAlarmGroup2 ctrlSetBackgroundColor [1,1,1,0.5]; 
_towerAlarmGroup2 ctrlSetFade 1;
_towerAlarmGroup2 ctrlCommit 0;

_towerAlarmGroup2 ctrlSetPosition [0.3, 1.05, 0.10, 0.10];
_towerAlarmGroup2 ctrlSetFade 0;
_towerAlarmGroup2 ctrlCommit 0.1;

private _towerAlarmGroup3 = _display ctrlCreate ["RscPictureKeepAspect", -1]; 
_towerAlarmGroup3 ctrlSetPosition [0.4, 1.1, 0.10, 0.10];
_towerAlarmGroup3 ctrlSetBackgroundColor [1,1,1,0.5]; 
_towerAlarmGroup3 ctrlSetFade 1;
_towerAlarmGroup3 ctrlCommit 0;

_towerAlarmGroup3 ctrlSetPosition [0.4, 1.05, 0.10, 0.10];
_towerAlarmGroup3 ctrlSetFade 0;
_towerAlarmGroup3 ctrlCommit 0.1;

private _towerAlarmGroup4 = _display ctrlCreate ["RscPictureKeepAspect", -1];
_towerAlarmGroup4 ctrlSetPosition [0.5, 1.1, 0.10, 0.10];
_towerAlarmGroup4 ctrlSetBackgroundColor [1,1,1,0.5]; 
_towerAlarmGroup4 ctrlSetFade 1;
_towerAlarmGroup4 ctrlCommit 0;

_towerAlarmGroup4 ctrlSetPosition [0.5, 1.05, 0.10, 0.10];
_towerAlarmGroup4 ctrlSetFade 0;
_towerAlarmGroup4 ctrlCommit 0.1;

private _manCount = _entity getVariable ["GRAD_nvaCommand_towerIsManned", 0];

{
    if (_manCount >= _forEachIndex) then {
        _x ctrlsetText "grad-nvacommand\displays\alarmgroup.jpg"; 
    } else {
        _x ctrlSetText "";
    };
} forEach [_towerAlarmGroup1, _towerAlarmGroup2, _towerAlarmGroup3, _towerAlarmGroup4];



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


if ([_entity] call GRAD_nvacommand_fnc_towerIsAlarmed) then {
    _towerButtonAlarm ctrlSetBackgroundColor [1,1,1,1];
    _towerButtonAlarm ctrlSetTextColor [1,.1,.1,1];
    _towerButtonAlarm setVariable ["IC_GUI_BGCOLOR", [1,1,1,1]];
    _towerButtonAlarm setVariable ["IC_GUI_TEXTCOLOR", [1,.1,.1,1]];
} else {
    _towerButtonAlarm ctrlSetBackgroundColor [0,0,0,1];
    _towerButtonAlarm ctrlSetTextColor [1,1,1,1];
    _towerButtonAlarm setVariable ["IC_GUI_BGCOLOR", [0,0,0,1]];
    _towerButtonAlarm setVariable ["IC_GUI_TEXTCOLOR", [1,1,1,1]];
};

_towerButtonAlarm ctrlAddEventHandler ["MouseEnter", {
    params ["_control"];
    _control ctrlSetBackgroundColor [0,0,0,0.7];

}];
_towerButtonAlarm ctrlAddEventHandler ["MouseExit", {
    params ["_control"];
    _control ctrlSetBackgroundColor (_control getVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]]);
}];

_towerButtonAlarm ctrlAddEventHandler ["MouseButtonClick", {
    params ["_control"]; 

    private _tower = missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];
    systemChat str _tower;
    if (_tower getVariable ["GRAD_nvacommand_towerAlarm", false]) then {
        _control ctrlSetBackgroundColor [0,0,0,0.5];
        _control setVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]];
        // _control ctrlSetForegroundColor [0,0,0,0];
        _control ctrlCommit 0;
        [getPos _tower, "manual"] call GRAD_nvaCommand_fnc_alarmToggle;
    } else {
        _control ctrlSetBackgroundColor [1,.1,.1,1];
        _control setVariable ["IC_GUI_BGCOLOR", [1,.1,.1,1]];
        // _control ctrlSetForegroundColor [1,.3,.3,1];
        _control ctrlCommit 0;
        [getPos _tower, "manual"] call GRAD_nvaCommand_fnc_alarmToggle;
    };
}];



_towerButtonCenter ctrlAddEventHandler ["MouseButtonClick", {
    params ["_control"]; 

    [] call GRAD_nvacommand_fnc_towerCenterSelected;
}];


private _towerButtonDoWatch = _display ctrlCreate ["RscText", -1];
_towerButtonDoWatch ctrlEnable true;
_towerButtonDoWatch ctrlsetText "Suchlicht"; 
_towerButtonDoWatch ctrlSetPosition [0.7, 1.15, 0.1, 0.1];
_towerButtonDoWatch ctrlSetBackgroundColor [0,0,0,0.5];
_towerButtonDoWatch setVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]];
_towerButtonDoWatch ctrlSetFade 1;
_towerButtonDoWatch ctrlCommit 0;

_towerButtonDoWatch ctrlSetPosition [0.7, 1.05, 0.1, 0.1];
_towerButtonDoWatch ctrlSetFade 0;
_towerButtonDoWatch ctrlCommit 0.1;

_towerButtonDoWatch ctrlAddEventHandler ["MouseEnter", {
    params ["_control"];
    _control ctrlSetBackgroundColor [0,0,0,0.8];

}];
_towerButtonDoWatch ctrlAddEventHandler ["MouseExit", {
    params ["_control"];
    _control ctrlSetBackgroundColor (_control getVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]]);
}];


_towerButtonDoWatch ctrlAddEventHandler ["MouseButtonClick", {
    params ["_control"]; 

    private _tower = missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];
    [_tower] call GRAD_nvacommand_fnc_towerSelectTarget;
}];

private _allTowers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];
private _allCount = count _allTowers;
private _maxCount = 10;
private _allGUISelects = [];
// private _count = count _allTowers;
{
    // todo detect by marker
    // if (_allCount - _forEachIndex > _maxCount) exitWith {};
    private _width = 1/_allCount;

    private _towerSelect = _display ctrlCreate ["RscText", -1];
    _towerSelect ctrlEnable true;
    _towerSelect ctrlsetText (str _forEachIndex);
    _towerSelect ctrlSetPosition [(_forEachIndex * _width), 0.97, _width, 0.03];
    _towerSelect ctrlSetBackgroundColor [0,0,0,0.5];
    _towerSelect setVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]];
    _towerSelect setVariable ["IC_GUI_TEXTCOLOR", [1,1,1,0.7]];
    // _towerSelect ctrlSetForegroundColor [0,0,0,0];
     
    _towerSelect ctrlSetFade 1;
    _towerSelect ctrlCommit 0;

    _towerSelect ctrlSetPosition [(_forEachIndex * _width), 0.95, _width, 0.03];
    _towerSelect ctrlSetFade 0;
    _towerSelect ctrlCommit 0.1;

    _towerSelect setVariable ["IC_GUI_TOWERASSIGNED", _forEachIndex];
    _allGUISelects pushBackUnique _towerSelect;

    _towerSelect ctrlAddEventHandler ["MouseEnter", {
        params ["_control"];
        private _colorFormer = _control getVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]];
        _colorFormer params ["_r", "_g", "_b", "_a"];
        _control ctrlSetBackgroundColor [_r, _g, _b, _a-0.5];
    }];
    _towerSelect ctrlAddEventHandler ["MouseExit", {
        params ["_control"];
        _control ctrlSetBackgroundColor (_control getVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]]);
    }];

    _towerSelect ctrlAddEventHandler ["MouseButtonClick", {
        params ["_control"]; 

        private _tower = _control getVariable ["IC_GUI_TOWERASSIGNED", -1];
        private _allTowers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];
        private _selectedTower = _allTowers select _tower;
        diag_log format ["GUI SELECT: selected Tower %1", _selectedTower];
        [_selectedTower] call GRAD_nvacommand_fnc_curatorOnSelect;

        [] call GRAD_nvacommand_fnc_GUI_refreshSelects;
    }]; 
} forEach _allTowers;

uiNamespace setVariable ["GRAD_nvaCommand_allGUISelects",_allGUISelects];
uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS", 
        [
        _towerLabel,
        _towerPic,
        _towerPicLabel,
        _towerButtonCenter,
        _towerButtonAlarm,
        _towerButtonDoWatch
        ]
];

uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIGROUP", [
        _towerAlarmGroup1,
        _towerAlarmGroup2,
        _towerAlarmGroup3,
        _towerAlarmGroup4
        ]
];

uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UISELECTS", 
    _allGUISelects
];

missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", _entity];

[] call GRAD_nvacommand_fnc_GUI_refreshSelects;