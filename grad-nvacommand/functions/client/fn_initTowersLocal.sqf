/*
    not in use currently
*/


// add towers to all curators to edit/access

// fucking flare does not rotate :(
/*
private _towers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];

{
    private _tower = _x;
    private _searchLight = _tower getVariable ["GRAD_nvaCommand_towerSearchLight", objNull];
    private _light = "#lightpoint" createVehicleLocal position _searchLight;
    _light setLightBrightness 1.0;
    _light setLightAmbient [0.0, 0.0, 0.0];
    _light setLightColor [1.0, 1.0, 1.0];
    _light lightAttachObject [_searchLight, [0,1.2,0.7]];
    // _light attachTo [_searchLight, [0,0.5,0],"MainTurret_Coax"];
    // memoryPointGun = "MainTurret_Coax";
    // memoryPointGunnerOutOptics = "OpticOut_MainTurret_pos";
    // memoryPointsGetInGunnerDir = "MainTurret_getin_dir";
    // memoryPointMissile[] = {"MainTurret_Gun_dir","MainTurret_Missile_dir"};
    _light setLightUseFlare true;
    _light setLightFlareSize 7;
    _light setLightFlareMaxDistance 700;

} forEach _towers;
*/


if (!(player getVariable ["GRAD_nvacommand_isCommander", false])) exitWith {};



[{
    private _towers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];
    count _towers > 0 && !isNil "GRAD_reinforcements_initDone"
},{
    
    {
        _curator = _x;
        systemChat "NVA Zeus now available";

        // make curator selectable
        [_curator] call GRAD_nvaCommand_fnc_curatorOnSelectEHAdd; // add curator on select eh
        [] call GRAD_nvaCommand_fnc_curatorInterfaceDetection;

    
        { 
            private _towerID = _x getVariable ["GRAD_nvaCommand_towerID", -1];
           [ _curator, ["", [1,1,1,1], position _x, 1, 1, 45, format ["BT-11 - %1", _towerID], 1, 0.05, "TahomaB"], false ] call BIS_fnc_addCuratorIcon;
        } forEach _towers;

        _curator addEventHandler ["CuratorObjectRegistered", {
            params ["_curator", "_input"];
            private _output = [];
            {
                _output pushBack [false,0,0];
            } forEach _input;
            _output
        }];
    } forEach allCurators;
}] call CBA_fnc_waitUntilAndExecute;


/*
private _towers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];

{
	private _marker = createMarkerLocal [format ["mrk_towerActive_%1", _x], position _x];
	_marker setMarkerShapeLocal "Icon";
	_marker setMarkerTypeLocal "Select";
	_marker setMarkerAlphaLocal 0;
} forEach _towers;
*/