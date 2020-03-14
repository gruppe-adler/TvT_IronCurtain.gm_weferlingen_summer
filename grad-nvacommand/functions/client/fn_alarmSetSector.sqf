params ["_sectorTriggered", ["_setAlarm", false]];


// get sectors and already triggered sectors
private _triggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_triggeredSectors", []];
private _untriggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_untriggeredSectors", []];
private _untriggeredSectorsTemp = + _untriggeredSectors;
private _triggeredSectorsTemp = + _triggeredSectors;

private _deleteFromTriggeredIndex = _triggeredSectors find _sectorTriggered;
private _deleteFromUntriggeredIndex = _untriggeredSectors find _sectorTriggered;

systemChat format ["_deleteFromTriggeredIndex : %1", _deleteFromTriggeredIndex];
systemChat format ["_deleteFromUntriggeredIndex : %1", _deleteFromUntriggeredIndex];

if (_setAlarm) then {
    _triggeredSectors append [_sectorTriggered];
    _untriggeredSectorsTemp deleteAt _deleteFromUntriggeredIndex;

    systemChat localize ("str_nvacommand_alarmRaised");

    missionNamespace setVariable ["GRAD_nvacommand_triggeredSectors", _triggeredSectors, true];
    missionNamespace setVariable ["GRAD_nvacommand_untriggeredSectors", _untriggeredSectorsTemp, true];
} else {
	_untriggeredSectors append [_sectorTriggered];
    _triggeredSectorsTemp deleteAt _deleteFromTriggeredIndex;

    systemChat localize ("str_nvacommand_alarmDismissed");

    missionNamespace setVariable ["GRAD_nvacommand_triggeredSectors", _triggeredSectorsTemp, true];
    missionNamespace setVariable ["GRAD_nvacommand_untriggeredSectors", _untriggeredSectors, true];
};

