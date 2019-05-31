params ["_entity"];

if (isNull _entity) exitWith {

    private _ctrls = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS", [controlNull,controlNull,controlNull,controlNull]];
    missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];
    if (!isNull (_ctrls select 0)) then {

        {
            (ctrlPosition _x) params ["_xPos", "_yPos", "_width", "_height"];
            _x ctrlSetPosition [_xPos, _yPos + 0.2, _width, _height];
            _x ctrlSetFade 1;
            _x ctrlCommit 0.2;
        } forEach _ctrls;

        [_ctrls] spawn {
            params ["_ctrls"];
            uiSleep 0.2;
            { ctrlDelete _x } forEach _ctrls;
        };
        
    };
};

private _isTower = ((_entity getVariable ["GRAD_nvaCommand_towerID", -1]) > -1);
missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", _entity];
        
if (_isTower) then {
    private _ctrls = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS", [controlNull,controlNull,controlNull, controlNull]];
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