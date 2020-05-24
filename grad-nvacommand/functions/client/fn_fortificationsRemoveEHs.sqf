uiNamespace getVariable ["grad_nvacommand_buildInterface", displayNull] displayRemoveEventHandler ["MouseZChanged",grad_nvacommand_fortifications_mousewheelEH];
uiNamespace getVariable ["grad_nvacommand_buildInterface", displayNull] displayRemoveEventHandler ["MouseButtonUp",grad_nvacommand_fortifications_mousebuttonEH];
uiNamespace getVariable ["grad_nvacommand_buildInterface", displayNull] displayRemoveEventHandler ["KeyDown",grad_nvacommand_fortifications_keydownEH];
uiNamespace getVariable ["grad_nvacommand_buildInterface", displayNull] displayRemoveEventHandler ["KeyUp",grad_nvacommand_fortifications_keyupEH];

[grad_nvacommand_fortifications_updatePFH] call CBA_fnc_removePerFrameHandler;
[grad_nvacommand_fortifications_checkCollisionPFH] call CBA_fnc_removePerFrameHandler;

ACE_player removeAction grad_fortifications_fireOverride;

uiNamespace getVariable ["grad_nvacommand_buildInterface", displayNull] closeDisplay 1;