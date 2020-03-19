/*
    
    [] execVM "IC-setup\functions\client\fn_detectBorderFence.sqf";

*/

private _fences = [];

{
    _fences pushBack ((getMarkerPos _x) nearObjects ["land_gm_fence_border_gz1_600", 100]);
} forEach [
    "mrk_SAM70_1",
    "mrk_SAM70_2",
    "mrk_SAM70_3",
    "mrk_SAM70_4",
    "mrk_SAM70_5",
    "mrk_SAM70_6"
];


// sort to build a line
// _fences = [_fences, [], { [worldSize/2, 0] distance _x }, "DESCEND"] call BIS_fnc_sortBy;
// _fences resize 200;


{
  private _SAM70 = "land_gm_gc_g501_sm70_02" createVehicleLocal [0,0,0];
  private _position = getPos _x;
  _position params ["_xPos", "_yPos", "_zPos"];
  
  _SAM70 setPos [_xPos, _yPos, 0];
  _SAM70 setDir (getDir _x);
  _SAM70 attachTo [_x];

  _x setVariable ["IC_nvaCommand_SAM70_loaded", true, true];
  _x setVariable ["IC_nvaCommand_SAM70_object", _SAM70, true];
} forEach _fences;