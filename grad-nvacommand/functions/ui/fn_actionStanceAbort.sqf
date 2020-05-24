params ["_ctrl", "_group"];

private _subControls = _ctrl getVariable ["GRAD_nvacommand_subcontrols", []];
{
    ctrlDelete _x;
} forEach _subControls;


private _btnBelow = uiNamespace getVariable ["GRAD_NVACOMMAND_CURATOR_CURRENTVEHICLES_UIBUTTONS", []];
{
    _x ctrlEnable true;
    // systemChat "enabling btn";
} forEach _btnBelow;