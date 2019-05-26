params ["_entity"];

if (isNull _entity) exitWith {

    private _ctrls = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS", [controlNull,controlNull,controlNull]];
    missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];
    if (!isNull (_ctrls select 0)) then {

        {
            _x ctrlSetPosition [0, 1.2, 1, 0.1];
            _x ctrlSetBackgroundColor [0,0,0,0]; 
            _x ctrlCommit 0.2;
        } forEach _ctrls;

        [_ctrls] spawn {
            params ["_ctrls"];
            uiSleep 0.1;
            { ctrlDelete _x } forEach _ctrls;
        };
        
    };
};

private _isTower = ((_entity getVariable ["GRAD_nvaCommand_towerID", -1]) > -1);
missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", _entity];
        
if (_isTower) then {
    private _ctrls = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS", [controlNull,controlNull,controlNull]];
    if (isNull (_ctrls select 0)) then {
        [_entity] call GRAD_nvaCommand_fnc_curatorTowerInterfaceCreate;
    };
} else {
    [objNull] call GRAD_nvaCommand_fnc_curatorOnClick;
};

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