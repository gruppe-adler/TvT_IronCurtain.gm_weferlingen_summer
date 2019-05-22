/*

	can be called out of 3DEN init of object:

	[this] call GRAD_landline_fnc_addPhone;

	* Arguments:
	* Object which will get the phone functionality <object>
	* If the phone is a rotary phone <bool> <optional>
	* Force Number which will be assigned <string> <optional>
	* Force Number which – when set – is the only number automatically called (for one directional phone system) <string> <optional>

*/


params ["_object", ["_number", "none"], ["_isRotary", false], ["_canOnlyCallNumber", "none"]];


if (!isServer) exitWith {};


private _id = missionNamespace getVariable ["GRAD_landline_phoneCount", 0];
_id = _id + 1;
missionNamespace setVariable ["GRAD_landline_phoneCount", _id, true];

_object setVariable ["GRAD_landline_isPhone", true, true];
_object setVariable ["GRAD_landline_phoneID", _id, true];
_object setVariable ["GRAD_landline_isRotary", _isRotary, true];

if (_canOnlyCallNumber != "none") then {
    _object setVariable ["GRAD_landline_directConnect", _canOnlyCallNumber, true];
};


[_object, _number] call GRAD_landline_fnc_assignPhoneNumber;
[_object, "idle"] call GRAD_landline_fnc_callSetStatus;

[_object] remoteExec ["GRAD_landline_fnc_addAction", [0,-2] select isDedicated, true];