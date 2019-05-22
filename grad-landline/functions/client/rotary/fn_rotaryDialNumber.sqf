params ["_number"];

private _numberArray = [_number] call GRAD_landline_fnc_extractNumberFromPrefix;

createdialog "grad_landline_rscRotary";
waitUntil {dialog};

sleep 1;

{
    private _processing = [_x] spawn GRAD_landline_fnc_rotaryProcessInput;
    waitUntil { scriptDone _processing };
    sleep 1;
} forEach _numberArray;

closeDialog 0;