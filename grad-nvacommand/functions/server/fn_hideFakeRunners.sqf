{
    private _searchLights = missionNamespace getVariable ["GRAD_nvaCommand_searchLightList", []];
    private _fakeRunners = missionNamespace getVariable ["GRAD_nvaCommand_fakeRunners", []];
    private _curator = _x;
    _curator removeCuratorEditableObjects [_searchLights, true];
    _curator removeCuratorEditableObjects [_fakeRunners];

} forEach allCurators;