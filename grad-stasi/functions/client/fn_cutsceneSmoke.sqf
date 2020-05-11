params ["_source"];
private _multiplier = 2;

private _fog = "#particleSource" createVehicleLocal getPos _source;
_fog setParticleParams ["\A3\data_f\cl_basic",
"",
"Billboard",
0.5,
2,
[0, 0, 0],
[0, 0.1, -0.1],
1,
1.2,
1,
0.0001,
[0.1 * _multiplier, 0.2 * _multiplier, 0.1 * _multiplier],
[[0.2 * _multiplier, 0.2 * _multiplier, 0.2 * _multiplier, 0.3 * _multiplier], [0, 0, 0, 0.01], [1, 1, 1, 0]],
[500],
1,
0.04,
"",
"",
_source];
_fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
_fog setDropInterval 1;

_source attachTo [_source, [0, 0, 0]];
