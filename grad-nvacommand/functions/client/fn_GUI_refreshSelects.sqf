private _allGUISelects = uiNamespace getVariable ["GRAD_nvaCommand_allGUISelects",[]];
private _allTowers =  missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];

{
    private _control = _x;
    private _towerID = _control getVariable ["IC_GUI_TOWERASSIGNED", -1];
    private _tower = _allTowers select _towerID;

    // set all controls to default state
    _control ctrlSetBackgroundColor (_control getVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]]);
    _control ctrlSetTextColor (_control getVariable ["IC_GUI_TEXTCOLOR", [1,1,1,0.7]]);
    
    // set colors control for selected and alarmed
    if (missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull] == _tower) then {

         // active control is white with black/red text
        if ([_tower] call GRAD_nvacommand_fnc_towerIsAlarmed) then {
            _control ctrlSetBackgroundColor [1,1,1,1];
            _control ctrlSetTextColor [1,.1,.1,1];
            _control setVariable ["IC_GUI_BGCOLOR", [1,1,1,1]];
            _control setVariable ["IC_GUI_TEXTCOLOR", [1,.1,.1,1]];
        } else {
            _control ctrlSetBackgroundColor [0,0,0,1];
            _control ctrlSetTextColor [1,1,1,1];
            _control setVariable ["IC_GUI_BGCOLOR", [0,0,0,1]];
            _control setVariable ["IC_GUI_TEXTCOLOR", [1,1,1,1]];
        };
    } else {
        // inactive control is black/red backgrounded with dimmed white text
        if ([_tower] call GRAD_nvacommand_fnc_towerIsAlarmed) then {
            _control ctrlSetBackgroundColor [1,.1,.1,1];
            _control ctrlSetTextColor [1,1,1,0.7];
            _control setVariable ["IC_GUI_BGCOLOR", [1,.1,.1,1]];
            _control setVariable ["IC_GUI_TEXTCOLOR", [1,1,1,0.7]];
        } else {
            _control ctrlSetBackgroundColor [0,0,0,0.5];
            _control ctrlSetTextColor [1,1,1,0.7];
            _control setVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]];
            _control setVariable ["IC_GUI_TEXTCOLOR", [1,1,1,0.7]];
        };
    };
} forEach _allGUISelects;