/*
// deprecated
(findDisplay 46) displayAddEventHandler ["KeyDown", {
    if (inputAction "CuratorInterface" > 0) then {

        diag_log format ["curator interface opened"];

        [] call GRAD_nvaCommand_fnc_curatorClickListener;


        {
            private _searchLights = missionNamespace getVariable ["GRAD_nvaCommand_searchLightList", []];
            private _fakeRunners = missionNamespace getVariable ["GRAD_nvaCommand_fakeRunners", []];
            private _curator = _x;
            _curator removeCuratorEditableObjects [_searchLights + _fakeRunners, true];

        } forEach allCurators;
    };
    false
}];

*/

[{
    IDD_RSCDISPLAYCURATOR = 312;
    IDC_RSCDISPLAYCURATOR_MAINMAP = 50;
    private _display = finddisplay IDD_RSCDISPLAYCURATOR;
    
    ctrlShown (_display displayCtrl IDC_RSCDISPLAYCURATOR_MAINMAP)
}, {
    if (player getVariable ["GRAD_nvacommand_isCommander", false]) then {
        IDD_RSCDISPLAYCURATOR = 312;
        IDC_RSCDISPLAYCURATOR_MAINMAP = 50;

        private _display = finddisplay IDD_RSCDISPLAYCURATOR;
        private _ctrlMap = _display displayCtrl IDC_RSCDISPLAYCURATOR_MAINMAP;
        [player, player, _display, _ctrlMap] call GRAD_nvaCommand_fnc_initMap;
    };
},[]] call CBA_fnc_waitUntilAndExecute;

["zen_curatorDisplayLoaded", {

        diag_log format ["curator interface opened"];

        [] call GRAD_nvaCommand_fnc_curatorClickListener;

        [] remoteExec ["GRAD_nvaCommand_fnc_hideFakeRunners", 2];
    
}] call CBA_fnc_addEventhandler;