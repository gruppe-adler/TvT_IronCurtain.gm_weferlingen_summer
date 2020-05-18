// temporary and/or permanent changes to thumbnail as event feedback
["GRAD_reinforcements_GUIEvent", {
    params ["_group", "_type"];

    systemChat ("Received Event " + str _type);

    if (isNull _group) exitWith {
        if (_type == "deselected") then {
            private _reinforcements = missionNamespace getVariable ["IC_reinforcements",[]];
            {
                private _groupsOfAKind = _x;
                {
                    private _outline = _x getVariable ["GRAD_reinforcements_GUI_ctrlOutline", controlNull];
                    _outline ctrlSetBackgroundColor [0,0,0,0];
                    _outline ctrlCommit 0;
                } forEach _groupsOfAKind;
            } forEach _reinforcements;
        };
    };

    private _outline = _group getVariable ["GRAD_reinforcements_GUI_ctrlOutline", controlNull];
    private _pic = _group getVariable ["GRAD_reinforcements_GUI_ctrlPic", controlNull];
    private _label = _group getVariable ["GRAD_reinforcements_GUI_ctrlLabel", controlNull];
    private _healthBar = _group getVariable ["GRAD_reinforcements_GUI_ctrlHealth", controlNull];
    private _statusTopLeft = _group getVariable ["GRAD_reinforcements_GUI_ctrlStatusTopLeft", controlNull];
    private _statusTopRight = _group getVariable ["GRAD_reinforcements_GUI_ctrlStatusTopRight", controlNull];
    private _button = _group getVariable ["GRAD_reinforcements_GUI_ctrlButton", controlNull];

    private _aliveCount = count units _group;
    private _percentAlive = 0;

    if (_aliveCount > 0) then {
        _percentAlive = ({alive _x} count (units _group)) / (count (units _group));
    };

    private _width = safeZoneW/30;
    private _widthPercent = _width*_percentAlive;
    private _position = ctrlPosition _healthBar;
    _position params ["_posX", "_posY", "_width", "_height"];

    _healthBar ctrlSetPosition [
        _posX, 
        _posY, 
        _widthPercent, 
        _height
    ];
    _healthBar ctrlCommit 0;

    // systemChat str _outline;

    switch (_type) do {
        case "respawned": {
            [_outline, [1,1,1,0], [0.3,1,0.3,1], 2, 0.25] spawn GRAD_reinforcements_fnc_GUIflash;
        };
        case "selected": {
            _outline ctrlSetBackgroundColor [1,1,1,1];
            _outline ctrlCommit 0;
        };
        case "getInCrew": {
            _statusTopLeft ctrlSetText "";
            _statusTopLeft ctrlCommit 0;
            [_outline, [1,1,1,0], [1,1,1,1], 2, 0.25] spawn GRAD_reinforcements_fnc_GUIflash;
        };
        case "getOutCrew": {
            _statusTopLeft ctrlSetText "\A3\ui_f\data\IGUI\Cfg\VehicleToggles\WheelBreakIconOn_ca.paa";
            _statusTopLeft ctrlCommit 0;
            [_outline, [1,1,1,0], [1,1,1,1], 2, 0.25] spawn GRAD_reinforcements_fnc_GUIflash;
        };
        case "getInCargo": {
            _statusTopLeft ctrlSetText "";
            _statusTopLeft ctrlCommit 0;
            [_outline, [1,1,1,0], [1,1,1,1], 2, 0.25] spawn GRAD_reinforcements_fnc_GUIflash;
        };
        case "getOutCargo": {
            _statusTopLeft ctrlSetText "\A3\ui_f\data\IGUI\Cfg\MPTable\infantry_ca.paa";
            _statusTopLeft ctrlCommit 0;
            [_outline, [1,1,1,0], [1,1,1,1], 2, 0.25] spawn GRAD_reinforcements_fnc_GUIflash;
        };
        case "firing" : {  
            [_outline, [1,1,1,0], [0,1,1,1], 2, 0.25] spawn GRAD_reinforcements_fnc_GUIflash;
        }; 
        case "damaged" : {
            [_outline, [1,1,1,0], [1,0,0,1], 2, 0.25] spawn GRAD_reinforcements_fnc_GUIflash;
        }; 
        case "killed" : {
            [_outline, [1,1,1,0], [1,0,0,1], 4, 0.25] spawn GRAD_reinforcements_fnc_GUIflash;
            if ({alive _x} count units _group < 1) then {
                _statusTopRight ctrlSetText "\A3\ui_f\data\map\respawn\respawn_dead_ca.paa";
                _statusTopRight ctrlCommit 0;
            };
        };
        default {}; 
    };  
}] call CBA_fnc_addEventHandler;


// clean up before changing anything
private _existingControls = missionNamespace getVariable ["GRAD_reinforcements_GUI", []];

{
    ctrlDelete _x;
} forEach _existingControls;


private _reinforcements = missionNamespace getVariable ["IC_reinforcements",[]];

GRAD_reinforcements_fnc_GUIflash = {
    params [["_ctrl", controlNull], "_color1", "_color2", "_duration", "_frequency"];

    if (isNull _ctrl) exitWith {
        systemChat "no control flashing";
    };

    for "_i" from 0 to _duration do {

        _ctrl ctrlSetBackgroundColor _color1;
        _ctrl ctrlCommit 0;
        sleep 0;
        _ctrl ctrlSetBackgroundColor _color2;
        _ctrl ctrlCommit _frequency;
        sleep _frequency;
    };

    _ctrl ctrlSetBackgroundColor [1,1,1,0];
    _ctrl ctrlCommit 0.5;
};


GRAD_reinforcements_fnc_GUIcreate = {
    params ["_group", "_horizontalIndex", "_verticalIndex"];

    private _display = findDisplay 312;

    private _width = safeZoneW/30;
    private _height = safeZoneH/20;
    private _gap = safeZoneH/60;
    private _fontSize = 0.01 / (getResolution select 5);

    private _name = _group getVariable ["displayName", ""];
    private _picturePath = _group getVariable ["pic", ""];
    private _completelyDead = {alive _x} count units _group < 1;


    private _outline = _display ctrlCreate ["RscText", -1];
    _outline ctrlSetPosition [
        safezoneX + _width*_horizontalIndex + _gap*_horizontalIndex + _gap/2,
        safezoneY + _width*(4/3)*_verticalIndex + _gap*_verticalIndex + _gap/2, 
        _width + _gap, 
        _width*(4/3) + _gap
    ];
    _outline ctrlSetText "";
    _outline ctrlSetBackgroundColor [0,0,0,0];
    _outline ctrlCommit 0;

    private _pic = _display ctrlCreate ["RscPicture", -1];
    _pic ctrlsetText _picturePath; 
    _pic ctrlSetPosition [
        safezoneX + _width*_horizontalIndex + _gap*_horizontalIndex + _gap,
        safezoneY + _width*(4/3)*_verticalIndex + _gap*_verticalIndex + _gap, 
        _width, 
        _width*(4/3)
    ];
    _pic ctrlSetBackgroundColor [0,0,0,0];
    _pic ctrlCommit 0;


    private _label = _display ctrlCreate ["RscText", -1];
    _label ctrlSetBackgroundColor [0,0,0,0.7];
    _label ctrlSetText _name;
    _label ctrlSetFontHeight _fontSize;
    _label ctrlSetPosition [
        safezoneX + _width*_horizontalIndex + _gap*_horizontalIndex + _gap, 
        safezoneY + _width*(4/3)*_verticalIndex + _width*4/3 - _width/6 + _gap*_verticalIndex + _gap, 
        _width, 
        _width/6*(4/3)
    ];
    _label ctrlCommit 0;

    private _aliveCount = count units _group;
    private _percentAlive = 0;

    if (_aliveCount > 0) then {
        _percentAlive = ({alive _x} count (units _group)) / (count (units _group));
    };

    private _widthPercent = _width*_percentAlive;


    private _healthBar = _display ctrlCreate ["RscText", -1];
    _healthBar ctrlSetBackgroundColor [0.3,0.8,0.3,1]; 
    _healthBar ctrlSetPosition [
        safezoneX + _width*_horizontalIndex + _gap*_horizontalIndex + _gap, 
        safezoneY + _width*(4/3)*_verticalIndex + _gap*_verticalIndex + _gap, 
        _widthPercent, 
        _width/16*(4/3)
    ];
    _healthBar ctrlCommit 0;


    private _statusTopRight = _display ctrlCreate ["RscPicture", -1];
    _statusTopRight ctrlsetText ""; 
    _statusTopRight ctrlSetPosition [
        safezoneX + _width*_horizontalIndex + _gap*_horizontalIndex + _gap,
        safezoneY + _width*(4/3)*_verticalIndex + _gap*_verticalIndex + _gap, 
        _width,
        _width*(4/3)
    ];
    _statusTopRight ctrlCommit 0;


    private _statusTopLeft = _display ctrlCreate ["RscPicture", -1];
    _statusTopLeft ctrlsetText ""; 
    _statusTopLeft ctrlSetPosition [
        safezoneX + _width*_horizontalIndex + _gap*_horizontalIndex + _gap,
        safezoneY + _width*(4/3)*_verticalIndex + _gap*_verticalIndex + _gap, 
        _width/4,
        _width*(4/3)/4
    ];
    _statusTopLeft ctrlCommit 0;


    private _button = _display ctrlCreate ["grad_nvaCommand_RscButtonSilent", -1];
    _button ctrlSetPosition [
        safezoneX + _width*_horizontalIndex + _gap*_horizontalIndex + _gap/2,
        safezoneY + _width*(4/3)*_verticalIndex + _gap*_verticalIndex + _gap/2, 
        _width + _gap, 
        _width*(4/3) + _gap
    ];

    _button ctrlSetBackgroundColor [0,0,0,0];
    _button ctrlCommit 0;

    _button ctrlEnable true;
    
    _button setVariable ["ctrlAssignedGroup", _group];
    _button ctrlAddEventHandler ["ButtonClick", {
        params ["_ctrl"];
        
        private _group = _ctrl getVariable ["ctrlAssignedGroup", grpNull];

        private _positionAboveBehind = (leader _group) getPos [25, getDir leader _group-180];
        _positionAboveBehind set [2,25];
        [_positionAboveBehind, (leader _group), 1] spawn GRAD_nvacommand_fnc_curatorSetCamera;

    }];

    // this is BS bc controls are local.. but i'm desperate
    _group setVariable ["GRAD_reinforcements_GUI_ctrlOutline", _outline, true];
    _group setVariable ["GRAD_reinforcements_GUI_ctrlPic", _pic, true];
    _group setVariable ["GRAD_reinforcements_GUI_ctrlLabel", _label, true];
    _group setVariable ["GRAD_reinforcements_GUI_ctrlHealth", _healthBar, true];
    _group setVariable ["GRAD_reinforcements_GUI_ctrlStatusTopLeft", _statusTopLeft, true];
    _group setVariable ["GRAD_reinforcements_GUI_ctrlStatusTopRight", _statusTopRight, true];
    _group setVariable ["GRAD_reinforcements_GUI_ctrlButton", _button, true];


    private _controlsCreated = missionNamespace getVariable ["GRAD_reinforcements_GUI", []];

    _controlsCreated pushBackUnique _outline;
    _controlsCreated pushBackUnique _pic;
    _controlsCreated pushBackUnique _label;
    _controlsCreated pushBackUnique _healthBar;
    _controlsCreated pushBackUnique _statusTopLeft;
    _controlsCreated pushBackUnique _statusTopRight;
    _controlsCreated pushBackUnique _button;

    missionNamespace setVariable ["GRAD_reinforcements_GUI", _controlsCreated];
};


{
    private _groupsOfAKind = _x;
    private _horizontalIndex = _forEachIndex;
    
    {
        private _verticalIndex = _forEachIndex;
        [_x, _horizontalIndex, _verticalIndex] call GRAD_reinforcements_fnc_GUIcreate;
    } forEach _groupsOfAKind;
    
} forEach _reinforcements;


/*
sleep 10;

{
    ctrlDelete _x;
} forEach _controlsCreated
*/
