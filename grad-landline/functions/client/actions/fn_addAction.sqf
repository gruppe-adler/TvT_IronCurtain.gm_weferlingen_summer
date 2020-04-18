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
    "Nummer wählen",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

            [_target] call GRAD_landline_fnc_createPhoneList;
    },
    [],9,true,true,"",
    "[_this, _target] call GRAD_landline_fnc_conditionCall"
];

// later implementation for grenzmeldenetz
_object addAction [
    "Kommandozentrale anrufen",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

            private _targetNumber = _target getVariable ["GRAD_landline_directConnect", "all"];
            private _allPhones = missionNamespace getVariable ["GRAD_LANDLINE_ALLPHONES", []];
            private _targetPhone = objNull;
            {
                private _phoneNumber = _x getVariable ["GRAD_LANDLINE_NUMBER_ASSIGNED", "all"];
                if (_targetNumber == _phoneNumber) exitWith {
                    _targetPhone = _x;
                };
            } forEach _allPhones;

            [_target, [_targetPhone]] call GRAD_landline_fnc_callStart;
    },
    [],9,true,true,"",
    "[_this, _target] call GRAD_landline_fnc_conditionDirectCall"
];


_object addAction [
    "Anruf annehmen",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

            [_target] call GRAD_landline_fnc_callAccept;
    },
    [],10,true,true,"",
    "[_this, _target] call GRAD_landline_fnc_conditionAccept"
];

_object addAction [
    "Anruf beenden",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        diag_log ("end call: " + str [_target, _caller, _actionId, _arguments]);

        private _state = _target getVariable ["GRAD_landline_phoneStatus", "idle"];
        [_target, _state] call GRAD_landline_fnc_callEnd;
    },
    [],11,true,true,"",
    "[_this, _target] call GRAD_landline_fnc_conditionEnd"
];

_object addAction [
    "Nummer des Apparats anzeigen",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

            hint format ["%1", _target getVariable ["GRAD_LANDLINE_NUMBER_ASSIGNED","no Number"]];
    },
    [],1.5,true,true,"",
    "_this distance _target < 2 && !(_target getVariable ['GRAD_landline_skipDialing', false])"
];
