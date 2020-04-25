params ["_unit"];

private _facesAssigned = missionNamespace getVariable ["IC_facesAssigned", []];
private _firstNamesAssigned = missionNamespace getVariable ["IC_firstNamesAssigned", []];
private _lastNamesAssigned = missionNamespace getVariable ["IC_lastNamesAssigned", []];

private _facesAvailable = missionNameSpace getVariable ["IC_facesAvailable", []];
private _firstNamesAvailable = missionNameSpace getVariable ["IC_firstNamesAvailable", []];
private _lastNamesAvailable = missionNameSpace getVariable ["IC_lastNamesAvailable", []];


private ["_face", "_firstName", "_lastName"];


if (IC_customFaceAllowSame) then {
  _face = selectRandom _facesAvailable;
} else {
  _face = selectRandom (_facesAvailable select { !(_x in _facesAssigned)}; );
};

if (IC_firstNameAllowSame) then {
  _firstName = selectRandom _firstNamesAvailable;
} else {
  _face = selectRandom (_firstNamesAvailable select { !(_x in _firstNamesAssigned)}; );
  };

if (IC_lastNameAllowSame) then {
  _lastName = selectRandom _lastNamesAvailable;
} else {
  _face = selectRandom (_lastNamesAvailable select { !(_x in _lastNamesAssigned)}; );
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

[_unit, _face, "Male01ENGB", 1.0, (_firstName + " " + _lastName)] remoteExec ["BIS_fnc_setIdentity", 0, true];


_unit setVariable ["grad_passport_serial", _passportNumber, true];
_unit setVariable ["grad_passport_passportRsc","DDR_Reisepass"];
