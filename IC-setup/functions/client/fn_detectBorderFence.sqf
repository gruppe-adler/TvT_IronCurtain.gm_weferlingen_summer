/*
    
    [] execVM "IC-setup\functions\client\fn_detectBorderFence.sqf";

*/


private _fences = ((getMarkerPos "mrk_borderCenter") nearObjects ["land_gm_fence_border_gz1_600", 500];

// sort to build a line
// _fences = [_fences, [], { [worldSize/2, 0] distance _x }, "DESCEND"] call BIS_fnc_sortBy;
// _fences resize 200;


{
  private _SAM70 = "land_gm_gc_g501_sm70_02" createVehicleLocal [0,0,0];
  private _position = getPos _x;
  _position params ["_xPos", "_yPos", "_zPos"];
  
  _SAM70 setPos [_xPos, _yPos, 2];
  _SAM70 attachTo [_x];
} forEach _fences;