params ["_group"];

private _formation = formation _group;
private _return = "";

switch (_formation) do { 
    case "COLUMN" : {
        _return = "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\column_ca.paa";
    };

    case "FILE" : {
        _return = "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\file_ca.paa";
    };

    case "DIAMOND" : {
        _return = "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\diamond_ca.paa";
    };

    case "STAG COLUMN" : { 
        _return = "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\stag_column_ca.paa";
    }; 

    case "WEDGE" : { 
        _return = "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\wedge_ca.paa";
    };

    case "ECH LEFT" : {
        _return = "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\ech_left_ca.paa";
    };

    case "ECH RIGHT" : { 
        _return = "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\ech_right_ca.paa";
    }; 

    case "VEE" : { 
        _return = "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\vee_ca.paa";
    };

    case "LINE" : { 
        _return = "\a3\ui_f_curator\Data\RscCommon\RscAttributeFormation\line_ca.paa";
    };


    default {}; 
};

_return