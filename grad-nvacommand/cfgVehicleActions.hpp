class CfgNVAVehicleActions {

    class actionStop {
        icon = "grad-nvacommand\vehicles\stop2.paa";
        script = "grad-nvacommand\functions\ui\fn_actionStop.sqf";
        type = "actionStop"; // configName could be used
        xPos = 0.76;
        row = 1;
        colorDefault[] = {255/255, 255/255, 255/255, 1};
        colorActive[] = {255/255, 255/255, 255/255, 1};
        colorBGPic = "red";
    };

    class actionIgnore {
        icon = "\a3\ui_f\Data\GUI\Cfg\Notifications\tridentFriendly_ca.paa";
        script = "grad-nvacommand\functions\ui\fn_actionIgnore.sqf";
        type = "actionIgnore"; // configName could be used
        xPos = 0.82;
        row = 1;
        colorDefault[] = {235/255, 87/255, 87/255, 1};
        colorActive[] = {0/255, 0/255, 0/255, 1};
        colorBGPic = "red";
    };

    class actionReverse {
        icon = "grad-nvacommand\vehicles\reverse.paa";
        script = "grad-nvacommand\functions\ui\fn_actionReverse.sqf";
        type = "actionReverse"; // configName could be used
        xPos = 0.88;
        row = 1;
        colorDefault[] = {235/255, 87/255, 87/255, 1};
        colorActive[] = {0/255, 0/255, 0/255, 1};
        colorBGPic = "red";
    };

    class actionFlee {
        icon = "grad-nvacommand\vehicles\flee2.paa";
        script = "grad-nvacommand\functions\ui\fn_actionFlee.sqf";
        type = "actionFlee"; // configName could be used
        xPos = 0.94;
        row = 1;
        colorDefault[] = {255/255, 255/255, 255/255, 1};
        colorActive[] = {255/255, 255/255, 255/255, 1};
        colorBGPic = "red";
    };

    class actionFormation {
        iconFnc = "grad_nvacommand_fnc_getIconFormation";
        script = "grad-nvacommand\functions\ui\fn_actionFormation.sqf";
        type = "actionFormation"; // configName could be used
        xPos = 0.76;
        row = 2;
        colorDefault[] = {196/255, 196/255, 196/255, 1};
        colorActive[] = {0/255, 0/255, 0/255, 1};
        colorBGPic = "white";
    };

    class actionStance {
        iconFnc = "grad_nvacommand_fnc_getIconStance";
        script = "grad-nvacommand\functions\ui\fn_actionStance.sqf";
        type = "actionStance"; // configName could be used
        xPos = 0.82;
        row = 2;
        colorDefault[] = {196/255, 196/255, 196/255, 1};
        colorActive[] = {0/255, 0/255, 0/255, 1};
        colorBGPic = "white";
    };

    class actionSpeed {
        iconFnc = "grad_nvacommand_fnc_getIconSpeed";
        script = "grad-nvacommand\functions\ui\fn_actionSpeed.sqf";
        type = "actionSpeed"; // configName could be used
        xPos = 0.88;
        row = 2;
        colorDefault[] = {255/255, 255/255, 255/255, 1};
        colorActive[] = {255/255, 255/255, 255/255, 1};
        colorBGPic = "white";
    };

    class actionRoad {
        iconFnc = "grad_nvacommand_fnc_getIconRoad";
        script = "grad-nvacommand\functions\ui\fn_actionRoad.sqf";
        type = "actionRoad"; // configName could be used
        xPos = 0.94;
        row = 2;
        colorDefault[] = {255/255, 255/255, 255/255, 1};
        colorActive[] = {255/255, 255/255, 255/255, 1};
        colorBGPic = "white";
    };

    class actionGetOut {
        iconFnc = "grad_nvacommand_fnc_getIconGetOut";
        script = "grad-nvacommand\functions\ui\fn_actionGetOut.sqf";
        type = "actionGetOut"; // configName could be used
        xPos = 0.76;
        row = 3;
        colorDefault[] = {255/255, 255/255, 255/255, 1};
        colorActive[] = {255/255, 255/255, 255/255, 1};
        colorBGPic = "yellow";
    };

    class actionHeal {
        icon = "grad-nvacommand\vehicles\heal2.paa";
        script = "grad-nvacommand\functions\ui\fn_actionHeal.sqf";
        type = "actionHeal"; // configName could be used
        xPos = 0.82;
        row = 3;
        colorDefault[] = {255/255, 255/255, 255/255, 1};
        colorActive[] = {255/255, 255/255, 255/255, 1};
        colorBGPic = "yellow";
    };

    class actionBuild {
        icon = "grad-nvacommand\vehicles\build2.paa";
        script = "grad-nvacommand\functions\ui\fn_actionBuild.sqf";
        type = "actionBuild"; // configName could be used
        xPos = 0.88;
        row = 3;
        colorDefault[] = {255/255, 255/255, 255/255, 1};
        colorActive[] = {255/255, 255/255, 255/255, 1};
        colorBGPic = "yellow";
    };
};

/*

forEach [
        [0.76, _screenEdgeBottom - _vehicleControl_height + _buttonSize/8, [1, 1, 1, 1], [1, 1, 1, 1], "grad-nvacommand\vehicles\stop2.paa", "grad-nvacommand\functions\ui\fn_actionStop.sqf", "red", "actionStop", false],
        [0.82, _screenEdgeBottom - _vehicleControl_height + _buttonSize/8, [235/255, 87/255, 87/255, 1], [0, 0, 0, 1], "\a3\ui_f\Data\GUI\Cfg\Notifications\tridentFriendly_ca.paa", "grad-nvacommand\functions\ui\fn_actionIgnore.sqf", "red", "actionIgnore", true],
        [0.88, _screenEdgeBottom - _vehicleControl_height + _buttonSize/8, [235/255, 87/255, 87/255, 1], [0, 0, 0, 1],"grad-nvacommand\vehicles\reverse.paa", "grad-nvacommand\functions\ui\fn_actionReverse.sqf", "red", "actionReverse", false],
        [0.94, _screenEdgeBottom - _vehicleControl_height + _buttonSize/8, [1, 1, 1, 1], [1, 1, 1, 1], "grad-nvacommand\vehicles\flee2.paa", "grad-nvacommand\functions\ui\fn_actionFlee.sqf", "red", "actionFlee", false],
        [0.76, _screenEdgeBottom - _vehicleControl_height + 2*_buttonSize - _buttonSize/4, [196/255, 196/255, 196/255, 1], [0, 0, 0, 1], [_group] call grad_nvacommand_fnc_getIconFormation, "grad-nvacommand\functions\ui\fn_actionFormation.sqf", "white", "actionFormation", true],
        [0.82, _screenEdgeBottom - _vehicleControl_height + 2*_buttonSize - _buttonSize/4, [196/255, 196/255, 196/255, 1], [0, 0, 0, 1], [_group] call grad_nvacommand_fnc_getIconStance, "grad-nvacommand\functions\ui\fn_actionStance.sqf", "white", "actionStance", true],
        [0.88, _screenEdgeBottom - _vehicleControl_height + 2*_buttonSize - _buttonSize/4, [1, 1, 1, 1], [1, 1, 1, 1], [_group] call grad_nvacommand_fnc_getIconSpeed, "grad-nvacommand\functions\ui\fn_actionSpeed.sqf", "white", "actionSpeed", true],
        [0.94, _screenEdgeBottom - _vehicleControl_height + 2*_buttonSize - _buttonSize/4, [1, 1, 1, 1], [1, 1, 1, 1], [_group] call grad_nvacommand_fnc_getIconRoad, "grad-nvacommand\functions\ui\fn_actionRoad.sqf", "white", "actionRoad", true],
        [0.76, _screenEdgeBottom - _vehicleControl_height + 3*_buttonSize + _buttonSize/8 + _buttonSize/4, [1, 1, 1, 1], [1, 1, 1, 1], [_group] call grad_nvacommand_fnc_getIconGetOut, "grad-nvacommand\functions\ui\fn_actionGetOut.sqf", "yellow", "actionGetOut", false],
        [0.82, _screenEdgeBottom - _vehicleControl_height + 3*_buttonSize + _buttonSize/8 + _buttonSize/4, [1, 1, 1, 1], [1, 1, 1, 1], "grad-nvacommand\vehicles\heal2.paa", "grad-nvacommand\functions\ui\fn_actionHeal.sqf", "yellow", "actionHeal", false],
        [0.88, _screenEdgeBottom - _vehicleControl_height + 3*_buttonSize + _buttonSize/8 + _buttonSize/4, [1, 1, 1, 1], [1, 1, 1, 1], "grad-nvacommand\vehicles\build2.paa", "grad-nvacommand\functions\ui\fn_actionBuild.sqf", "yellow", "actionBuild", false]
    ];

*/