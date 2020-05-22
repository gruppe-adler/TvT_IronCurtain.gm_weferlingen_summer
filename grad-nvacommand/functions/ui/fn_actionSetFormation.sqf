params ["_ctrl", "_group"];

// abort to close submenu - currently same functionality
[_ctrl, _group] execVM "grad-nvacommand\functions\ui\fn_actionStanceAbort.sqf";

private _formation = _ctrl getVariable ["GRAD_nvacommand_formation", "column"];
_group setFormation _formation;

private _originalControl = _ctrl getVariable ["GRAD_nvacommand_originalCtrl", controlNull];
private _originalIcon = _originalControl getVariable ["GRAD_nvacommand_icon", controlNull];
private _icon = _ctrl getVariable ["GRAD_nvacommand_icon", controlNull];

_originalIcon ctrlSetText "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\" + _formation + "_ca.paa"; // ([_group] call GRAD_nvacommand_fnc_getIconFormation);
_originalIcon ctrlCommit 0;
_icon ctrlSetText "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\" + _formation + "_ca.paa"; // ([_group] call GRAD_nvacommand_fnc_getIconFormation);
_icon ctrlCommit 0;

private _prefix = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\";
private _suffix = ".ogg";
private _sound = "";
private _string = "";

switch (_formation) do { 
    case "column" : {
        _sound = "FormColumn";
        _string = "Reihe";
    }; 
    case "stag_column" : {
        _sound = "FormStaggeredColumn";
        _string = "Schützenreihe";
    };
    case "wedge" : {
        _sound = "FormWedge";
        _string = "Keil";
    }; 
    case "ech_left" : {
        _sound = "FormEcholonLeft";
        _string = "Keil links";
    }; 
    case "ech_right" : {
        _sound = "FormEcholonRight";
        _string = "Keil rechts";
    };  
    case "vee" : {
        _sound = "FormVee";
        _string = "V-Formation";
    }; 
    case "line" : {
        _sound = "FormLine";
        _string = "Schützenlinie";
    }; 
    case "file" : {
        _sound = "FormFile";
        _string = "Schützenrudel";
    }; 
    case "diamond" : {
        _sound = "FormDiamond";
        _string = "Rautenformation";
    }; 
    default {

    }; 
};
 
// todo define in description.ext and playSound
playSound3D [_prefix + _sound + _suffix, curatorCamera];

[leader _group, _string, 2.5] execVM "grad-nvacommand\functions\ui\fn_drawIconHint.sqf";