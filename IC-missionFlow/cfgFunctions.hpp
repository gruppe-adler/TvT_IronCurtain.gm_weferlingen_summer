class IC_missionFlow {

    class client {
        file = IC-missionFlow\functions\client;
        
        class createRespawnInfo;
        class createRespawnVehicle;
        class onKilledEH;
        class onRespawnEquip;
        class onRespawnEH {};
        class setRespawnPosition;
    };

    class defines {
        file = IC-missionFlow\functions\defines;
        class roles { preInit = 1; };
    };

    class server {
        file = IC-missionFlow\functions\server;

        class addRespawnEH { postInit = 1; };
        class assignIdentity;
        class assignUnitRolesInit { postInit = 1; };
        class identityInitConfig { preInit = 1; };
    }; 
};