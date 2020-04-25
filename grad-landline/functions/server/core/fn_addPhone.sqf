/*

	can be called out of 3DEN init of object:

	[this] call GRAD_landline_fnc_addPhone;

	* Arguments:
	* Object which will get the phone functionality <object>
	* If the phone is a rotary phone <bool> <optional>
	* Force Number which will be assigned <string> <optional>
	* Force Number which – when set – is the only number automatically called (for one directional phone system) <string> <optional>

*/


params [["_object", objNull], ["_number", "none"], ["_isRotary", false], ["_canOnlyCallNumber", "all"], ["_hasPublicPhoneBookEntry", false], ["_position", [0,0,0]]];

if (!isServer) exitWith {};

if (isNull _object) exitWith { diag_log format ["addPhone error: no object"]; };

if (_position isEqualTo [0,0,0]) then {
   _position = position _object;
};

private _id = missionNamespace getVariable ["GRAD_landline_phoneCount", 0];
_id = _id + 1;
missionNamespace setVariable ["GRAD_landline_phoneCount", _id, true];

_object setVariable ["GRAD_landline_isPhone", true, true];
_object setVariable ["GRAD_landline_phoneID", _id, true];
_object setVariable ["GRAD_landline_isRotary", _isRotary, true];
_object setVariable ["GRAD_landline_skipDialing", _canOnlyCallNumber != "all", true];
_object setVariable ["GRAD_landline_hasPublicPhoneBookEntry", _hasPublicPhoneBookEntry, true];
_object setVariable ["GRAD_landline_phonePosition", _position];

// zeus & direct call
if (_canOnlyCallNumber != "all") then {
    _object setVariable ["GRAD_landline_directConnect", _canOnlyCallNumber, true];
};

[_object, _number] call GRAD_landline_fnc_assignNumber;
[_object, "idle"] call GRAD_landline_fnc_callSetStatus;


// zeus phone will receive extra action, not here
if (_canOnlyCallNumber != "none" || _hasPublicPhoneBookEntry) then {
    [_object] remoteExec ["GRAD_landline_fnc_addAction", [0,-2] select isDedicated, true];
};
