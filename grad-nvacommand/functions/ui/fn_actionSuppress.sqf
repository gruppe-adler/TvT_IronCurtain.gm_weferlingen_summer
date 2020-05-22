params ["_ctrl", "_group"];

private _bgPic = _ctrl getVariable ["GRAD_nvacommand_bgPic", controlNull];
private _icon = _ctrl getVariable ["GRAD_nvacommand_icon", controlNull];
private _isSupressing = _group getVariable ["GRAD_nvacommand_isSuppressing", false];

private _prefix = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\";
private _suffix = ".ogg";

if (_isSupressing) exitWith {
    [leader _group, "Stopfe", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
    _group setVariable ["GRAD_nvacommand_isSuppressing", false];

    _icon ctrlSetTextColor [235/255, 87/255, 87/255, 1];
    _bgPic ctrlSetText "grad-nvacommand\vehicles\empty.paa";
    _icon ctrlCommit 0;
    _bgPic ctrlCommit 0;

    private _sound = selectRandom ["CeaseFire_1", "CeaseFire_2"];
    // todo define in description.ext and playSound
    playSound3D [_prefix + _sound + _suffix, curatorCamera];
};

// taken from ACE3 / bux, PabstMirror
[leader _group, {
    params ["_successful", "_unit", "_mousePosASL"];

    private _vehicle = vehicle _unit;

    private _targetASL = _mousePosASL vectorAdd [0,0,0.6];

    private _lis = lineIntersectsSurfaces [eyePos _unit, _targetASL, _unit, _vehicle];
    if ((count _lis) > 0) then { // If point is hidden, unit won't fire, do a ray cast to find where they should shoot at
        _targetASL = ((_lis select 0) select 0);
    };
    if (_unit isEqualTo _vehicle) then { // Max range a unit can fire seems to be based on the weapon's config
        private _distance =  _targetASL vectorDistance eyePos _unit;
        private _maxWeaponRange = getNumber (configFile >> "CfgWeapons" >> (currentWeapon _unit) >> "maxRange");

        if (_distance > (_maxWeaponRange - 50)) then {
            if (_distance > (2.5 * _maxWeaponRange)) then {
                _targetASL = [];
                systemChat "not in range";
            } else {
                // 1-2.5x the weapon max range, find a virtual point the AI can shoot at (won't have accurate elevation, but it will put rounds downrange)
                private _fakeElevation = (_distance / 100000) * (_distance - _maxWeaponRange);
                _targetASL = (eyePos _unit) vectorAdd (((eyePos _unit) vectorFromTo _targetASL) vectorMultiply (_maxWeaponRange - 50)) vectorAdd [0,0,_fakeElevation];
            };
        };
    };

    // feedback if target is shit
    if (count _targetASL < 1) then {
        private _sound = selectRandom ["NoCanDo_1", "NoCanDo_2"];
        // todo define in description.ext and playSound
        playSound3D [_prefix + _sound + _suffix, curatorCamera];
        [_vehicle, "Nicht erreichbar", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";

    } else {
        private _sound = selectRandom ["SuppressingE_1", "SuppressingE_2", "SuppressingE_3", "SuppressingE_4"];
        // todo define in description.ext and playSound
        playSound3D [_prefix + _sound + _suffix, curatorCamera];

        private _units = [_unit];
        if (_unit == (leader _unit)) then {_units = units _unit;};

        {
            if (((_unit distance _x) < 30) && {!([_x] call ace_common_fnc_isPlayer)} && {[_x] call ace_common_fnc_isAwake}) then {
                ["ace_zeus_suppressiveFire", [_x, _targetASL, ""], _x] call CBA_fnc_targetEvent;
            };
        } forEach _units;

        [_unit, "Unterdrücke", 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";
        (group _unit) setVariable ["GRAD_nvacommand_isSuppressing", true];

        _icon ctrlSetTextColor [0/255, 0/255, 0/255, 1];
        _bgPic ctrlSetText "grad-nvacommand\vehicles\empty_active_red.paa";
        _icon ctrlCommit 0;
        _bgPic ctrlCommit 0;

        [{
            params ["_args", "_handle"];
            _args params ["_units", "_group"];

            private _isSupressing = _group getVariable ["GRAD_nvacommand_isSuppressing", false];

            if (_isSupressing) then {
                { _x suppressFor 5; } forEach _units;
            } else {
                [_handle] call CBA_fnc_removePerFrameHandler;
            };

        }, 5, [_units, _group]] call CBA_fnc_addPerFrameHandler;
    };

}] call GRAD_nvaCommand_fnc_zeusSelectDestination;

/*
private _lis = lineIntersectsSurfaces [eyePos _unit, _targetASL, _unit, _vehicle];
if ((count _lis) > 0) then { // If point is hidden, unit won't fire, do a ray cast to find where they should shoot at
    _targetASL = ((_lis select 0) select 0);
    TRACE_1("using ray cast pos",_mousePosASL distance _targetASL);
};
if (_unit isEqualTo _vehicle) then { // Max range a unit can fire seems to be based on the weapon's config
    private _distance =  _targetASL vectorDistance eyePos _unit;
    private _maxWeaponRange = getNumber (configFile >> "CfgWeapons" >> (currentWeapon _unit) >> "maxRange");
    TRACE_3("",_distance,_maxWeaponRange,currentWeapon _unit);
    if (_distance > (_maxWeaponRange - 50)) then {
        if (_distance > (2.5 * _maxWeaponRange)) then {
            _targetASL = [];
            [ELSTRING(Interaction,NotInRange)] call FUNC(showMessage);
        } else {
            // 1-2.5x the weapon max range, find a virtual point the AI can shoot at (won't have accurate elevation, but it will put rounds downrange)
            private _fakeElevation = (_distance / 100000) * (_distance - _maxWeaponRange);
            _targetASL = (eyePos _unit) vectorAdd (((eyePos _unit) vectorFromTo _targetASL) vectorMultiply (_maxWeaponRange - 50)) vectorAdd [0,0,_fakeElevation];
            TRACE_2("using virtual halfway point",_mousePosASL distance _targetASL,_fakeElevation);
        };
    };
};
*/
