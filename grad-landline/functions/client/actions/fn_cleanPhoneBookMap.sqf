{ ctrlDelete _x; } forEach (player getVariable ["GRAD_landline_phoneList",[]]); 
{ deleteMarkerLocal _x; } forEach (player getVariable ["GRAD_landline_markerList", []]);
deleteMarkerLocal "mrk_grad_landlinePhoneSelect";