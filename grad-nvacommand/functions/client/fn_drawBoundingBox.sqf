params [["_target", objNull], ["_rotation", 0], ["_offset", [0, 0, 0]], ["_color", [1, 0, 0, 1]]];
 
if (isNull _target) exitWith {};
 
(boundingBoxReal _target apply {_x vectorAdd _offset}) params ["_c0", "_c1"]; // _corner0, _corner1
 
_lines = [
    // Left Front Bottom -> Right Front Bottom
    [_c0, [_c1 select 0, _c0 select 1, _c0 select 2]],
 
    // Left Front Bottom -> Left Back Bottom
    [_c0, [_c0 select 0, _c1 select 1, _c0 select 2]],
 
    // Left Front Bottom -> Left Front Top
    [_c0, [_c0 select 0, _c0 select 1, _c1 select 2]],
 
    // Right Back Top -> Left Back Top
    [_c1, [_c0 select 0, _c1 select 1, _c1 select 2]],
 
    // Right Back Top -> Right Front Top
    [_c1, [_c1 select 0, _c0 select 1, _c1 select 2]],
 
    // Right Back Top -> Right Back Bottom
    [_c1, [_c1 select 0, _c1 select 1, _c0 select 2]],
 
    // Right Back Bottom -> Right Front Bottom
    [[_c1 select 0, _c1 select 1, _c0 select 2], [_c1 select 0, _c0 select 1, _c0 select 2]],
 
    // Right Front Top -> Left Front Top
    [[_c1 select 0, _c0 select 1, _c1 select 2], [_c0 select 0, _c0 select 1, _c1 select 2]],
 
    // Right Front Bottom -> Right Front Top
    [[_c1 select 0, _c0 select 1, _c0 select 2], [_c1 select 0, _c0 select 1, _c1 select 2]],
 
    // Left Back Top -> Left Front Top
    [[_c0 select 0, _c1 select 1, _c1 select 2], [_c0 select 0, _c0 select 1, _c1 select 2]],
 
    // Left Back Top -> Left Back Bottom
    [[_c0 select 0, _c1 select 1, _c1 select 2], [_c0 select 0, _c1 select 1, _c0 select 2]],
 
    // Left Back Bottom -> Right Back Bottom
    [[_c0 select 0, _c1 select 1, _c0 select 2], [_c1 select 0, _c1 select 1, _c0 select 2]]
];
 
[((_target call BIS_fnc_netId) + "_drawBB_EH"), "onEachFrame", {
    params ["_target", "_lines", "_color", "_rotation"];
    {
        _x params ["_start", "_end"];
        if (_rotation != 0) then {
            _rotation = _rotation % 360;
            _start = [
                ((_start select 0) * cos (360 - _rotation)) - ((_start select 1) * sin (360 - _rotation)),
                ((_start select 0) * sin (360 - _rotation)) + ((_start select 1) * cos (360 - _rotation)),
                _start select 2
            ];
            _end = [
                ((_end select 0) * cos (360 - _rotation)) - ((_end select 1) * sin (360 - _rotation)),
                ((_end select 0) * sin (360 - _rotation)) + ((_end select 1) * cos (360 - _rotation)),
                _end select 2
            ];
        };
        drawLine3D [
            _target modelToWorldVisual _start,
            _target modelToWorldVisual _end,
            _color
        ];
    } forEach _lines;
}, [_target, _lines, _color, _rotation]] call BIS_fnc_addStackedEventHandler;



waitUntil {
  (_target getVariable ["isDeSelected", false])
};

[_obj call BIS_fnc_netId + "_drawBB_EH", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;