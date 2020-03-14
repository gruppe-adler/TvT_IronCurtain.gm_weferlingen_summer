params ["_tower"];

private _soundHandle = _tower getVariable ["GRAD_nvacommand_soundHandle", -1];
private _soundDummy = _tower getVariable ["GRAD_nvacommand_soundDummy", objNull];

[_soundHandle] call CBA_fnc_removePerFrameHandler;
deleteVehicle _soundDummy;