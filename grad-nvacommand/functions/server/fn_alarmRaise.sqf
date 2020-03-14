params ["_position", "_type", ["_unit", objNull]];

private _sectorIndex = [_position] call GRAD_nvaCommand_fnc_alarmGetSector;
private _sectors = missionNamespace getVariable ["GRAD_nvacommand_sectors", []];

(_sectors select _sectorIndex) params ["_sector", "_isAlarmed", "_tower"];

if (!_isAlarmed) then {
	[_position] call GRAD_nvacommand_fnc_alarmToggle;
} else {
	systemChat "another alarm for already alerted sector " + str _sectorIndex;
};

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