params ["_object"];

player setVariable ["GRAD_landline_objCaller", _object];

createDialog "grad_landline_rscPhoneBook";
waitUntil {dialog};

private _dialog = uiNamespace getVariable ['grad_landline_rscPhoneBook',controlNull];

if (isNull _dialog) exitWith { hint "something went wrong"; };



// fill phonelist
private _phoneList = _dialog displayCtrl 1000;
private _allNumbers = missionNamespace getVariable ["GRAD_LANDLINE_ALLNUMBERS", []];

private _allMarkers = [];
{
    _x params ["_number", "_objectsArray"];

    private _hasPublicPhoneBookEntry = (_objectsArray select 0) getVariable ["GRAD_landline_hasPublicPhoneBookEntry", false];
    private _position = (_objectsArray select 0) getVariable ["GRAD_landline_phonePosition", [0,0,0]];

    if (_hasPublicPhoneBookEntry) then {
        
        private _identifier = _phoneList lbAdd _number;
        _phoneList setVariable [str _identifier, _objectsArray];
        // lbSetTooltip [1000, _identifier, str _objectsArray]; // more debug than anything else currently

        _position params ["_xPos", "_yPos"];
        private _marker = createMarkerLocal [format ["mrk_grad_landlinePhone_%1", [_xPos,_yPos]],[_xPos,_yPos]];
        _marker setMarkerShapeLocal "ICON";
        _marker setMarkerTypeLocal "mil_marker";
        _marker setMarkerColorLocal "ColorYellow";
        _marker setMarkerDirLocal 180;

        _allMarkers pushBack _marker;
    };

} forEach _allNumbers;

lbSetCurSel [_phoneList, 0];

// set initial position of selection marker
_allNumbers params ["_firstNumber"];
_firstNumber params ["_number", "_objectsArray"];
_objectsArray params ["_firstObject"];
_firstObject getVariable ["GRAD_landline_phonePosition", [0,0,0]] params ["_xPos", "_yPos"];

private _selectionMarker = createMarkerLocal ["mrk_grad_landlinePhoneSelect",[_xPos,_yPos]];
_selectionMarker setMarkerShapeLocal "ICON";
_selectionMarker setMarkerTypeLocal "Select";


private _button = _dialog displayCtrl 3000;

// store elements to delete them later on
player setVariable ["GRAD_landline_phoneList", [_phoneList, _button]];
player setVariable ["GRAD_landline_markerList", _allMarkers];


// _selectionMarker setMarkerPosLocal (getMarkerPos (_allMarkers select (lbCurSel 2000)));

_button ctrlAddEventHandler ["ButtonClick", {
        params ["_ctrl"];

        private _dialog = uiNamespace getVariable ['grad_landline_rscPhoneBook',controlNull];
        private _phoneList = _dialog displayCtrl 1000;

        private _selectionIndex = lbCurSel _phoneList;
        systemChat format ["%1", _selectionIndex];

        private _receiverObjects = _phoneList getVariable [str _selectionIndex, []];

        diag_log format ["button _receiverObjects %1", _receiverObjects];

        private _objCaller = player getVariable ["GRAD_landline_objCaller", objNull];

        [_objCaller, _receiverObjects] call GRAD_landline_fnc_callStart;

        // debug
        private _selectionMarker = createMarkerLocal ["mrk_grad_landlinePhoneCaller", position _objCaller];
        _selectionMarker setMarkerShapeLocal "ICON";
        _selectionMarker setMarkerTypeLocal "mil_dot";
        _selectionMarker setMarkerColorLocal "ColorGreen";

        private _selectionMarker = createMarkerLocal ["mrk_grad_landlinePhoneReceiver", position (_receiverObjects select 0)];
        _selectionMarker setMarkerShapeLocal "ICON";
        _selectionMarker setMarkerTypeLocal "mil_dot";
        _selectionMarker setMarkerColorLocal "ColorRed";

        player setVariable ["GRAD_landline_objCaller", objNull];

        closeDialog 0;
}];
