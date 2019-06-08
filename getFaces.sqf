// TODO

params ["_unit"];

private _face = face _unit;

private _faces = "true" configClasses (configFile >> "Cfgfaces");

{
    private _bla = "true" configClasses (_x);
    
    {    
        private _blo = "true" configClasses (_x);
        copyToClipboard str _blo;
    } forEach _bla;
} forEach _faces;

////


private _count =  count (configFile >> "CfgFaces" >> "Man_A3");
for "_x" from 0 to (_count-1) do
{
    copyToClipBoard str (getText ((configFile >> "CfgFaces" >> "Man_A3") select _x) >> "displayName"));
};