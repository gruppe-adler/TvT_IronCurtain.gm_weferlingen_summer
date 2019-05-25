private _display = findDisplay 312;

private _towerLabel = _display ctrlCreate ["RscText", -1]; 
_towerLabel ctrlsetText ""; 
_towerLabel ctrlSetPosition [0, 1, 1, 0.1];
_towerLabel ctrlSetBackgroundColor [0,0,0,0.5]; 
_towerLabel ctrlCommit 0;


_towerLabel ctrlAddEventHandler ["onMouseMoving", {
    params ["_control", "_xPos", "_yPos", "_mouseOver"];

    if (_mouseOver) then {
        _control ctrlSetBackgroundColor [0,0,0,0.8];
    } else {
        _control ctrlSetBackgroundColor [0,0,0,0.5];
    };
    false
}];

uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_TOWER", _towerLabel];