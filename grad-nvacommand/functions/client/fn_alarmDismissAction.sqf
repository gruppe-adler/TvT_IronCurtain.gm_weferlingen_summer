params ["_pos"];
diag_log format ["position : %1", _pos];
_pos set [2,0];

// get sectors and already triggered sectors
private _triggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_triggeredSectors", []];
private _untriggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_untriggeredSectors", []];
private _triggeredSectorsTemp = + _triggeredSectors;
private _dismissal = false; // todo inactive/active sectors

{   
        private _index = _x select 0;
        private _sector = _x select 1;
        if (_pos inPolygon _sector) then {           
            
            private _deleteIndex = _triggeredSectorsTemp find _x;
            _untriggeredSectors append [_x];
            _triggeredSectorsTemp deleteAt _deleteIndex;

            _dismissal = true;
            private _identifier = format ["GRAD_nvacommand_alertIndex_%1", _index];
            private _isRunning = missionNamespace setVariable [_identifier, false];
        };
} forEach _triggeredSectors;


missionNamespace setVariable ["GRAD_nvacommand_triggeredSectors", _triggeredSectorsTemp];
missionNamespace setVariable ["GRAD_nvacommand_untriggeredSectors", _untriggeredSectors];


if (_dismissal) exitWith {
    systemChat localize ("str_nvacommand_alarmDismissed");
    true
};
false