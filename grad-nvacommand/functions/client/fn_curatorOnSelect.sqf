params ["_entities", ["_groups", grpNull]];

// systemChat (str _entities + str _groups);
// diag_log format ["groups: %1", _groups];

if (GRAD_nvaCommand_zeusSelectDestinationRunning) exitWith {};

// if no object is selected, dismiss all existing GUIs
if (count _entities < 1) exitWith {
    [] call GRAD_nvaCommand_fnc_GUI_dismiss;
};

private _isTower = false;
private _isInfantry = false;

_entity = _entities select 0;

// towers are only allowed to be selected singularirly
if (count _entities == 1) then { 
    _isTower = ((_entity getVariable ["GRAD_nvaCommand_towerID", -1]) > -1);
    _isInfantry = (_entity isKindOf "Man" && side _entity == east);

    // systemChat format ["isTower: %1 - isInfantry: %2", _isTower, _isInfantry];
};





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

/*
if (_isInfantry) then {
    missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTINFANTRY_SELECTED", _entity];

    private _ctrls = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTINFANTRY_UIELEMENTS", 
        [controlNull,controlNull,controlNull,controlNull]
    ];
    // check only one to know interface is missing
    if (isNull (_ctrls select 0)) then {
        [_entity] call GRAD_nvaCommand_fnc_curatorInterfaceInfantryCreate;
    };
};
*/

if (count _groups > 0) then {
    private _reinforcements = missionNamespace getVariable ["IC_reinforcements",[]];
    private _previouslySelected = missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLEGROUPS_SELECTED", []];

    if (count _previouslySelected > 0) then {
        {
            [
                "GRAD_reinforcements_GUIEvent", 
                [_x,"deselected"]
            ] call CBA_fnc_localEvent;
        } forEach _previouslySelected;
    };

    // clear cache
    _previouslySelected = [];
    {
        private _group = _x;
        _previouslySelected pushBackUnique _group;        
          
        [
            "GRAD_reinforcements_GUIEvent", 
            [_group,"selected"]
        ] call CBA_fnc_localEvent;
        
    } forEach _groups;

    missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLEGROUPS_SELECTED", _previouslySelected];

    // if first one does not exist there seems to be no interface yet
    private _ctrls = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS",[controlNull,controlNull,controlNull,controlNull]];
    if (isNull (_ctrls select 0)) then {
        [_groups] call GRAD_nvaCommand_fnc_curatorInterfaceVehicleCreate;
    };
};

if (!_isInfantry && !_isTower && !_isGroupFromGUI) then {
    [[]] call GRAD_nvaCommand_fnc_curatorOnSelect;
};


// detect the moment nothing is selected anymore, workaround for missing deselect EH
[{
   (
        count (curatorSelected select 0) +
        count (curatorSelected select 1) +
        count (curatorSelected select 2) +
        count (curatorSelected select 3)
    ) == 0
},
{
    [[]] call GRAD_nvaCommand_fnc_curatorOnSelect;
}, []] call CBA_fnc_waitUntilAndExecute;