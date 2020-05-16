params ["_buildTruck"];

private _builder = player;

[] execVM "grad-nvacommand\functions\client\fn_fortificationsRemoveEHs.sqf";
[] call ace_interaction_fnc_hideMouseHint;

private _fort = _builder getVariable ["grad_fortifications_currentFort", objNull];
private _spawnParams = [typeOf _fort, getDir _fort, vectorUp _fort, getPosATLVisual _fort, _builder];
// deleteVehicle _fort;

private _dummyFort = "Land_ClutterCutter_medium_F" createVehicle [0,0,0];
_dummyFort setPos getPos _fort;
deleteVehicle _fort;

[driver _buildTruck, _buildTruck, _dummyFort, _spawnParams] spawn {
    params ["_unit", "_buildTruck", "_dummyFort", "_spawnParams"];

    doGetOut _unit;
    unassignVehicle _unit;
    [_unit] allowGetIn false;
    sleep 1;
    _unit moveTo getPos _dummyFort;

    waitUntil {_unit distance _dummyFort < sizeOf typeOf _dummyFort};
    
    [_unit,(configFile >> "ACE_Repair" >> "Actions" >> "FullRepair")] call grad_fortifications_fnc_doAnimation;

    _spawnParams params ["_type", "_dir", "_vectorUp", "_posATL"];

    private _actualFort = createVehicle [_type, [0,0,0], [], 0, "NONE"];
    _posATL params ["_xPosATL", "_yPosATL", "_zPosATL"];
    private _zPosBelowSurface = -(sizeOf typeOf _actualFort);
    _actualFort setDir _dir;
    _actualFort setVectorUp _vectorUp;
    _actualFort setPosATL [_xPosATL, _yPosATL, _zPosBelowSurface];


    // loadingBar
    private _loadingBar = [{ 
        params ["_args", "_handle"];
        _args params ["_actualFort", "_dummyFort", "_zPosBelowSurface", "_zPosATL"];

        (getPosATLVisual _actualFort) params ["_xPosDummyFort", "_yPosDummyFort", "_zPosDummyFort"];
        
        //minFrom, maxFrom, value, minTo, maxTo, cli
        private _currentWidth = linearConversion [_zPosBelowSurface, _zPosATL, _zPosDummyFort, 0, 5, true];
        diag_log format ["%1 - %2 - %3", _zPosBelowSurface, _zPosATL, _zPosDummyFort];
        systemChat format ["%1 - %2 - %3", _zPosBelowSurface, _zPosATL, _zPosDummyFort];

        drawIcon3D ["\A3\ui_f\data\IGUI\Cfg\HelicopterHUD\border_line_ca.paa", 
            [0,0,0,1], 
            _dummyFort , 
            5,1,0,"",0, 
            0.1,"EtelkaMonospacePro","left",
            true
        ];      
        drawIcon3D ["\A3\ui_f\data\IGUI\Cfg\HelicopterHUD\border_line_ca.paa", 
            [0,1,0,1], 
            _dummyFort , 
            _currentWidth,1,0,"",0, 
            0.1,"EtelkaMonospacePro","left",
            true
        ];     

         
    }, 0, [_actualFort, _dummyFort, _zPosBelowSurface, _zPosATL]] call CBA_fnc_addPerFrameHandler;

    [{ 
        params ["_args", "_handle"];
        _args params ["_actualFort", "_dummyFort", "_zPosATL", "_loadingBar", "_buildTruck", "_unit"];

        (getPosATLVisual _actualFort) params ["_xPosCurrent", "_yPosCurrent", "_zPosCurrent"];
        
        if (_zPosCurrent < _zPosATL) then {
            _zPosCurrent = _zPosCurrent + 0.1;
            _actualFort setPosATL [_xPosCurrent, _yPosCurrent, _zPosCurrent];
        } else {
            [_handle] call CBA_fnc_removePerFrameHandler;
            [_loadingBar] call CBA_fnc_removePerFrameHandler;

            [_unit] allowGetIn true;
            _unit assignAsDriver _buildTruck;
            [_unit] orderGetIn true;

            deleteVehicle _dummyFort;
        };
     
    }, 0.1, [_actualFort, _dummyFort, _zPosATL, _loadingBar, _buildTruck, _unit]] call CBA_fnc_addPerFrameHandler;
};