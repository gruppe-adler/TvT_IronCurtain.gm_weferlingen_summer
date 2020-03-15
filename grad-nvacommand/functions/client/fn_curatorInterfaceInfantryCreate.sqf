params ["_entity"];

private _display = findDisplay 312;

private _infantryBackground = _display ctrlCreate ["RscText", -1];
_infantryBackground ctrlSetPosition [0, 1.1, 1, 0.2];
_infantryBackground ctrlSetBackgroundColor [0,0,0,0.7]; 
_infantryBackground ctrlSetFade 1;
_infantryBackground ctrlCommit 0;

_infantryBackground ctrlSetPosition [0, 1, 1, 0.2];
_infantryBackground ctrlSetFade 0;
_infantryBackground ctrlCommit 0.1;


private _infantryPic = _display ctrlCreate ["RscPictureKeepAspect", -1];
_infantryPic ctrlsetText "grad-nvacommand\displays\alarmgroup.jpg"; 
_infantryPic ctrlSetPosition [0.01, 1.1, 0.18, 0.18];
_infantryPic ctrlSetBackgroundColor [0,0,0,0];
_infantryPic setVariable ["IC_GUI_BGCOLOR", [0,0,0,0]];
_infantryPic ctrlSetFade 1;
_infantryPic ctrlCommit 0;

_infantryPic ctrlSetPosition [0.01, 1.01, 0.18, 0.18];
_infantryPic ctrlSetFade 0;
_infantryPic ctrlCommit 0.1;

_infantryPic ctrlAddEventHandler ["MouseEnter", {
    params ["_control"];
    _control ctrlSetForegroundColor [0,0,0,0.2];

}];
_infantryPic ctrlAddEventHandler ["MouseExit", {
    params ["_control"];
    _control ctrlSetForegroundColor (_control getVariable ["IC_GUI_BGCOLOR", [0,0,0,0.5]]);
}];

private _infantryBtnCenter = _display ctrlCreate ["RscText", -1];
_infantryBtnCenter ctrlEnable true;
_infantryBtnCenter ctrlSetPosition [0.1, 1.1, 0.18, 0.18];
_infantryBtnCenter ctrlSetBackgroundColor [0,0,0,0]; 
_infantryBtnCenter ctrlSetFade 1;
_infantryBtnCenter ctrlCommit 0;

_infantryBtnCenter ctrlSetPosition [0.1, 1.01, 0.18, 0.18];
_infantryBtnCenter ctrlSetFade 0;
_infantryBtnCenter ctrlCommit 0.1;

private _infantryLabel = _display ctrlCreate ["RscText", -1];
_infantryLabel ctrlsetText (format ["%1", getText (configFile >> "cfgVehicles" >> typeOf _entity >> "displayName")]);
_infantryLabel ctrlSetPosition [0.02, 1, 0.18, 0.18];
_infantryLabel ctrlSetBackgroundColor [0,0,0,0]; 
_infantryLabel ctrlSetFade 1;
_infantryLabel ctrlCommit 0;

_infantryLabel ctrlSetPosition [0.02, 1, 0.18, 0.05];
_infantryLabel ctrlSetFade 0;
_infantryLabel ctrlCommit 0.1;




uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTINFANTRY_UIELEMENTS", 
        [
        _infantryBackground,
        _infantryPic,
        _infantryBtnCenter,
        _infantryLabel
        ]
];

missionNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTINFANTRY_SELECTED", _entity];
