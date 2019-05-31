params ["_index", "_position", "_type"];

if (_type == "manual") then {
    _position set [2, 20];
};

private _flare = "F_40mm_White" createVehicle _position;
_flare setVelocity [random 5, random 5, 100];
playSound3D ["A3\Sounds_F_Kart\Weapons\starting_pistol_1.wss", _flare, false, _position, 25, 1, 100];