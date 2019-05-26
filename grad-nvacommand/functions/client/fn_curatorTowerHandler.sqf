params ["_curator"];

_curator addEventHandler ["CuratorObjectSelectionChanged", {
        params ["_curator", "_entity"];

        [_entity] call GRAD_nvaCommand_fnc_curatorOnClick;
}];