params ["_selectedNumber"];

if (!dialog) exitWith {};

private _dialog = uiNamespace getVariable ['grad_landline_rscKeypad',controlNull];
private _name = format ["grad-landline\data\keypad_%1.paa", _selectedNumber];

private _ctrl = _dialog displayCtrl 5000;
_ctrl ctrlSetText _name;
_ctrl ctrlShow true;

player say (selectRandom ["GRAD_landline_keypad_1", "GRAD_landline_keypad_2", "GRAD_landline_keypad_3"]);

sleep (0.1 + (random 0.4));

if (!dialog) exitWith {};
_ctrl ctrlShow false;

true