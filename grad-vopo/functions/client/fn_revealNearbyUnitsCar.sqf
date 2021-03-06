params ["_car"];

private _revealEH = [{

        params ["_args", "_handle"];
        _args params ["_car"];

        if (_car getVariable ["IC_vopo_presston", false]) then {
            private _nearEntities =  _car nearEntities [["Man", "Car", "Motorcycle"], 100];

            // diag_log format ["GRAD-vopo nearEntities %1", _nearEntities];

            player setVariable ["GRAD_vopo_drawEntities", _nearEntities];
        } else {
            player setVariable ["GRAD_vopo_drawEntities", []];
        };        

}, 2, [_car]] call CBA_fnc_addPerFrameHandler;



private _drawEH = addMissionEventHandler ["Draw3D", {
    
    private _nearEntities = player getVariable ["GRAD_vopo_drawEntities", []];

    {   
        private _position = ASLToAGL getPosASL _x;
        _position params ["_xPos", "_yPos", "_zPos"];

        private _color = 1;
        private _alpha = 0;
        private _distance = _position distance player;

        drawIcon3D [getMissionPath "grad-vopo\data\flare.paa", [_color, _color, _color, linearConversion [0, 100, _distance, 1, 0, true]], [_xPos, _yPos, _zPos + 1] , 2, 2, 0, "", 0, 0.05, "TahomaB", "center", true];
    } forEach _nearEntities;
    
}];

[_revealEH, _drawEH]