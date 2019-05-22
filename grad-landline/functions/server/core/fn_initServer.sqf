#include "..\..\..\config.hpp"

if (!isServer) exitWith {};

missionNamespace setVariable ["GRAD_LANDLINE_CLASSNAMES", GRAD_LANDLINE_CLASSNAMES, true]; // yes, actually necessary bc its only included here otherwise
missionNamespace setVariable ["GRAD_LANDLINE_ALLNUMBERS", [], true];
missionNamespace setVariable ["GRAD_LANDLINE_ALLPHONES", [], true];
missionNamespace setVariable ["GRAD_LANDLINE_CALLS_RUNNING", [], true];

GRAD_LANDLINE_PHONENUMBERS_HASH = [] call CBA_fnc_hashCreate;

[] call GRAD_landline_fnc_distributePhones; // intensive, maybe preinit?

[] remoteExec ["GRAD_landline_fnc_addSelfAction", [0,-2] select isDedicated, true];