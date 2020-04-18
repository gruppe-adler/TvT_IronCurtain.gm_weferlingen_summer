 params ["_control", "_selectedIndex"];

// private _objIndex = lbValue [ _control, _selectedIndex ];
private _allNumbers = missionNamespace getVariable ["GRAD_LANDLINE_ALLNUMBERS", []];

if (count _allNumbers < 1) exitWith { hint "no numbers"; };
if (_selectedIndex > _allNumbers) exitWith { hint "not selectable"; };

private _objReceiverArray = (_allNumbers select _selectedIndex) select 1;
private _objectReceiver = selectRandom _objReceiverArray;

// systemChat format ["%1 - %2", _objReceiver, _selectedIndex];

"mrk_grad_landlinePhoneSelect" setMarkerPosLocal (getPos _objectReceiver);

private _dialog = uiNamespace getVariable ['grad_landline_rscPhoneBook',controlNull];
private _map = _dialog displayCtrl 2000;
_map ctrlMapAnimAdd [0.1, 0.05, getPos _objectReceiver];
ctrlMapAnimCommit _map;

if (count _objReceiverArray > 1) then {
    hint "Mehrere Empfänger - hier nur ein zufälliger abgebildet";
};
