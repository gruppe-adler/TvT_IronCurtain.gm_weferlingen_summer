 params ["_control", "_selectedIndex"];

// private _objIndex = lbValue [ _control, _selectedIndex ];
private _allNumbers = missionNamespace getVariable ["GRAD_LANDLINE_ALLNUMBERS", []];
private _objReceiver = (_allNumbers select _selectedIndex) select 0;

// systemChat format ["%1 - %2", _objReceiver, _selectedIndex];

"mrk_grad_landlinePhoneSelect" setMarkerPosLocal (getPos _objReceiver);

private _dialog = uiNamespace getVariable ['grad_landline_rscPhoneBook',controlNull];
private _map = _dialog displayCtrl 2000;
_map ctrlMapAnimAdd [0.1, 0.05, getPos _objReceiver];
ctrlMapAnimCommit _map;