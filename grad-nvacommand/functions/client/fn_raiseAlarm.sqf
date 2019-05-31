params ["_position", "_type", ["_unit", objNull]];

private _sector = [_position, _type, _unit] call GRAD_nvaCommand_fnc_alarmGetSector;
[_sector, true] call GRAD_nvacommand_fnc_alarmSetSector;

[_sector, _position, _type] call GRAD_nvacommand_fnc_handleTripFlare;

// give feedback whats happening
switch (_type) do { 
	case "fence" : { 
		systemChat localize ("str_nvacommand_fenceCut");
	}; 
	case "flare" : {
		systemChat localize ("str_nvacommand_tripflareTriggered");
	};
    case "manual" : {
        systemChat "activated Alarm";
    };
	default {
		systemChat "error: raiseAlarm called without type.";
	}; 
};