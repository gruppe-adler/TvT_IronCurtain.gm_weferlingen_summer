params ["_buildTruck"];

private _builder = player;

[] execVM "grad-nvacommand\functions\client\fn_fortificationsRemoveEHs";
[] call ace_interaction_fnc_hideMouseHint;

// [false] call grad_fortifications_fnc_openHint;
_builder setVariable ["grad_fortifications_isPlacing", false];

_fort = _builder getVariable ["grad_fortifications_currentFort", objNull];
_spawnParams = [typeOf _fort, getDir _fort, vectorUp _fort, getPosASL _fort, _builder];
// deleteVehicle _fort;


[driver _buildTruck, _fort, _spawnParams] spawn {
    params ["_unit", "_fort", "_spawnParams"];

    doGetOut _unit;
    _unit moveTo getPos _fort;

    waitUntil {_unit distance _fort < 5};

    deleteVehicle _fort;
    
    _spawnParams remoteExec ["grad_fortifications_fnc_spawnFortification",2,false];

    [_unit,(configFile >> "ACE_Repair" >> "Actions" >> "FullRepair")] call grad_fortifications_fnc_doAnimation;

    [{ 
        params ["_args", "_handle"];
        _args params ["_fort", "_duration", "_startTime"]; 
        
        //minFrom, maxFrom, value, minTo, maxTo, cli
        private _currentWidth = linearConversion [_startTime, _startTime + _duration, time - _startTime, 0, 5, false];

        drawIcon3D ["\A3\ui_f\data\IGUI\Cfg\HelicopterHUD\border_line_ca.paa", [0,0,0,1], _fort , 5,1,0,"",0, 0.1,"EtelkaMonospacePro","left",true];      
        drawIcon3D ["\A3\ui_f\data\IGUI\Cfg\HelicopterHUD\border_line_ca.paa", [1,0,0,1], _fort , _currentWidth,0.3,0,"",0, 0.1,"EtelkaMonospacePro","left",true];      
     

        [{ 
            params ["_handle"]; 
            [_handle] call CBA_fnc_removePerFrameHandler;
        }, [_handle], _duration] call CBA_fnc_waitAndExecute; 
         
     
    }, 0, [_fort, 30, time]] call CBA_fnc_addPerFrameHandler;
};