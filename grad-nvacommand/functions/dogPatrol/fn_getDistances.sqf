/*

	get Distance of Rope length of trolley

	A---da--d----bd-----B
	        |
	        cd
			|
	        C

	returns _da and _bd

	[_posA, _posB, _dogPos] call GRAD_dogRun_fnc_getDistances;

*/

params ["_posA", "_posB", "_dogPos"];
// diag_log format ["posA %1, posB %2, dogPos %3", _posA, _posB, _dogPos];

_posB params ["_bx", "_by", "_bz"];
// diag_log format ["_bx %1, _by %2, _bz %3", _bx, _by, _bz];

_dogPos params ["_cx", "_cy", "_cz"];
// diag_log format ["_cx %1, _cx %2, _cz %3", _cx, _cy, _cz];


private _diff = (_posA vectorDiff _posB);

private _E = vectorNormalized _diff;
_E params ["_ex", "_ey", "_ez"];


private _bd = ((_cx * _bx) + (_cy * _by) + (_cz * _bz)) / 
			  ((_cx * _ex) + (_cy * _ey) + (_cz * _ez));

private _da = (_posB vectorDistance _posA) - _bd;

[_bd, _da]