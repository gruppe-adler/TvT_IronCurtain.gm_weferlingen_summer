params ["_curator"];

_curator addEventHandler ["CuratorObjectSelectionChanged", {
        params ["_curator", "_entity"];


        if (GRAD_nvaCommand_zeusSelectDestinationRunning) exitWith {};

        curatorSelected params ["_selectedObjects", "_selectedGroups"];

        systemChat ("selectionChanged " + str _selectedObjects + str _selectedGroups);

        // fill groups if player selects only the vehicle or individual units
        if (count _selectedGroups < 1 && count _selectedObjects > 0) then {
            {
                private _group = group _x;
                if (!isNull _group) then {
                    _selectedGroups pushBackUnique group _x;
                };
            } forEach _selectedObjects;
        };

        /*
        private _selectedObjectsFiltered = [];
        // if objects are also in groups selected, discard them
        {
            private _unit = _x;

            if (_selectedGroups find group _unit < 0) then {
                _selectedObjectsFiltered pushBackUnique _unit;
            };
        } forEach _selectedObjects;

        [_selectedObjectsFiltered, _selectedGroups] call GRAD_nvaCommand_fnc_curatorOnSelect;
        */
        [_selectedObjects, _selectedGroups] call GRAD_nvaCommand_fnc_curatorOnSelect;
}];

_curator setCuratorCoef ["delete", -1e10];
_curator setCuratorCoef ["edit", -1e10];

_curator addEventHandler ["CuratorFeedbackMessage", {
    params ["_curator", "_errorID"];

    // suppress feedback
    missionnamespace setvariable ["bis_fnc_showcuratorfeedbackmessage_time",time + 3];
}];