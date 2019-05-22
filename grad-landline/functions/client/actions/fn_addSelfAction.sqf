player addAction [
    "Show Calls",
    {
         [] call GRAD_landline_fnc_hookShowCalls;
    },
    [],1.5,true,true,"",
    ""
];


player addAction [
    "End Hooking",
    {
         [] call GRAD_landline_fnc_hookEnd;
    },
    [],1.5,true,true,"",
    "player getVariable ['GRAD_landline_hooking', false]"
];