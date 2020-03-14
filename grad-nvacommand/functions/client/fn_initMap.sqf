/*
    
    [player, player, (findDisplay 12), (findDisplay 12 displayCtrl 51)] call GRAD_nvaCommand_fnc_initMap;

*/
params ["_unit","_player","_display","_map"];

systemChat (str _display + " " + str _map);
diag_log str (str _display + " " + str _map);

[_unit, _player, _display, _map] call GRAD_nvacommand_fnc_addMapEventhandler;


_map ctrlAddEventHandler ["MouseButtonClick", {
    params ["_mapCtrl","_button","_xPos","_yPos","_shift","_alt","_ctrl"];

    // currently nothing but left- and rightclick
    if (_button > 1) exitWith {};

    if (_button == 0) then {
        private _mouseToWorld = _mapCtrl ctrlMapScreenToWorld getMousePosition;
        _mouseToWorld set [2,0];
        [_mouseToWorld] call GRAD_nvacommand_fnc_alarmDismiss;
        } else {
        // systemChat "rightclick";
    };

    false
}];