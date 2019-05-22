params ["_caller", "_receiver"];

GRAD_LANDLINE_CALLS_RUNNING pushBack [_caller, _receiver];
publicVariable "GRAD_LANDLINE_CALLS_RUNNING";