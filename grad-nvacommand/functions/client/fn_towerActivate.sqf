params ["_tower"];

private _marker = _tower getVariable ["GRAD_nvacommand_towerActiveMarker", ""];

if (_marker != "") then {
	_marker setMarkerAlphaLocal 1;
};