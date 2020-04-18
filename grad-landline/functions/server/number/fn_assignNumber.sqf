params ["_object", "_number"];

if (_number == "none") then {
    _number = [GRAD_LANDLINE_ALLNUMBERS] call GRAD_landline_fnc_generatePhoneNumber;
};

// get all existing numbers
private _currentNumbers = missionNamespace getVariable ["GRAD_LANDLINE_ALLNUMBERS", []];

// find possible duplicate - numbers can have multiple assigned objects (first pick up takes the call)
private _indexInNumbers = _currentNumbers find _number;

// add new entry or edit existing number entry
if (_indexInNumbers == -1) then {
    _currentNumbers pushback [_newNumber, [_object]];
} else {
    private _existingObjects = _currentNumbers select _indexInNumbers select 1;
    _existingObjects pushBackUnique _object;
    _currentNumbers set [_indexInNumbers, [_number, _existingObjects]];
};

missionNamespace setVariable ["GRAD_LANDLINE_ALLNUMBERS", _currentNumbers, true];


private _currentPhones = missionNamespace getVariable ["GRAD_LANDLINE_ALLPHONES", []];
_currentPhones pushback _object;
missionNamespace setVariable ["GRAD_LANDLINE_ALLPHONES", _currentPhones, true];


// [GRAD_LANDLINE_PHONENUMBERS_HASH, _object, _newNumber] call CBA_fnc_hashSet;
diag_log format ["GRAD-LANDLINE: assigning %1 to %2", _newNumber, _object];

_object setVariable ["GRAD_LANDLINE_NUMBER_ASSIGNED", _newNumber, true];
