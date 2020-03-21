/*

    test: 
    [player] call GRAD_vopo_fnc_addGetInHandler;
    [vehicle player] call GRAD_vopo_fnc_addAction;

*/

player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];

    if (typeOf _vehicle == "gm_gc_pol_p601") then {

         diag_log format ["GRAD-vopo adding GetIn Handler to %1", _unit];

        private _handlers = [_vehicle] call GRAD_vopo_fnc_revealNearbyUnits;

        inGameUISetEventHandler ["Action", "_this params ['_target', '_caller', '_index', '_usertype', '_name']; private _car = vehicle _caller; if (_name == 'Beacon On') then { _car setVariable ['IC_vopo_presston', true, true]; [_car] spawn GRAD_vopo_fnc_presston; }; if (_name == 'Beacon Off') then { _car setVariable ['IC_vopo_presston', false, true]; }; false"];

        // [C Alpha 1-1:1 (nomisum),C Alpha 1-1:1 (nomisum),11,""UserType"",""Beacon On"",1.4,false,true,"""",true,""Action""]

        player setVariable ["GRAD_vopo_revealHandler", _handlers];
    };
}];

player addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];

    if (typeOf _vehicle == "gm_gc_pol_p601") then {

        private _existingHandlers = player getVariable ["GRAD_vopo_revealHandler", []];

        if (count _existingHandlers < 1) exitWith {};

        inGameUISetEventHandler ["Action", ""];
       
        _existingHandlers params ["_pfh", "_missionEH"];
        [_revealEH] call CBA_fnc_removePerFrameHandler;
        removeMissionEventHandler ["Draw3D", _missionEH];
    };
}];