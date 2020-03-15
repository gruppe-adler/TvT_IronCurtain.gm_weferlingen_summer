if (!(player getVariable ["GRAD_nvacommand_isCommander", false])) exitWith {};

private _allGUISelects = uiNamespace getVariable ["GRAD_nvaCommand_allGUISelects",[]];
private _allUIGroup = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIGROUP",[]];
private _allTowers =  missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];
private _uiElements = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS",[]];



{
    private _control = _x;
    private _towerID = _control getVariable ["IC_GUI_TOWERASSIGNED", -1];
    private _tower = _allTowers select _towerID;


    // set all controls to default state
    _control ctrlSetBackgroundColor (_control getVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]]);
    _control ctrlSetTextColor (_control getVariable ["IC_GUI_TEXTCOLOR", [1,1,1,0.7]]);
    
    // set colors control for selected and alarmed
    if (missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull] == _tower) then {

        _uiElements params ["_towerLabel", "_towerPic", "_towerPicLabel", "_towerButtonCenter", "_towerButtonAlarm", "_towerButtonDoWatch"];

        private _manCountTower = _tower getVariable ["GRAD_nvaCommand_towerIsManned", 0];
        private _manUnits = _tower getVariable ["GRAD_nvaCommand_towerUnits", []];
        {
            if (_manCountTower > _forEachIndex) then {
                _x ctrlsetText "grad-nvacommand\displays\alarmgroup.jpg";
            } else {
                // out of bounds error
                if (count _manUnits < (_forEachIndex - 1)) exitWith {
                    _x ctrlSetText "grad-nvacommand\displays\alarmgroup_away.jpg";
                };

                if (!alive (_manUnits select _forEachIndex)) then {
                    _x ctrlSetText "grad-nvacommand\displays\alarmgroup_dead.jpg";
                } else {
                    _x ctrlSetText "grad-nvacommand\displays\alarmgroup_away.jpg";
                };
            };
        } forEach _allUIGroup;

        if ([_tower] call GRAD_nvacommand_fnc_towerIsAlarmed) then {
            _towerButtonAlarm ctrlSetBackgroundColor [1,1,1,1];
            _towerButtonAlarm ctrlSetTextColor [1,.1,.1,1];
            _towerButtonAlarm setVariable ["IC_GUI_BGCOLOR", [1,1,1,1]];
            _towerButtonAlarm setVariable ["IC_GUI_TEXTCOLOR", [1,.1,.1,1]];
        } else {
            _towerButtonAlarm ctrlSetBackgroundColor [0,0,0,1];
            _towerButtonAlarm ctrlSetTextColor [1,1,1,1];
            _towerButtonAlarm setVariable ["IC_GUI_BGCOLOR", [0,0,0,1]];
            _towerButtonAlarm setVariable ["IC_GUI_TEXTCOLOR", [1,1,1,1]];
        };
        _towerButtonAlarm ctrlCommit 0;

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