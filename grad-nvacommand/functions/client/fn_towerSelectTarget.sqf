params ["_tower"];


[_tower, {
    params ["_successful", "_tower", "_mousePosASL"];
    private _target = _tower getVariable ["GRAD_nvaCommand_towerDummyTarget", objNull];
    _tower setVariable ["GRAD_nvaCommand_towerWatchMode", "manual", true];
    _target setPos ASLtoAGL _mousePosASL;
    systemChat format ["target is %1", typeOf _target]
}] call GRAD_nvaCommand_fnc_zeusSelectDestination;