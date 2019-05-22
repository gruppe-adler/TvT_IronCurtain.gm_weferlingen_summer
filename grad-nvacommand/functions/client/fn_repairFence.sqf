params ["_unit", "_fence"];

[
    10, 
    [_unit, _fence], 
    {
        _this params ["_parameter"];
        _parameter params ["_unit", "_fence"];
        hint "fence repaired"; _fence setDamage 0;
    }, 
    {
        hint "aborted repair";
    },
    "Repairing Fence",
    {
        _this params ["_parameter"];
        _parameter params ["_unit", "_fence"];
        damage _fence > 0.9
    }, 
    [
        "isNotInside",
        "notOnMap",
        "isNotDead",
        "isNotInZeus"
    ]
] call ace_common_fnc_progressBar;

private _callerAnim = [getText (_config >> "animationCaller"), getText (_config >> "animationCallerProne")] select (stance _unit == "PRONE");
[_unit, _callerAnim] call ace_common_fnc_doAnimation;