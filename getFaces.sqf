// TODO

params ["_unit"];

private _configText = configName ("(configName _x == face player)" configClasses (configFile >> "Cfgfaces" >> "Man_A3") select 0);
private _position = AGLtoASL getPos player;
private _simpleObject = createSimpleObject [_configText, _position];

_position set [2,1.8];
_simpleObject setPos _position;

hint str _simpleObject;

_simpleObject

// _model

// private _head = getText (_configText >> "head");

// private _model = getText (configfile >> "CfgHeads" >> _head >> "model");

// private _cleanString = [_model,1] call BIS_fnc_trimString;
// private _simpleObject = createSimpleObject [(_cleanString + ".p3d"), _position];

// configfile >> "CfgFaces" >> "Man_A3" >> "GreekHead_A3_06"

// "\A3\Characters_F\Heads\m_greek_01"
// "a3\characters_f\heads\m_greek_01.p3d" <-- works
// "A3\Characters_F\Heads\m_greek_01"