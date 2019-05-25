// todo: prefilter for static objects
private _allPhones = [];
{
    private _phoneBooths = ([worldSize/2, worldSize/2] nearObjects [_x, worldsize/2]);
    { 
        _allPhones pushBackUnique _x;
    } forEach _phoneBooths;
} forEach GRAD_LANDLINE_CLASSNAMES_PHONE;


{
    private _phone = _x;
    private _type = typeOf _phone;
    diag_log format ["GRAD-LANDLINE: type detected is %1", _type];
    private _isRotary = if (_type == "land_gm_euro_misc_feh_62_e") then { true } else { false };

	[_x, "none", _isRotary] call GRAD_landline_fnc_addPhone;
} forEach _allPhones;