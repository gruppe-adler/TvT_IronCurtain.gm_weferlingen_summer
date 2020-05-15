// #include "..\..\displays\baseRsc.hpp"

// clean up before changing anything
private _existingControls = missionNamespace getVariable ["GRAD_reinforcements_GUI", []];

{
    ctrlDelete _x;
} forEach _existingControls;


private _reinforcements = missionNamespace getVariable ["IC_reinforcements",[]];
private _display = findDisplay 312;
private _controlsCreated = [];

private _width = safeZoneW/30;
private _height = safeZoneH/20;
private _gap = safeZoneH/60;
private _fontSize = 0.01 / (getResolution select 5);


{
    
    private _groupsOfAKind = _x;
    private _horizontalIndex = _forEachIndex;
    
    {
        private _verticalIndex = _forEachIndex;
        private _name = _x getVariable ["displayName", ""];
        private _picturePath = _x getVariable ["pic", ""];
        private _completelyDead = {alive _x} count units _x < 1;

        private _outline = _display ctrlCreate ["grad_nvaCommand_RscButtonSilent", -1];
        _outline ctrlSetPosition [
            safezoneX + _width*_horizontalIndex + _gap*_horizontalIndex + _gap/2,
            safezoneY + _width*(4/3)*_verticalIndex + _gap*_verticalIndex + _gap/2, 
            _width + _gap, 
            _width*(4/3) + _gap
        ];

        _outline ctrlSetBackgroundColor [0,0,0,0];
        _outline ctrlSetFade 0;
        _outline ctrlCommit 0;


        _outline ctrlEnable true;
        // hover
        _outline ctrlAddEventHandler ["MouseOver", {
            params ["_ctrl"];

            _ctrl ctrlSetBackgroundColor [0,0,0,1];
            _ctrl ctrlCommit 0;
        }];

        _outline ctrlAddEventHandler ["MouseExit", {
            params ["_ctrl"];

            _ctrl ctrlSetBackgroundColor [0,0,0,0];
            _ctrl ctrlCommit 0;
        }];

        _outline setVariable ["ctrlAssignedGroup", _x];
        _outline ctrlAddEventHandler ["ButtonClick", {
            params ["_ctrl"];
            
            private _group = _ctrl getVariable ["ctrlAssignedGroup", grpNull];

            private _positionAboveBehind = (leader _group) getPos [75, 220];
            _positionAboveBehind set [2,50];
            [_positionAboveBehind, (leader _group), 0.5] spawn GRAD_nvacommand_fnc_curatorSetCamera;

        }];


        private _pic = _display ctrlCreate ["RscPicture", -1];
        _pic ctrlsetText _picturePath; 
        _pic ctrlSetPosition [
            safezoneX + _width*_horizontalIndex + _gap*_horizontalIndex + _gap,
            safezoneY + _width*(4/3)*_verticalIndex + _gap*_verticalIndex + _gap, 
            _width, 
            _width*(4/3)
        ];
        _pic ctrlSetBackgroundColor [0,0,0,0];
        _pic setVariable ["IC_GUI_BGCOLOR", [0,0,0,0]];
        _pic ctrlSetFade 1;
        _pic ctrlCommit 0;

        _pic ctrlSetFade 0;
        _pic ctrlCommit 0.1;


        private _label = _display ctrlCreate ["RscText", -1];
        _label ctrlSetBackgroundColor [0,0,0,0.7]; 
        _label ctrlSetFade 1;
        
        _label ctrlSetText _name;
        _label ctrlSetFontHeight _fontSize;
        _label ctrlSetPosition [
            safezoneX + _width*_horizontalIndex + _gap*_horizontalIndex + _gap, 
            safezoneY + _width*(4/3)*_verticalIndex + _width*4/3 - _width/6 + _gap*_verticalIndex + _gap, 
            _width, 
            _width/6*(4/3)
        ];
        _label ctrlCommit 0;

        _label ctrlSetFade 0;
        _label ctrlCommit 0.1;


        private _percentAlive = ({alive _x} count (units _x)) / (count (units _x));
        private _widthPercent = _width*_percentAlive;
        private _healthBar = _display ctrlCreate ["RscText", -1];
        _healthBar ctrlSetBackgroundColor [0.3,0.8,0.3,1]; 
        _healthBar ctrlSetFade 1;
        _healthBar ctrlSetPosition [
            safezoneX + _width*_horizontalIndex + _gap*_horizontalIndex + _gap, 
            safezoneY + _width*(4/3)*_verticalIndex + _gap*_verticalIndex + _gap, 
            _widthPercent, 
            _width/16*(4/3)
        ];
        _healthBar ctrlCommit 0;

        _healthBar ctrlSetFade 0;
        _healthBar ctrlCommit 0.1;

        _controlsCreated pushBackUnique _outline;
        _controlsCreated pushBackUnique _pic;
        _controlsCreated pushBackUnique _label;
        _controlsCreated pushBackUnique _healthBar;


        // dead graceful
        if (_completelyDead) then {
            _bgColor = [1,0,0,1];
            _outline ctrlCommit 3;
        };

        private _icon = if (_completelyDead) then {
            "\A3\ui_f\data\map\respawn\respawn_dead_ca.paa"
        } else {
            ""
        };
        private _status = _display ctrlCreate ["RscPicture", -1];
        _status ctrlsetText _icon; 
        _status ctrlSetPosition [
            safezoneX + _width*_horizontalIndex + _gap*_horizontalIndex + _gap,
            safezoneY + _width*(4/3)*_verticalIndex + _gap*_verticalIndex + _gap, 
            _width,
            _width*(4/3)
        ];
        _status ctrlSetFade 1;
        _status ctrlCommit 0;

        _status ctrlSetFade 0;
        _status ctrlCommit 0.1;

    } forEach _groupsOfAKind;
    
} forEach _reinforcements;

missionNamespace setVariable ["GRAD_reinforcements_GUI", _controlsCreated];

sleep 10;

{
    ctrlDelete _x;
} forEach _controlsCreated