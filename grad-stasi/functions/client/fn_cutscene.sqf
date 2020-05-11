/*

execVM "grad-stasi/functions/client/fn_cutscene.sqf";

*/

private _position = getPos stasi_cutscene_cam;

private _cam = "camera" camCreate _position;
_cam cameraeffect ["internal","back"];
cameraEffectEnableHUD false;
_cam camSetTarget stasi_cutscene_paper;
_cam camSetFov 0.45;
_cam camCommit 0;

["BlackAndWhite", 3, false] call BIS_fnc_setPPeffectTemplate;

private _filmgrain = ppEffectCreate ["FilmGrain",2000];
_filmgrain ppEffectEnable true;
_filmgrain ppEffectAdjust [0.3,0.3,0.12,0.12,0.12,true];
_filmgrain ppEffectCommit 0;

setAperture 15;

stasi_cutscene_officer switchmove "InBaseMoves_table1";
stasi_cutscene_victim switchmove "acex_sitting_HubSittingChairB_move1";

stasi_cutscene_officer disableAI "ALL";
stasi_cutscene_victim disableAI "ALL";
{
    _x addEventHandler ["AnimDone", {
        params ["_unit", "_anim"];

        _unit switchmove _anim;

    }];
} forEach [stasi_cutscene_officer, stasi_cutscene_victim];