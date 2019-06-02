params ["_curator"];

_curator addEventHandler ["CuratorObjectSelectionChanged", {
        params ["_curator", "_entity"];


        if (GRAD_nvaCommand_zeusSelectDestinationRunning) exitWith {};

        [_entity] call GRAD_nvaCommand_fnc_curatorOnSelect;
}];