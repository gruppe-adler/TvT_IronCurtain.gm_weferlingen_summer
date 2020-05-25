/*
    dog patrol creates a dog patrolling a custom area
    does not attack but creates alarm events
*/

if (!isServer)  exitwith {};

params ["_position", ["_area", [2,10]]];

createAgent ["Alsatian_Random_F", _pos, [], 0, "CAN_COLLIDE"];
_dog setSpeaker "NoVoice";  // If dog is a Unit, need to stop him talking!  If dog is an Agent, you don't need this.
_dog setBehaviour "CARELESS";
_dog disableAI "FSM";
_dog setAnimSpeedCoef 2;
_dog setVariable ["BIS_fnc_animalBehaviour_disable", true];
_dog setSkill 1;

// taken from JBOY Dog
// **************************************************************************
// Add damage eventhandler to dog so it takes X shots to kill it.  And apply
// Bullet hole textures to dog when hit.  One shot by a 9mm causes 2 this
// event handler to fire twice, so I'm using 2 hits to show 1 bullet hole,
// and 4 hits to show 2 bullet holes.  5 or more hits the dog dies.
// **************************************************************************
_dog allowdamage false;
_dog  setVariable ["vOriginalTexture", (getObjectTextures _dog select 0), true];
_dog addEventHandler ["HandleDamage",
{
    private ["_return"];
    _dog = _this select 0;
    _selection = _this select 1;
    _passedDamage = _this select 2;
    _source	= _this select 3;
    _projectile = _this select 4;
    _maxHits = selectRandom [2,3,4,4,4];  // AI controlled dogs and Feral Dogs take less hits to kill.  Exact hits per dog randomly assigned.

    //diag_log["damage",_dog,_selection,_passedDamage,_source,_projectile];
    // log who hurt the dog
	if (_dog getVariable "vAllowDamage") then
	{
		if (_source isKindOf "Man") then
		{
			_dog setVariable ["vWhoHurtDog", _source, true];
		};
		// Do not damage dog if source of damage is dog itself (which appears to be collision damage when dog pushed at target),
		// or projectile is empty string (fall damage).
		if ((_projectile != '') and !(isnull _source )) then
		{
			_hits = _dog getVariable "vHits";
			//diag_log [_dog, "Dog hits:",_hits];

			if (_hits == 0) then
			{
			 _hits = _hits + 1;
		   _dog setVariable ["vHits", _hits, true];

			if (typeOf _dog in ["Fin_tricolour_F","Fin_blackwhite_F","Fin_ocherwhite_F","Alsatian_Sandblack_F","Alsatian_Sand_F","Alsatian_Black_F"]) then
			{
				if (_hits <= _maxHits) then { [_dog, selectRandom [ "boomerYelp", "boomerYelp2"] remoteExec ["say3D", [0,-2] select isDedicated]; };
				if (_hits <= _maxHits) then
				{
					if (((getObjectTextures _dog select 0) find "dogBloodNeck2Hole")==-1) then
					{
						if (((getObjectTextures _dog select 0) find "dogbloodneck")>=0) then
						{
							_dog setobjecttextureGlobal [0,"nvacommand\Textures\dogBloodNeck2Hole" + (typeOf _dog)+".jpg"]; // neck blood + bullet holes
						} else {
							_dog setobjecttextureGlobal [0,"nvacommand\Textures\dogBulletHole2" + (typeOf _dog)+".jpg"]; // bullet holes only
						};
					};
				};
			 };
       //
			 if (_hits > _maxHits) then {
			   _dog setdamage 1;
			 };
		};
	};
    _return = 0;
   _return
}];

// ***********************************************************************
// Continually loop if dog hit and yelp until healed.
// ***********************************************************************

[{
    params ["_args", "_handle"];
    _args params["_dog"];

    if (!alive _dog) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if (_dog getVariable "vHits" > 0) then
    {
        if (random 7 > 6) then {
            [_dog, selectRandom [ "boomerYelp", "boomerYelp2"] remoteExec ["say3D", [0,-2] select isDedicated];
        };
    };
}, 1, [_dog]] call CBA_fnc_addPerFrameHandler;

/*
gDogAnims = ["Dog_Growl","Dog_Run","Dog_Sprint","Dog_Stop","Dog_TurnL","Dog_TurnR","Dog_Walk","Dog_Sitting","Dog_Idling",
  "Dog_Sit_01","Dog_Sit_02","Dog_Sit_03","Dog_Sit_04","Dog_Sit_05","Dog_Sit_06","Dog_Sit_07","Dog_Sit_08",
  "Dog_Idle_01","Dog_Idle_02","Dog_Idle_03","Dog_Idle_04","Dog_Idle_05","Dog_Idle_06","Dog_Idle_07","Dog_Idle_08","Dog_Idle_09","Dog_Idle_10"];
*/
_dog
