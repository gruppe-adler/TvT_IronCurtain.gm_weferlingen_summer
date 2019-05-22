/*
private _callAction = ["startCall", "Call someone", "", {
    [] call GRAD_landline_fnc_callStart;
},
{true}] call ace_interact_menu_fnc_createAction;

["Land_PhoneBooth_02_F", 0, ["ACE_MainActions"], _callAction, true] call ace_interact_menu_fnc_addActionToClass;
["Land_PhoneBooth_02_malden_F", 0, ["ACE_MainActions"], _callAction, true] call ace_interact_menu_fnc_addActionToClass;
*/

params ["_object"];

if (isNull _object) exitWith { diag_log format ["GRAD_landline: cant add action to deleted object %1", _object]; };


// todo make ace interact instead of mousewheel menu
_object addAction [
    "Call Number",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

            [_target] call GRAD_landline_fnc_createPhoneList;
    },
    [],9,true,true,"",
    "[_this, _target] call GRAD_landline_fnc_conditionCall"
];

/*
// later implementation for grenzmeldenetz
_object addAction [
    "Start Call",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

            private _targetNumber = _target getVariable ["GRAD_landline_directConnect", "none"];
            private _allPhones = missionNamespace getVariable ["GRAD_LANDLINE_ALLPHONES", []];
            private _targetPhone = objNull;
            {
                private _phoneNumber = _x getVariable ["GRAD_LANDLINE_NUMBER_ASSIGNED", "none"];
                if (_targetNumber == _phoneNumber) exitWith {
                    _targetPhone = _x;
                };
            } forEach _allPhones;

            [_target, _targetPhone] call GRAD_landline_fnc_callStart;
    },
    [],9,true,true,"",
    "[_this, _target] call GRAD_landline_fnc_conditionDirectCall"
];
*/

_object addAction [
    "Accept Call",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

            [_target] call GRAD_landline_fnc_callAccept;
    },
    [],10,true,true,"",
    "[_this, _target] call GRAD_landline_fnc_conditionAccept"
];

_object addAction [
    "End Call",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        diag_log ("end call: " + str [_target, _caller, _actionId, _arguments]);


            if ([_target, 'calling'] call GRAD_landline_fnc_callGetStatus) exitWith {
                [_target, 'calling'] call GRAD_landline_fnc_callEnd;
            };

            if ([_target, 'waiting'] call GRAD_landline_fnc_callGetStatus) exitWith {
                [_target, 'waiting'] call GRAD_landline_fnc_callEnd;
            };

            if ([_target, 'busy'] call GRAD_landline_fnc_callGetStatus) exitWith {
                [_target, 'busy'] call GRAD_landline_fnc_callEnd;
            };

            if ([_target, 'ending'] call GRAD_landline_fnc_callGetStatus) exitWith {
                [_target, 'ending'] call GRAD_landline_fnc_callEnd;
            };
    },
    [],11,true,true,"",
    "[_this, _target] call GRAD_landline_fnc_conditionEnd"
];

_object addAction [
    "Show Number",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

            hint format ["%1", _target getVariable ["GRAD_LANDLINE_NUMBER_ASSIGNED","no Number"]];
    },
    [],1.5,true,true,"",
    "_this distance _target < 2"
];