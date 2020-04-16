if (isServer) then { 
    {

        [_x, [-1]] call bis_fnc_setCuratorVisionModes;

        _x setCuratorCoef ["delete", -1e10];
        // todo disable
        // _x setCuratorCoef ["edit", -1e10];

        [getAssignedCuratorUnit _x, "1337", false, "false"] call GRAD_landline_fnc_addPhone;

    } forEach allCurators;
};