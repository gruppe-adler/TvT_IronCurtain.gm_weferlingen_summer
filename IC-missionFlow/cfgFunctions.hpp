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

    class server {
        file = IC-missionFlow\functions\server;

        class addRespawnEH { postInit = 1; };
    }; 
};