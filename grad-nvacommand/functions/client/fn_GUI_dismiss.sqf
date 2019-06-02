private _type = "default";

if (!isNull missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull]) then {
    _type = "tower";
};

switch (_type) do {

    case "tower" : {
        private _ctrls = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS", 
            [controlNull,controlNull,controlNull,controlNull, controlNull, controlNull, controlNull, controlNull, controlNull, controlNull]
        ];

        private _allGUISelects = uiNamespace getVariable ["GRAD_nvaCommand_allGUISelects", []];
        uiNamespace setVariable ["GRAD_nvaCommand_allGUISelects", []];
        missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull];
        if (!isNull (_ctrls select 0)) then {

            {
                (ctrlPosition _x) params ["_xPos", "_yPos", "_width", "_height"];
                _x ctrlSetPosition [_xPos, _yPos + 0.2, _width, _height];
                _x ctrlSetFade 1;
                _x ctrlCommit 0.2;
            } forEach (_ctrls + _allGUISelects);

            [_ctrls, _allGUISelects] spawn {
                params ["_ctrls", "_allGUISelects"];
                uiSleep 0.2;
                { ctrlDelete _x } forEach (_ctrls + _allGUISelects);
            };  
        };
    }; 

    case "infantry" : {

    };


    default {  
        // no GUI found, doing nothing
    }; 
};