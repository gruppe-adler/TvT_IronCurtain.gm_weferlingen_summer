private _type = "default";

if (!isNull (missionNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_SELECTED", objNull])) then {
    _type = "tower";
};

switch (_type) do {

    case "tower" : {
        private _ctrls = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIELEMENTS", 
            [controlNull,controlNull,controlNull,controlNull, controlNull, controlNull, controlNull, controlNull, controlNull, controlNull]
        ];

        private _ctrlsGroup = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTTOWER_UIGROUP", 
            [controlNull,controlNull,controlNull,controlNull]
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
            } forEach (_ctrls + _allGUISelects + _ctrlsGroup);

            [_ctrls, _allGUISelects, _ctrlsGroup] spawn {
                params ["_ctrls", "_allGUISelects", "_ctrlsGroup"];
                uiSleep 0.2;
                { ctrlDelete _x } forEach (_ctrls + _allGUISelects + _ctrlsGroup);
            };  
        };
    }; 

    case "infantry" : {

        private _ctrlsGroup = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTINFANTRY_UIELEMENTS", 
            [controlNull,controlNull,controlNull,controlNull]
        ];

        uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTINFANTRY_UIELEMENTS", []];
        missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTINFANTRY_SELECTED", objNull];

        if (!isNull (_ctrls select 0)) then {

            {
                (ctrlPosition _x) params ["_xPos", "_yPos", "_width", "_height"];
                _x ctrlSetPosition [_xPos, _yPos + 0.2, _width, _height];
                _x ctrlSetFade 1;
                _x ctrlCommit 0.2;
            } forEach (_ctrls + _allGUISelects + _ctrlsGroup);

            [_ctrlsGroup] spawn {
                params ["_ctrlsGroup"];
                uiSleep 0.2;
                { ctrlDelete _x } forEach (_ctrlsGroup);
            };  
        };

    };


    default {  
        // no GUI found, doing nothing
    }; 
};