params ["_group"];

private _speed = speedMode _group;
private _return = "";

switch (_speed) do { 
    case "LIMITED" : {
        _return = "grad-nvacommand\vehicles\speed_limited.paa";
    };

    case "NORMAL" : { 
        _return = "grad-nvacommand\vehicles\speed2.paa";
    }; 

    case "FULL" : { 
        _return = "grad-nvacommand\vehicles\speed_full.paa";
    };

    default {}; 
};

_return