params ["_pos", "_dog"];

private _pole = createVehicle ["Flag_US_F", _pos, "", 0, "NONE"];

private _rope = ropeCreate [_dog, "Head", _pole, [0,0,1], 10];

_rope
