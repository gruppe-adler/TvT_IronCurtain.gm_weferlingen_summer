if (isServer) then { 
    {

        [_x, [-1]] call bis_fnc_setCuratorVisionModes;

        _x setCuratorCoef ["delete", -1e10];
        // todo disable
        // _x setCuratorCoef ["edit", -1e10];

    } forEach allCurators; 
};