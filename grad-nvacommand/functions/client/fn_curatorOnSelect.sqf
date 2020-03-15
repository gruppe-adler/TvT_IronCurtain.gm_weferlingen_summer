params ["_entity"];

if (GRAD_nvaCommand_zeusSelectDestinationRunning) exitWith {};

// if no object is selected, dismiss all existing GUIs
if (isNull _entity) exitWith {
        [] call GRAD_nvaCommand_fnc_GUI_dismiss;
};


private _isTower = ((_entity getVariable ["GRAD_nvaCommand_towerID", -1]) > -1);
private _isInfantry = (_entity isKindOf "Man" && side _entity == east);



if (_isTower) then {
    missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", _entity];

    [] call GRAD_nvaCommand_fnc_towerCenterSelected;
    private _ctrls = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS", 
        [controlNull,controlNull,controlNull,controlNull, controlNull, controlNull, controlNull, controlNull, controlNull, controlNull]
    ];
    // check only one to know interface is missing
    if (isNull (_ctrls select 0)) then {
        [_entity] call GRAD_nvaCommand_fnc_curatorInterfaceTowerCreate;
    };
};

if (_isInfantry) then {
    missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTINFANTRY_SELECTED", _entity];

    [_entity] call GRAD_nvaCommand_fnc_curatorInterfaceInfantryCreate;
};

if (!_isInfantry && !_isTower) then {
    [objNull] call GRAD_nvaCommand_fnc_curatorOnSelect;
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
    [objNull] call GRAD_nvaCommand_fnc_curatorOnSelect;
}, []] call CBA_fnc_waitUntilAndExecute;