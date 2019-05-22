private _towers = missionNamespace setVariable ["GRAD_nvaCommand_towerList", []];


{
	private _marker = createMarkerLocal [format ["mrk_towerActive_%1", _x], position _x];
	_marker setMarkerShapeLocal "Icon";
	_marker setMarkerTypeLocal "Select";
	_marker setMarkerAlphaLocal 0;
} forEach _towers;