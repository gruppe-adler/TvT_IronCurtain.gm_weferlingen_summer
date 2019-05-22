params ["_map", "_tower"];


private _btn = (ctrlParent _map) ctrlCreate ["RscButton", -1];
_btn ctrlSetText "Raise Alarm";
_btn ctrlSetPosition [0,0,0.3,0.08];
_btn ctrlSetPosition (_map posWorldToScreen (position _tower));
_btn ctrlSetBackgroundColor [0,0,0,1];
_btn ctrlCommit 0;


private _marker = createMarkerLocal ["mrk_towerSelected", position _tower];
_marker setMarkerShapeLocal "Icon";
_marker setMarkerTypeLocal "Select";

_btn setVariable ["GRAD_nvacommand_ctrlTowerAssociated", _tower];
_btn setVariable ["GRAD_nvacommand_ctrlTowerMarkerAssociated", _tower];

_btn ctrlAddEventHandler ["MouseButtonClick", {
        params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

        private _tower = _control getVariable ["GRAD_nvacommand_ctrlTowerAssociated", objNull];
        if (!isNull _tower) then {
                [_tower] remoteExec ["GRAD_nvacommand_fnc_towerAlarm",2];
        };
}];

player setVariable ["GRAD_nvacommand_towersSelectedBtn", _btn];

[{
    params ["_args", "_handle"];
    _args params ["_btn", "_map", "_tower", "_marker"];

    if (isNull (player getVariable ["GRAD_nvacommand_towersSelectedBtn", controlNull])) exitWith {
        [_handle] call CBA_fnc_removePerFramehandler;
        if (_marker != "") then {
            deleteMarkerLocal _marker;
        };
        ctrlDelete _btn;

    };

    _btn ctrlSetPosition (_map posWorldToScreen (position _tower));
    _btn ctrlCommit 0;
    
}, 0, [_btn, _map, _tower, _marker]] call CBA_fnc_addPerFramehandler;

