params ["_entity"];

if (GRAD_nvaCommand_zeusSelectDestinationRunning) exitWith {};

if (isNull _entity) exitWith {

    private _ctrls = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS", 
        [controlNull,controlNull,controlNull,controlNull, controlNull, controlNull, controlNull, controlNull, controlNull, controlNull]
    ];

    private _allGUISelects = uiNamespace getVariable ["GRAD_nvaCommand_allGUISelects", []];
    uiNamespace setVariable ["GRAD_nvaCommand_allGUISelects", []];
    missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];
    if (!isNull (_ctrls select 0)) then {

        {
            (ctrlPosition _x) params ["_xPos", "_yPos", "_width", "_height"];
            _x ctrlSetPosition [_xPos, _yPos + 0.2, _width, _height];
            _x ctrlSetFade 1;
            _x ctrlCommit 0.2;
        } forEach (_ctrls + _allGUISelects);

        [_ctrls, _allGUISelects] spawn {
            params ["_ctrls", "_allGUISelects"];
            uiSleep 0.2;
            { ctrlDelete _x } forEach (_ctrls + _allGUISelects);
        };
        
    };
};

private _isTower = ((_entity getVariable ["GRAD_nvaCommand_towerID", -1]) > -1);
missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", _entity];
    
if (_isTower) then {
    [] call GRAD_nvaCommand_fnc_towerCenterSelected;
    private _ctrls = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS", 
        [controlNull,controlNull,controlNull,controlNull, controlNull, controlNull, controlNull, controlNull, controlNull, controlNull]
    ];
    if (isNull (_ctrls select 0)) then {
        [_entity] call GRAD_nvaCommand_fnc_curatorTowerInterfaceCreate;
    };
} else {
    [objNull] call GRAD_nvaCommand_fnc_curatorOnClick;
};

// detect if nothing is selected by curator, workaround for missing deselect EH
[{
   (
        count (curatorSelected select 0) +
        count (curatorSelected select 1) +
        count (curatorSelected select 2) +
        count (curatorSelected select 3)
    ) == 0
},
{
    [objNull] call GRAD_nvaCommand_fnc_curatorOnClick;
}, []] call CBA_fnc_waitUntilAndExecute;