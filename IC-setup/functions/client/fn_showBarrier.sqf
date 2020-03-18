private _texturesShown = player getVariable ["IC_setup_texturesShown", []];
private _textures = nearestObjects [player, ["UserTexture10m_F"], 100];

{
    _x hideObject false;
    _texturesShown pushBackUnique _x;

    hintSilent "Du näherst Dich der Spielfeldgrenze. Zurück oder stirb."
} forEach _textures;

player setVariable ["IC_setup_texturesShown", _texturesShown];