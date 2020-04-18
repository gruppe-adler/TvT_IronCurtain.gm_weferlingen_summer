/*
 deprecated
*/

/*
params ["_object", "_number"];

private _newNumber = [GRAD_LANDLINE_ALLNUMBERS] call GRAD_landline_fnc_generatePhoneNumber;

if (_number != "none") then {
    _newNumber = _number;
};

// store in simple array for easy access above
private _currentNumbers = missionNamespace getVariable ["GRAD_LANDLINE_ALLNUMBERS", []];
_currentNumbers pushback [_object, _newNumber];
missionNamespace setVariable ["GRAD_LANDLINE_ALLNUMBERS", _currentNumbers, true];


private _currentPhones = missionNamespace getVariable ["GRAD_LANDLINE_ALLPHONES", []];
_currentPhones pushback _object;
missionNamespace setVariable ["GRAD_LANDLINE_ALLPHONES", _currentPhones, true];


// [GRAD_LANDLINE_PHONENUMBERS_HASH, _object, _newNumber] call CBA_fnc_hashSet;
diag_log format ["GRAD-LANDLINE: assigning %1 to %2", _newNumber, _object];

_object setVariable ["GRAD_LANDLINE_NUMBER_ASSIGNED", _newNumber, true];

*/
