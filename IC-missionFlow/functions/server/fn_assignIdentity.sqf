params ["_unit"];

private _facesAssigned = missionNamespace getVariable ["IC_facesAssigned", []];
private _firstNamesAssigned = missionNamespace getVariable ["IC_firstNamesAssigned", []];
private _lastNamesAssigned = missionNamespace getVariable ["IC_lastNamesAssigned", []];

private _facesAvailable = missionNameSpace getVariable ["IC_facesAvailable", []];
private _firstNamesAvailable = missionNameSpace getVariable ["IC_firstNamesAvailable", []];
private _lastNamesAvailable = missionNameSpace getVariable ["IC_lastNamesAvailable", []];

private _villagesGDR = missionNamespace getVariable ["IC_villagesGDR", "Berlin Ost"];
private _villagesOnMap = missionNamespace getVariable ["IC_villagesOnMap", "Gehrendorf"];

private ["_face", "_firstName", "_lastName"];


if (IC_customFaceAllowSame) then {
  _face = selectRandom _facesAvailable;
} else {
  _face = selectRandom (_facesAvailable select { !(_x in _facesAssigned)});
};

if (IC_firstNameAllowSame) then {
  _firstName = selectRandom _firstNamesAvailable;
} else {
  _firstName = selectRandom (_firstNamesAvailable select { !(_x in _firstNamesAssigned)});
};

if (IC_lastNameAllowSame) then {
  _lastName = selectRandom _lastNamesAvailable;
} else {
  _lastName = selectRandom (_lastNamesAvailable select { !(_x in _lastNamesAssigned)});
};

_facesAvailable deleteAt (_facesAvailable find _face);
_firstNamesAvailable deleteAt (_firstNamesAvailable find _firstName);
_lastNamesAvailable deleteAt (_lastNamesAvailable find _lastName);

_facesAssigned pushBackUnique _face;
_firstNamesAssigned pushBackUnique _firstName;
_lastNamesAssigned pushBackUnique _lastName;

missionNameSpace setVariable ["IC_facesAvailable", _facesAvailable];
missionNameSpace setVariable ["IC_firstNamesAvailable", _firstNamesAvailable];
missionNameSpace setVariable ["IC_lastNamesAvailable", _lastNamesAvailable];
missionNameSpace setVariable ["IC_facesAssigned", _facesAssigned];
missionNameSpace setVariable ["IC_firstNamesAssigned", _firstNamesAssigned];
missionNameSpace setVariable ["IC_lastNamesAssigned", _lastNamesAssigned];



[{
    params ["_unit", "_firstName", "_lastName"];

    _unit setVariable ["ACE_Name", (_firstName + " " + _lastName), true];
    _unit setVariable ["ACE_NameRaw", (_firstName + " " + _lastName), true];
    [_unit, _face, "Male01ENGB", 1.0, (_firstName + " " + _lastName), (_firstName + " " + _lastName)] remoteExec ["BIS_fnc_setIdentity", 0, true];

    systemChat format ["assigning %1 %2", _firstName, _lastName];
}, [_unit, _firstName, _lastName], 5] call CBA_fnc_waitAndExecute;


if (_unit getVariable ["IC_role", "none"] == "doctor") then {
    _unit setVariable ["grad_passport_placeofbirth", selectRandom _villagesOnMap, true]; 
    _unit setVariable ["grad_passport_passportRsc","DDR_Reisepass_Passierschein"];
} else {
    _unit setVariable ["grad_passport_placeofbirth", selectRandom _villagesGDR, true]; 
    _unit setVariable ["grad_passport_passportRsc","DDR_Reisepass"];
};