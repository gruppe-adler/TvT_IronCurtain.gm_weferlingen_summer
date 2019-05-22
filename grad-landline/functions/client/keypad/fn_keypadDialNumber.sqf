params ["_number"];

private _numberArray = [_number] call GRAD_landline_fnc_extractNumberFromPrefix;

createdialog "grad_landline_rscKeypad";
waitUntil {dialog};

sleep 1;

{
    private _processing = [_x] spawn GRAD_landline_fnc_keypadProcessInput;
    waitUntil { scriptDone _processing };
    sleep sleep (0.1 + (random 0.2));
} forEach _numberArray;

closeDialog 0;