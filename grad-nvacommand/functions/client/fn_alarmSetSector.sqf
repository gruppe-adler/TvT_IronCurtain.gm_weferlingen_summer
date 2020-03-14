params ["_sectorTriggered", ["_setAlarm", false]];

if (_sectorTriggered < 0) exitWith { diag_log format ["alarmsetsector: no fitting sector for position"]; };

// get sectors and already triggered sectors
private _sectors = missionNamespace getVariable ["GRAD_nvacommand_sectors", []];

(_sectors select _sectorTriggered) set [1,_setAlarm];

if (_setAlarm) then {
    systemChat localize ("str_nvacommand_alarmRaised");
} else {
    systemChat localize ("str_nvacommand_alarmDismissed");
};

missionNamespace setVariable ["GRAD_nvacommand_sectors", _sectors, true];