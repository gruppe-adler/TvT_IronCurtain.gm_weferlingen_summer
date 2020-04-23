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

        /* zen code helps here */

        [{
            IDD_RSCDISPLAYCURATOR = 312;
            IDC_RSCDISPLAYCURATOR_ADD = 450;
            IDC_RSCDISPLAYCURATOR_POINTS = 111;
            IDC_RSCDISPLAYCURATOR_MISSION = 453;
            IDC_RSCDISPLAYCURATOR_ADDBAR = 16805;
            IDC_RSCDISPLAYCURATOR_MISSIONBAR = 16809;
            IDC_RSCDISPLAYCURATOR_POINTSFRAME = 16306;
            IDC_RSCDISPLAYCURATOR_POINTSBACKGROUND = 15513;
            IDC_RSCDISPLAYCURATOR_LOGO = 15715;

            (findDisplay IDD_RSCDISPLAYCURATOR displayCtrl IDC_RSCDISPLAYCURATOR_ADD) ctrlShow false;
            (findDisplay IDD_RSCDISPLAYCURATOR displayCtrl IDC_RSCDISPLAYCURATOR_POINTS) ctrlShow false;
            (findDisplay IDD_RSCDISPLAYCURATOR displayCtrl IDC_RSCDISPLAYCURATOR_POINTSFRAME) ctrlShow false;
            (findDisplay IDD_RSCDISPLAYCURATOR displayCtrl IDC_RSCDISPLAYCURATOR_MISSION) ctrlShow false;
            (findDisplay IDD_RSCDISPLAYCURATOR displayCtrl IDC_RSCDISPLAYCURATOR_ADDBAR) ctrlShow false;
            (findDisplay IDD_RSCDISPLAYCURATOR displayCtrl IDC_RSCDISPLAYCURATOR_MISSIONBAR) ctrlShow false;
            (findDisplay IDD_RSCDISPLAYCURATOR displayCtrl IDC_RSCDISPLAYCURATOR_POINTSBACKGROUND) ctrlShow false;
            (findDisplay IDD_RSCDISPLAYCURATOR displayCtrl IDC_RSCDISPLAYCURATOR_LOGO) ctrlShow false;

            IDD_RSCDISPLAYCURATOR = 312; 
            private _display = findDisplay IDD_RSCDISPLAYCURATOR; 
            private _controlsGroup = _display ctrlCreate ["RscControlsGroup", -1]; 
            private _button = _display ctrlCreate ["GRAD_landline_RscButton", 3002, _controlsGroup]; 

             _controlsGroup ctrlSetPosition [
                safeZoneW - 0.2, 
                safeZoneH - 0.2, 
                0.15, 
                0.1];
             _controlsGroup ctrlSetBackgroundColor [1,0,0,0.5]; 
             _controlsGroup ctrlCommit 0;

            _button ctrlSetText "Anruf annehmen";
            _button ctrlSetPosition [ 
                0, 
                0, 
                0.15, 
                0.1 
            ]; 
            _button ctrlCommit 0;

            _button ctrlSetEventHandler ["ButtonClick", "[_this select 0] call GRAD_landline_fnc_curatorTogglePhone;"];

            _button ctrlCommit 0;

            [{
                params ["_args", "_handle"];
                _args params ["_button"];

                if (isNull _button) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

                _button ctrlSetText "...";
                _button ctrlEnable false;

                if (player getVariable ["GRAD_landline_phoneStatus", "idle"] == "ringing") then {
                    _button ctrlSetText "Anruf annehmen";
                    _button ctrlEnable true;
                };

                if ([player, player] call GRAD_landline_fnc_conditionEnd) then {
                    _button ctrlSetText "Anruf beenden";
                    _button ctrlEnable true;
                };

            }, 1, [_button]] call CBA_fnc_addPerFrameHandler;


        }, []] call CBA_fnc_execNextFrame;
    
}] call CBA_fnc_addEventhandler;