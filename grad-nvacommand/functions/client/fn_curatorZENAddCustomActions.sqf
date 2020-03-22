/*
0   Action Name     STRING  
1   Display Name    STRING  
2   Icon and Icon Color     STRING or ARRAY     ["", [1, 1, 1, 1]]
3   Statement   CODE    
4   Condition   CODE    {true}
5   Arguments   ANY     []
6   Dynamic Children    CODE    {}
7   Modifier Function   CODE    {}
*/

if (!(player getVariable ["GRAD_nvacommand_isCommander", false])) exitWith {};

private _repairFence = [
    "RepairFence",
    "Repair Fence",
    "\a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    {call compile "[_objects] call GRAD_nvacommand_fnc_repairFence;"},
    {call compile "_objects findIf {alive _x && side _x == east && {_x isKindOf 'CAManBase'}} != -1"}
] call zen_context_menu_fnc_createAction;

[_repairFence, [], 0] call zen_context_menu_fnc_addAction;