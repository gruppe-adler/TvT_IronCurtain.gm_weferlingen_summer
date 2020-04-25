/*
    possible params

    "civilianEast",
    "civilianWest",
    "stasi",
    "vopo",
    "nva"


    civiliansEast should be able to get in each others cars
    same for stasi, should be indistinguishable

    nva and civiliansEast are enemy to make AI able to shoot them

    handcuffed civs can walk to a tree and free themselves with an action,
    also in vehicles they should be able to unlock their handcuffs after a while (hint to crew)

    unconscious civs wake up partially healed after 5min

    vopo are independent


*/


params ["_unit", "_side"];

private _engineSide = independent;

switch (_side) do { 
    case "civilianEast" : {
        _engineSide = independent;
    };
    case "civilianWest" : {
        _engineSide = civilian; // will be set to side independent if anything happens to them
    };
    case "nva" : {
        _engineSide = east; // can they transport handcuffed civilians?
    };
    case "stasi" : {
        _engineSide = independent; // how to prevent ai to shoot them? -> solution: dont prevent that, they should not flee anyway
    };
    case "vopo" : {
        _engineSide = civilian; // friendly to nva and friendly to civs
    };

    default {
        diag_log format ["IC onRespawnEquip: Error - no respawn setting found"];
    }; 

    [_unit] joinSilent (createGroup _engineSide);
};