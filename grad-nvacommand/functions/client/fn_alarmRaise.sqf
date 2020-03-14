params ["_position", "_type", ["_unit", objNull]];

private _sector = [_position] call GRAD_nvaCommand_fnc_getSectorForPosition;
[_sector, true] call GRAD_nvacommand_fnc_alarmSetSector;

[_position] call GRAD_nvacommand_fnc_alarmSetTower;

[_sector, _position, _type] call GRAD_nvacommand_fnc_handleTripFlare;

// give feedback whats happening
switch (_type) do { 
	case "fence" : { 
		systemChat localize ("str_nvacommand_fenceCut");

        [_position] remoteExec ["GRAD_nvacommand_fnc_markerFenceCut", [0,-2] select isDedicated];
	}; 
	case "flare" : {
		systemChat localize ("str_nvacommand_tripflareTriggered");
	};
    case "manual" : {
        systemChat "activated Alarm";
    };
	default {
		systemChat "NVACOMMAND-error: alarmRaise called without type.";
	}; 
};