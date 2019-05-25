#include "..\..\..\config.hpp"

if (!isServer) exitWith {};

missionNamespace setVariable ["GRAD_LANDLINE_CLASSNAMES_PHONE", GRAD_LANDLINE_CLASSNAMES_PHONE, true]; // yes, actually necessary bc its only included here otherwise
missionNamespace setVariable ["GRAD_LANDLINE_CLASSNAMES_GMN", GRAD_LANDLINE_CLASSNAMES_GMN, true];
missionNamespace setVariable ["GRAD_LANDLINE_ALLNUMBERS", [], true];
missionNamespace setVariable ["GRAD_LANDLINE_ALLPHONES", [], true];
missionNamespace setVariable ["GRAD_LANDLINE_CALLS_RUNNING", [], true];

GRAD_LANDLINE_PHONENUMBERS_HASH = [] call CBA_fnc_hashCreate;

[] call GRAD_landline_fnc_distributePhones;


[] remoteExec ["GRAD_landline_fnc_addSelfAction", [0,-2] select isDedicated, true];