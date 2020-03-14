/*
    
    [player, player, (findDisplay 12), (findDisplay 12 displayCtrl 51)] call GRAD_nvaCommand_fnc_initMap;

*/
params ["_unit","_player","_display","_map"];

systemChat (str _display + " " + str _map);
diag_log str (str _display + " " + str _map);

[_unit, _player, _display, _map] call GRAD_nvacommand_fnc_addMapEventhandler;