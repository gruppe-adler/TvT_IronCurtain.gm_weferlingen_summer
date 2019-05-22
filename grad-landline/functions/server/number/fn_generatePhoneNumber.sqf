/* 
	server
*/

// generates unique number for object

/* 
*
* author: nomisum
* generates random phone number but not one from the given array 
*
*/
#include "..\..\..\config.hpp"

params ["_phoneList"];


private _result = [];

// check if generated number already exists
while {true} do {

	private _phonePrefixCurrent = [str (selectRandom GRAD_LANDLINE_NUMBER_PREFIXES)] call GRAD_landline_fnc_extractNumberFromPrefix;
	private _phoneBaseNumber = [GRAD_LANDLINE_NUMBER_LENGTH select 0, GRAD_LANDLINE_NUMBER_LENGTH select 1] call GRAD_landline_fnc_generateBaseNumber;

	_result = _phonePrefixCurrent + _phoneBaseNumber;

	if (_phoneList find _result == -1) exitWith {};

    systemChat format ["exiting with %1 ", _result];
};

private _endResult = "";

if (GRAD_LANDLINE_DEBUG_MODE) then { diag_log format ["generatePhoneNumber: %1", _result]; };

{
  _endResult = _endResult + str _x;
} forEach _result;

systemChat format ["endresult is %1 ", _endResult];

_endResult