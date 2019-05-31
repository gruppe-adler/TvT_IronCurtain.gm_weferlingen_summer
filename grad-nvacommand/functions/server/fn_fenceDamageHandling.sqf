params ["_fence"];

_fence allowDamage false;

_fence addEventHandler ["EpeContactStart", { 
        params ["_object1", "_object2", "_selection1", "_selection2", "_force"]; 

        systemChat (str _force);

        if (_object2 isKindOf "Car_F" && _force > 1000) then { 
            _object1 setDamage 1;
            _object2 sethit ["wheel_1_1_steering", 1];
            _object2 sethit ["wheel_1_2_steering", 1];
            systemChat (str _force);
        };

        if (_object2 isKindOf "Tank") then { 
            _object1 setDamage 1;
            systemChat ("tank has no prob");
        };

}];

_fence addEventHandler ["HandleDamage", {
    0
}];

// only break wheels?
// this sethit [""wheel_1_1_steering"", 1];