params ["_ctrl", "_group"];

private _subControls = _ctrl getVariable ["GRAD_nvacommand_subcontrols", []];

private _controlsCreatedBefore = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS", []];

{
    _controlsCreatedBefore deleteAt (_controlsCreatedBefore find _x);
    ctrlDelete _x;
} forEach _subControls;

uiNamespace setVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIELEMENTS", _controlsCreatedBefore];