

// todo: prefilter for static objects
private _allObjects = [];
{
    private _phoneBooths = ([worldSize/2, worldSize/2] nearObjects [_x, worldsize/2]);
    { 
        _allObjects pushBackUnique _x;
    } forEach _phoneBooths;
} forEach GRAD_LANDLINE_CLASSNAMES;


{
    private _phone = _x;
    private _type = typeOf _phone;
    diag_log format ["GRAD-LANDLINE: type detected is %1", _type];
    private _isRotary = if (_type == "land_gm_euro_misc_feh_62_e") then { true } else { false };
    private _canOnlyCallNumber = if (
            _type == "land_gm_wall_gc_borderpost_03" || 
            _type == "land_gm_wall_gc_borderpost_04"
        ) then { "1337" } else { "none" };

	[_x, "none", _isRotary, _canOnlyCallNumber] call GRAD_landline_fnc_addPhone;
} forEach _allObjects;