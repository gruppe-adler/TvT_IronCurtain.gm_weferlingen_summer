params ["_ctrl", "_group"];

private _ignore = _group getVariable ["actionIgnore", false];
_group setVariable ["actionIgnore", !_ignore];

private _bgPic = _ctrl getVariable ["GRAD_nvacommand_bgPic", controlNull];
private _vehicle = _group getVariable ["assignedVehicle", objNull];

if (_ignore) then {
    _ctrl ctrlSetTextColor [0/255, 0/255, 0/255, 1];
    _bgPic ctrlSetText "grad-nvacommand\vehicles\empty_active_red.paa";
    _ctrl ctrlCommit 0;
    _bgPic ctrlCommit 0;

    {
      _x disableAI "AUTOTARGET";
      _x disableAI "TARGET";
      _x disableAI "COVER";
      _x disableAI "AUTOCOMBAT";
      _x disableAI "SUPPRESSION";
      _x disableAI "FSM";
      _x forceSpeed 80;
    } forEach units _group;

    _group setSpeedMode "FULL";
    _group setCombatMode "BLUE";
    _group setBehaviour "AWARE";

    [_vehicle, "Ignoriere Feindkräfte", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
} else {
    _ctrl ctrlSetTextColor [235/255, 87/255, 87/255, 1];
    _bgPic ctrlSetText "grad-nvacommand\vehicles\empty.paa";
    _ctrl ctrlCommit 0;
    _bgPic ctrlCommit 0;

    {
      _x enableAI "AUTOTARGET";
      _x enableAI "TARGET";
      _x enableAI "COVER";
      _x enableAI "AUTOCOMBAT";
      _x enableAI "SUPPRESSION";
      _x enableAI "FSM";
      _x forceSpeed -1;
    } forEach units _group;

    _group setSpeedMode "FULL";
    _group setCombatMode "YELLOW";
    _group setBehaviour "AWARE";

    [_vehicle, "Bekämpfe Feindkräfte", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
};