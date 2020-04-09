/*
    
    mute players on curator client permanently
    only communication via radio/phone should be possible

*/

if (!(player getVariable ["GRAD_nvacommand_isCommander", false])) exitWith {};

[{
    
    { 
        _x setVariable ["tf_voiceVolume", 0];
    } forEach  allPlayers;

}, 1, []] call CBA_fnc_addPerFrameHandler;