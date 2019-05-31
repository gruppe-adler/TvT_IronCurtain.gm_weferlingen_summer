params ["_newTower", "_searchLight"];

private _fakeRunner = [_searchLight] call GRAD_nvaCommand_fnc_addFakeCivilian;
private _dummyTarget = _newTower getVariable ["GRAD_nvaCommand_towerDummyTarget", objNull];

private _fakeRunners = missionNamespace getVariable ["GRAD_nvaCommand_fakeRunners", []];
_fakeRunners pushBackUnique [_fakeRunner];
missionNamespace getVariable ["GRAD_nvaCommand_fakeRunners", _fakeRunners, true];

[{
    params ["_args", "_handle"];
    _args params ["_newTower", "_dummyTarget", "_searchLight", "_fakeRunner"];

    private _watchModeAuto = _newTower getVariable ["GRAD_nvaCommand_towerWatchMode", "auto"] == "auto";


    if (_watchModeAuto) then {
        private _randomPos = [[[position _searchLight, 200]],[[position _searchLight, 30]]] call BIS_fnc_randomPos;
        _randomPos set [2,0];
        _fakeRunner moveTo _randomPos;
        _fakeRunner setFatigue 0;
        _searchLight doWatch _fakeRunner;
    } else {
        doStop _fakeRunner;
        _searchLight doWatch _dummyTarget;
    };


    
}, 1, [_newTower, _dummyTarget, _searchLight, _fakeRunner]] call CBA_fnc_addPerFrameHandler;