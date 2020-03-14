/*

    needs ZEN mod to work, custom map idd/idc

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

        [] remoteExec ["GRAD_nvaCommand_fnc_hideFakeRunners", 2];
    
}] call CBA_fnc_addEventhandler;