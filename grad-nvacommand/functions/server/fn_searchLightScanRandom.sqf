params ["_searchLight"];

private _fakeRunner = [_searchLight] call GRAD_nvaCommand_fnc_addFakeCivilian;

{
    private _curator = _x;
    _curator removeCuratorEditableObjects [[_fakeRunner], true];
} forEach allCurators;

[{
    params ["_args", "_handle"];
    _args params ["_searchLight", "_fakeRunner"];

    private _randomPos = [[[position _searchLight, 200]],[[position _searchLight, 30]]] call BIS_fnc_randomPos;
    _randomPos set [2,0];
    _fakeRunner moveTo _randomPos;
    _fakeRunner setFatigue 0;
    _searchLight doWatch _fakeRunner;
    
}, 5, [_searchLight, _fakeRunner]] call CBA_fnc_addPerFrameHandler;