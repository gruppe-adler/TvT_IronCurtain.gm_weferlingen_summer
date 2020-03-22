params ["_units"];
_units params [["_unit", objNull]];

if (isNull _unit) then { hint "Keine Einheit ausgewählt."; };



private _nearestFences = nearestObjects [_unit, [
        "land_gm_fence_border_gz1_600",
        "land_gm_fence_border_gssz_70_gate_350_w",
        "land_gm_fence_border_gssz_70_gate_350_r",
        "land_gm_fence_border_gz1_gate_350_r",
        "land_gm_fence_border_gz1_gate_350_w",
        "land_gm_fence_border_waterbarrier_gssz70_1800",
        "land_gm_fence_border_waterbarrier_gz1_1800"
], 5] + nearestTerrainObjects [_unit, [], 5];

/*
176698: gm_fence_border_gssz_70_600.p3d -- ""
2016ea52b00# 2243: gm_fence_border_gz1_600.p3d "land_gm_fence_border_gz1_600"

*/

_nearestFences = [_nearestFences, [], { (position _unit) distance _x }, "ASCEND"] call BIS_fnc_sortBy;

_nearestFences params [["_nearestFence", objNull]];

if (isNull _nearestFence) exitWith { hint "Kein Zaun in der Nähe."; };

if (damage _nearestFence < 0.9) exitWith { hint "Kein kaputter Zaun in der Nähe."; };

private _callerAnim = [getText (_config >> "animationCaller"), getText (_config >> "animationCallerProne")] select (stance _unit == "PRONE");
[_unit, _callerAnim] call ace_common_fnc_doAnimation;


[{
    params ["_unit", "_nearestFence"];

    if (alive _unit && speed _unit < 1) then {
        hint "fence repaired"; 
        _nearestFence setDamage 0;
    };
    
}, [_unit, _nearestFence], 5] call CBA_fnc_waitAndExecute;