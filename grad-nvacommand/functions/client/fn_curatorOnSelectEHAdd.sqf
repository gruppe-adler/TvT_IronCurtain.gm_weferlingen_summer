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

        [_selectedObjects, _selectedGroups] call GRAD_nvaCommand_fnc_curatorOnSelect;
}];