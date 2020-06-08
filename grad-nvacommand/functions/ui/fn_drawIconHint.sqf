params ["_unit", "_string", "_duration"];

// systemChat "drawIconHint";

private _time = time;

private _drawHandler = [{
    params ["_args", "_handle"];
    _args params ["_unit", "_string", "_time", "_duration"];

    private _iconPosition = getPosVisual _unit;
    _iconPosition params ["_iconPosX", "_iconPosY"];

    private _offset = 3 + (time - _time) * 4;
    private _alpha = linearConversion [_time, _time + _duration, time, 1, 0, true];

    drawIcon3D ["", [1,1,1,_alpha], [_iconPosX,_iconPosY,_offset], 0, 0, 0, _string, 2, 0.05, "RobotoCondensedBold", "center"];
    
}, 0, [_unit, _string, _time, _duration]] call CBA_fnc_addPerFrameHandler;

[{
    params ["_drawHandler"];

    [_drawHandler] call CBA_fnc_removePerFrameHandler;

}, [_drawHandler], _duration] call CBA_fnc_waitAndExecute;