params ["_from", "_to"];

diag_log format ["creating rope from %1 to %2", _from, _to];

private _line = ropeCreate [
    _from, [0, 0, 0],
    _to, [0, 0, 0],
    _from distance _to
];

_line