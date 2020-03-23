/*
    
    reference: https://github.com/zen-mod/ZEN/blob/master/addons/context_actions/CfgContext.hpp#L181

*/

if (!(player getVariable ["GRAD_nvacommand_isCommander", false])) exitWith {};

{
    [_x] call zen_context_menu_fnc_removeAction;
} forEach 
[
    "HealUnits",
    "Stance",
    "Loadout",
    "EditableObjects",
    "RemoteControl",
    "Inventory",
    "VehicleAppearance",
    "TeleportZeus",
    "TeleportPlayers",
    "Captives",
    "VehicleLogistics",
    "zen_area_markers"
];