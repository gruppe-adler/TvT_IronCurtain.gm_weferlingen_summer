params ["_tower"];

private _warnLight = _tower getVariable ["GRAD_nvacommand_towerWarnLampLight", objNull];

if (!isNull _warnLight) then {
    deleteVehicle _warnLight;
    _tower setVariable ["GRAD_nvacommand_towerWarnLampLight", objNull, true];
};