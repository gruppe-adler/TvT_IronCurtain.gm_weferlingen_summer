class IC_missionFlow {

    class client {
        file = IC-missionFlow\functions\client;
        
        class createRespawnInfo;
        class onKilledEH;
        class onRespawnEH;
    };

    class defines {
        file = IC-missionFlow\functions\defines;
        class roles { preInit = 1; };
    };

    class server {
        file = IC-missionFlow\functions\server;

        class addRespawnEH { preInit = 1; };
        class assignIdentity;
        class assignUnitRolesInit { postInit = 1; };
        class createRespawnVehicle;
        class detectSpawnPositions;
        class identityInitConfig { preInit = 1; };        
        class onRespawnEquip;
        class setRespawnPosition;
        class setSideRelation;
    }; 
};