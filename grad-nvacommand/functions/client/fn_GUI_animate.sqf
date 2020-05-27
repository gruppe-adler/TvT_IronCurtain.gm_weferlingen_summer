params ["_ctrl", "_position", "_animateIn"];

private _offsetOrigin = [0, safeZoneH/60] select _animateIn;
private _offsetTarget = [safeZoneH/60, 0] select _animateIn;
_position params ["_posX", "_posY", "_w", "_h"];

_ctrl ctrlSetPosition [_posX, _posY + _offsetOrigin, _w, _h];
_ctrl ctrlSetFade ([0,1] select _animateIn);
_ctrl ctrlCommit 0;

_ctrl ctrlSetPosition [_posX, _posY + _offsetTarget, _w, _h];
_ctrl ctrlSetFade ([0,1] select !_animateIn);
_ctrl ctrlCommit 0.2;

uiSleep 0.2;

if (!_animateIn) then {
    ctrlDelete _ctrl;
};