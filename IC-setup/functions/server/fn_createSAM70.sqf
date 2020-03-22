/*
    
    [] execVM "IC-setup\functions\client\fn_detectBorderFence.sqf";

*/

private _fences = [];

{
    private _marker = _x;
    { 
        _fences pushBack _x;
    } forEach ((getMarkerPos _marker) nearObjects ["land_gm_fence_border_gz1_600", 200]);
    
} forEach [
    "mrk_SAM70_1",
    "mrk_SAM70_2",
    "mrk_SAM70_3",
    "mrk_SAM70_4",
    "mrk_SAM70_5",
    "mrk_SAM70_6"
];

diag_log str _fences;
// sort to build a line
// _fences = [_fences, [], { [worldSize/2, 0] distance _x }, "DESCEND"] call BIS_fnc_sortBy;
// _fences resize 200;


{
    private _position = getPos _x;
    _position params ["_xPos", "_yPos", "_zPos"];

    private _SAM70 = "land_gm_gc_g501_sm70_02" createVehicle [0,0,0];
      
    _SAM70 setPos [_xPos, _yPos, 0];
    _SAM70 setDir (getDir _x);
    _SAM70 attachTo [_x];

    _x setVariable ["IC_nvaCommand_SAM70_loaded", true, true];
    _x setVariable ["IC_nvaCommand_SAM70_object", _SAM70, true];
} forEach _fences;