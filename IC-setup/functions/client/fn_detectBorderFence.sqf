[{
    params ["_args", "_handle"];

    private _fences = nearestObjects [player, ["land_gm_fence_border_gz1_600"], 3];
    if (count _fences < 1) exitWith {};

    private _nearestFence = _fences select 0;
    if (player distance _nearestFence < 3) then {
        if (_nearestFence getVariable ["IC_nvaCommand_SAM70_loaded", false]) then {
            _nearestFence setVariable ["IC_nvaCommand_SAM70_loaded", false, true];
            private _SAM70 = _nearestFence getVariable ["IC_nvaCommand_SAM70_object", objNull];
            
            // if (!isNull _SAM70) then { deleteVehicle _SAM70 };
            // not necessary due to EH at fence in GM
            
            private _charge = "DemoCharge_Remote_Ammo_Scripted" createVehicle getPos _nearestFence;
            _charge setDamage 1;
        };
    };

}, 1, []] call CBA_fnc_addPerFrameHandler;