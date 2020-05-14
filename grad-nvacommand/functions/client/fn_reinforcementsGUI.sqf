private _reinforcements = missionNamespace getVariable ["IC_reinforcements",[]];

private _display = findDisplay 312;
#include "..\..\displays\baseRsc.hpp"

private _controlsCreated = [];

{
    private _count = [_x] call GRAD_reinforcements_fnc_getMaxCount;
    private _name = [_x] call GRAD_reinforcements_fnc_getDisplayName;
    private _width = safeZoneW/30;
    private _height = safeZoneH/20;
    private _gap = safeZoneH/60;
    private _fontSize = 0.01 / (getResolution select 5);

    for "_i" from 0 to _count do {

        private _outline = _display ctrlCreate ["grad_nvaCommand_RscButton", -1];
        _outline ctrlSetPosition [
            safezoneX + _width*_forEachIndex + _gap*_forEachIndex + _gap/2,
            safezoneY + _width*(4/3)*_i + _gap*_i + _gap/2, 
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


        private _pic = _display ctrlCreate ["RscPicture", -1];
        _pic ctrlsetText "grad-nvacommand\displays\bt11.jpg"; 
        _pic ctrlSetPosition [
            safezoneX + _width*_forEachIndex + _gap*_forEachIndex + _gap,
            safezoneY + _width*(4/3)*_i + _gap*_i + _gap, 
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
            safezoneX + _width*_forEachIndex + _gap*_forEachIndex + _gap, 
            safezoneY + _width*(4/3)*_i + _width*4/3 - _width/6 + _gap*_i + _gap, 
            _width, 
            _width/6*(4/3)
        ];
        _label ctrlCommit 0;

        _label ctrlSetFade 0;
        _label ctrlCommit 0.1;

        _controlsCreated pushBackUnique _outline;
        _controlsCreated pushBackUnique _pic;
        _controlsCreated pushBackUnique _label;
    };
    
} forEach _reinforcements;



sleep 10;

{
    ctrlDelete _x;
} forEach _controlsCreated