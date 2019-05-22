params ["_position", "_type", ["_unit", objNull]];

// get sectors and already triggered sectors
private _triggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_triggeredSectors", []];
private _untriggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_untriggeredSectors", []];
private _untriggeredSectorsTemp = + _untriggeredSectors;

// copyToClipboard str _untriggeredSectors;

// check in which sector alarm did go off
{
    private _index = _x select 0;
    private _sector = _x select 1;

    // diag_log format ["alarm at %1 inPolygon %2", _position, _sector];

    if (_position inPolygon _sector) then {

        private _deleteIndex = _untriggeredSectorsTemp find _x;

        _triggeredSectors append [_x];
        _untriggeredSectorsTemp deleteAt _deleteIndex;

        [_index, _position] call GRAD_nvacommand_fnc_handleAlarm;
    };
} forEach _untriggeredSectors;

missionNamespace setVariable ["GRAD_nvacommand_triggeredSectors", _triggeredSectors];
missionNamespace setVariable ["GRAD_nvacommand_untriggeredSectors", _untriggeredSectorsTemp];


// give feedback whats happening
switch (_type) do { 
	case "fence" : { 
		systemChat localize ("str_nvacommand_fenceCut");
	}; 
	case "flare" : {
		systemChat localize ("str_nvacommand_tripflareTriggered");
	}; 
	default {
		systemChat "error: raiseAlarm called without type.";
	}; 
};