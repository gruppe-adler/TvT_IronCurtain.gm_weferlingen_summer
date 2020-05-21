params ["_ctrl", "_group"];

private _ignore = _group getVariable ["actionIgnore", false];
_group setVariable ["actionIgnore", !_ignore];

private _bgPic = _ctrl getVariable ["GRAD_nvacommand_bgPic", controlNull];
private _icon = _ctrl getVariable ["GRAD_nvacommand_icon", controlNull];
private _vehicle = _group getVariable ["assignedVehicle", objNull];

private _prefix = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\";
private _suffix = ".ogg";

if (_ignore) then {
    _icon ctrlSetTextColor [0/255, 0/255, 0/255, 1];
    _bgPic ctrlSetText "grad-nvacommand\vehicles\empty_active_red.paa";
    _icon ctrlCommit 0;
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

    private _sound = selectRandom ["Disengage"];
    // todo define in description.ext and playSound
    playSound3D [_prefix + _sound + _suffix, curatorCamera];
} else {
    _icon ctrlSetTextColor [235/255, 87/255, 87/255, 1];
    _bgPic ctrlSetText "grad-nvacommand\vehicles\empty.paa";
    _icon ctrlCommit 0;
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

    private _sound = selectRandom ["EngageAtWill"];
    // todo define in description.ext and playSound
    playSound3D [_prefix + _sound + _suffix, curatorCamera];
};