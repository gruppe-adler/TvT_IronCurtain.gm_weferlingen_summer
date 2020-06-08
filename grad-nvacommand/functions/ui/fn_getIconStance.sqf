params ["_group"];

private _stance = _group getVariable ["nvaCommand_stance", "auto"];
private _return = "";

switch (_stance) do {
    case "auto" : {
        _return = "\a3\ui_f\Data\IGUI\Cfg\VehicleToggles\AutohoverIconOn_ca.paa";        
    };

    case "prone" : {
        _return = "\a3\ui_f\Data\IGUI\RscIngameUI\RscUnitInfo\SI_prone_ca.paa";
    };

    case "crouch" : {
        _return = "\a3\ui_f\Data\IGUI\RscIngameUI\RscUnitInfo\SI_crouch_ca.paa";
    };

    case "stand" : {
        _return = "\a3\ui_f\Data\IGUI\RscIngameUI\RscUnitInfo\SI_stand_ca.paa";
    };

    default { };
};

_return
