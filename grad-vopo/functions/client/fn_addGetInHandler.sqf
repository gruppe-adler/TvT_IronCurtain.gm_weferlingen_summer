/*

    test: 
    [player] call GRAD_vopo_fnc_addGetInHandler;
    [vehicle player] call GRAD_vopo_fnc_addAction;

*/

params ["_unit"];

_unit addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];

    if (typeOf _vehicle == "gm_gc_pol_p601") then {

         diag_log format ["GRAD-vopo adding GetIn Handler to %1", _unit];

        private _handler = [_vehicle] call GRAD_vopo_fnc_revealNearbyUnits;

        // array to make sure 2 handlers can be added whyever and deleted anyway
        private _existingHandlers = player getVariable ["GRAD_vopo_revealHandler", []];
        player setVariable ["GRAD_vopo_revealHandler", (_existingHandlers pushBackUnique _handler)];
    };
}];

_unit addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];

    private _existingHandlers = player getVariable ["GRAD_vopo_revealHandler", []];

    {
        _x params ["_revealEH", "_missionEH"]
        [_revealEH] call CBA_fnc_removePerFrameHandlers;
        removeMissionEventHandler ["Draw3D", _missionEH];
    } forEach _existingHandlers;
}];