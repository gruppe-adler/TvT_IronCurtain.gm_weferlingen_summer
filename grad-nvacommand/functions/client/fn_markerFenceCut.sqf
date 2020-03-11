params ["_position"];

if (!(player getVariable ["GRAD_nvacommand_isCommander", false])) exitWith {};

private _centerMarker = createMarker [format ["GRAD_nvaCommand_fenceCutMarker_center_%1",CBA_missionTime * 1000],_markerPos];
_centerMarker setMarkerShape "ICON";
_centerMarker setMarkerType "mil_dot";
_centerMarker setMarkerColor "COLORUNKNOWN";
_centerMarker setMarkerText (format ["%1",[daytime * 3600,"HH:MM"] call BIS_fnc_secondsToString]);

private _areaMarker = createMarker [format ["GRAD_nvaCommand_fenceCutMarker_area_%1",CBA_missionTime * 1000],_markerPos];
_areaMarker setMarkerShape "ELLIPSE";
_areaMarker setMarkerColor "COLORRED";
_areaMarker setMarkerSize [100,100];
_areaMarker setMarkerBrush "Border";

[[_centerMarker,_areaMarker],60] call GRAD_nvaCommand_fnc_fadeMarker;