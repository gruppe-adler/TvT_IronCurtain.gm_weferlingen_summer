params ["_heli"];

private _revealEH = [{

        params ["_args", "_handle"];
        _args params ["_heli"];

        private _nearEntities =  _heli nearEntities [["Car"], 1000];

        // diag_log format ["GRAD-vopo nearEntities %1", _nearEntities];

        player setVariable ["GRAD_vopo_drawEntities", _nearEntities];
          

}, 2, [_heli]] call CBA_fnc_addPerFrameHandler;



private _drawEH = addMissionEventHandler ["Draw3D", {
    
    private _nearEntities = player getVariable ["GRAD_vopo_drawEntities", []];

    {   
        if (typeOf _x == "gm_gc_pol_p601") then {
            private _position = ASLToAGL getPosASL _x;
            _position params ["_xPos", "_yPos", "_zPos"];

            private _color = 1;
            private _alpha = 0;
            private _distance = _position distance player;
            private _ID = _x getVariable ["GRAD_vopo_carID", -1];

            drawIcon3D [getMissionPath "grad-vopo\data\flare.paa", [_color, _color, _color, linearConversion [0, 1000, _distance, 1, 0, true]], [_xPos, _yPos, _zPos + 1] , 2, 2, 0, str _ID, 0, 0.05, "TahomaB", "center", true];
        };
    } forEach _nearEntities;
    
}];

[_revealEH, _drawEH]