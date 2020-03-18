private _textures = player getVariable ["IC_setup_texturesShown", []];
{
    _x hideObject true;
} forEach _textures;

player setVariable ["IC_setup_texturesShown", []];