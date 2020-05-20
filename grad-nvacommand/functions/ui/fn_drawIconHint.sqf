params ["_unit", "_string", "_duration"];

systemChat "drawIconHint";

private _drawHandler = [{
    params ["_args", "_handle"];
    _args params ["_unit", "_string"];

    private _iconPosition = getPos _unit;
    _iconPosition params ["_iconPosX", "_iconPosY"];

    drawIcon3D ["", [1,1,1,1], [_iconPosX,_iconPosY,3], 0, 0, 0, _string, 2, 0.05, "RobotoCondensedBold", "center"];
    
}, 0, [_unit, _string]] call CBA_fnc_addPerFrameHandler;

[{
    params ["_drawHandler"];

    [_drawHandler] call CBA_fnc_removePerFrameHandler;

}, [_drawHandler], _duration] call CBA_fnc_waitAndExecute;