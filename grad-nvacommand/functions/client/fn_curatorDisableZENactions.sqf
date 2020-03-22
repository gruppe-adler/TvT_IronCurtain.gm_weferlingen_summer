if (!(player getVariable ["GRAD_nvacommand_isCommander", false])) exitWith {};

{
    [_x] call zen_context_menu_fnc_removeAction;
} forEach 
[
    "Heal",
    "Stance",
    "Loadout",
    "Editable Objects",
    "Remote Control",
    "Inventory",
    "Vehicle Appearance",
    "Teleport Zeus",
    "Remote Control",
    "Captives"
];