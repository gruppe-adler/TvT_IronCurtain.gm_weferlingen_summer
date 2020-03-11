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

["zen_curatorDisplayLoaded", {

        diag_log format ["curator interface opened"];

        [] call GRAD_nvaCommand_fnc_curatorClickListener;
    
}] call CBA_fnc_addEventhandler;