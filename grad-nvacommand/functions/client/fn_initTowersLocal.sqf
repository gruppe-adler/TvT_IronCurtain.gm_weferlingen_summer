/*
    not in use currently
*/


// add towers to all curators to edit/access

if (!(player getVariable ["GRAD_nvacommand_isCommander", false])) exitWith {};



[{
    private _towers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];
    count _towers > 0
},{
    // make curator selectable
    [_x] call GRAD_nvaCommand_fnc_curatorOnSelectEH;
    [] call GRAD_nvaCommand_fnc_curatorInterfaceDetection;

    {
        { 
            private _towerID = _x getVariable ["GRAD_nvaCommand_towerID", -1];
           [ _curator, ["", [1,1,1,1], position _x, 1, 1, 45, format ["BT-11 - %1", _towerID], 1, 0.05, "TahomaB"], false ] call BIS_fnc_addCuratorIcon;
        } forEach _towers;
    } forEach allCurators;
}] call CBA_fnc_waitUntilAndExecute;


/*
private _towers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];

{
	private _marker = createMarkerLocal [format ["mrk_towerActive_%1", _x], position _x];
	_marker setMarkerShapeLocal "Icon";
	_marker setMarkerTypeLocal "Select";
	_marker setMarkerAlphaLocal 0;
} forEach _towers;
*/