/*
    [cursorObject] execVM "grad-nvacommand\functions\ui\fn_actionReverse.sqf";
*/

params ["_ctrl", "_group"];

// necessary if called from another control, like stop btn
if (isNull _ctrl) then {
    _ctrl = _group getVariable ["GRAD_nvacommand_ctrl_actionReverse", controlNull];
};

private _vehicle = _group getVariable ["assignedVehicle", objNull];
private _isReversing = _group getVariable ["GRAD_nvacommand_isReversing", false];
private _isEmpty = (count (crew _vehicle)) == 0;
private _hasCoDriver = (count (crew _vehicle)) > 1;

private _icon = _ctrl getVariable ["GRAD_nvacommand_icon", controlNull];

private _prefix = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\";
private _suffix = ".ogg";

if (_isEmpty) exitWith {
    systemChat "vehicle empty";
};



if (_isReversing) exitWith {
    _group setVariable ["GRAD_nvacommand_isReversing", false, true];
    _icon ctrlSetText "grad-nvacommand\vehicles\reverse.paa";
    _icon ctrlCommit 0;

    private _sound = selectRandom ["VehStop_1", "VehStop_2", "VehStop_3"];
    private _string = "Stoppe";
    // todo define in description.ext and playSound
    playSound3D [_prefix + _sound + _suffix, curatorCamera];

    [leader _group, _string, 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
};

_group setVariable ["GRAD_nvacommand_isReversing", true, true];
_icon ctrlSetText "grad-nvacommand\vehicles\reverse_active.paa";
_icon ctrlCommit 0;

private _sound = selectRandom ["moveBack_1", "moveBack_2"];
playSound3D [_prefix + _sound + _suffix, curatorCamera];
private _string = "Rückwärts";
[leader _group, _string, 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
// systemChat "reversing";

if (_hasCoDriver) then {
    private _agent = crew _vehicle select 1; // driver is always 0

    _vehicle setEffectiveCommander _agent;

    [{ 
        params ["_args", "_handle"];
        _args params ["_vehicle", "_agent"];

        _vehicle sendSimpleCommand "BACK";

        if (!(group _agent getVariable ["GRAD_nvacommand_isReversing", false])) then {
            [_handle] call CBA_fnc_removePerFrameHandler;
            _vehicle setEffectiveCommander (leader group _agent);
        };
        
    }, 0, [_vehicle, _agent]] call CBA_fnc_addPerFrameHandler;
} else {
    private _agent = (group driver _vehicle) createUnit ["O_Survivor_F", position _vehicle, [], 0, "CARGO"];
    _agent moveInAny _vehicle;
    _agent hideObjectGlobal true;
    _vehicle setEffectiveCommander _agent;

    [{ 
        params ["_args", "_handle"];
        _args params ["_vehicle", "_agent"];

        _vehicle sendSimpleCommand "BACK";

        if (!(group _agent getVariable ["GRAD_nvacommand_isReversing", false])) then {
            [_handle] call CBA_fnc_removePerFrameHandler;
            deleteVehicle _agent;
        };
        
    }, 0, [_vehicle, _agent]] call CBA_fnc_addPerFrameHandler;

};