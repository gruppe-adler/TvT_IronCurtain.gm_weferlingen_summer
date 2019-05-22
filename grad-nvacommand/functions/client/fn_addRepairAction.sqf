private _types = [
    "Land_IndFnc_9_F",
    "Land_IndFnc_3_F",
    "Land_IndFnc_Corner_F"
];


{
 private _repairAction = ["ACE_MainActions", "Repair Fence", "",
 {[_player, _target] call GRAD_nvacommand_fnc_repairFence;},
  {damage _target > 0.9}
  ] call ace_interact_menu_fnc_createAction;

    [_x, 0, ["ACE_MainActions"], _repairAction] call ace_interact_menu_fnc_addActionToClass;

} forEach _types;