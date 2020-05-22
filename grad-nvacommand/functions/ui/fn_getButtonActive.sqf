params ["_group", "_type"];

private _return = false;

switch (_type) do { 
    case "actionStop" : {  
        _return = false;
    }; 
    case "actionIgnore" : {  
        _return = _group getVariable ["GRAD_nvacommand_actionIgnore", false];
    };
    case "actionSuppress" : {
        _return = _group getVariable ["GRAD_nvacommand_isSuppressing", false];
    };
    case "actionFlee" : {  
        _return = false;
    }; 
    case "actionFormation" : {  
        _return = false;    
    };
    case "actionStance" : {
        _return = false;
    };
    case "actionSpeed" : {  
        _return = false;  
    }; 
    case "actionRoad" : {
        _return = _group getVariable ["GRAD_nvacommand_forceFollowRoad", false];
    };
    case "actionGetOut" : {
        _return = _group getVariable ["GRAD_nvaCommand_actionGetOut", false];
    };
    case "actionHeal" : {
        _return = false;
    };
    case "actionBuild" : {
        _return = false;
    };
    default {}; 
};

_return