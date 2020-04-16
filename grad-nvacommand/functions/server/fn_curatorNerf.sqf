if (isServer) then { 
    {

        [_x, [-1]] call bis_fnc_setCuratorVisionModes;

        _x setCuratorCoef ["delete", -1e10];
        // todo disable
        // _x setCuratorCoef ["edit", -1e10];

    } forEach allCurators;

    {
      if (_x getVariable ["GRAD_nvacommand_isCommander", false]) then {
            [_x, "1337", false, "none"] call GRAD_landline_fnc_addPhone;
      };
    } forEach allPlayers;
};