params ["_aiCommandParams"];
_aiCommandParams params ["_unit","_player","_display","_map"];

// systemChat (str _display + " " + str _map);
// diag_log str (str _display + " " + str _map);

[_unit, _player, _display, _map] call GRAD_nvacommand_fnc_addMapEventhandler;


_map ctrlAddEventHandler ["MouseButtonClick", {
    params ["_mapCtrl","_button","_xPos","_yPos","_shift","_alt","_ctrl"];

    // currently nothing but left- and rightclick
    if (_button > 1) exitWith {};

    if (_button == 0) then {
        private _position = _mapCtrl ctrlMapScreenToWorld [_xPos, _yPos];
        private _tower = [_position] call GRAD_nvacommand_fnc_selectTower;

        if (isNull _tower) then {
            [_position] call GRAD_nvacommand_fnc_alarmDismissAction;
            [] call GRAD_nvacommand_fnc_deselectAllTowers;
        } else {
            [] call GRAD_nvacommand_fnc_deselectAllTowers;
            [_mapCtrl, _tower] call GRAD_nvacommand_fnc_towerShowOptions;
        };
    } else {
        systemChat "rightclick";
    };

    false
}];


/* add click EH for zeus functionality */

// if (player call BIS_fnc_isCurator) then {

waitUntil {player call BIS_fnc_isCurator};

(findDisplay 312) displayAddEventHandler ["MouseButtonUp",{
        params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

        private _position = screenToWorld [_xPos,_yPos];
        private _object = nearestTerrainObjects [_position, [], 200];

        if (count _object > 0) then {
            _object =_object select 0;

            systemChat format ["%1", _object];

            [_object, 0, [0,0,0], [1, 0, 0, 1]] execVM "grad-nvacommand\functions\client\fn_drawBoundingBox.sqf";
        };
}];


    player addEventHandler ["CuratorObjectDoubleClicked", {
        params ["_curator", "_entity"];

        private _isTower = ((_entity getVariable ["GRAD_nvaCommand_towerID", -1]) > -1);
        
        if (_isTower) then {
            systemChat "selected Tower";
        };
    }];

// };