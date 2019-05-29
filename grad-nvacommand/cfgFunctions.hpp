class GRAD_nvacommand {

  	class client {
    	file = grad-nvacommand\functions\client;

        class addMapEventhandler;
        class addRepairAction { postInit = 1; };
        class alarmDismissAction;
        class curatorInterfaceDetection;
        class curatorOnClick;
        class curatorTowerHandler;
        class curatorTowerInterfaceCreate;
        class deselectAllTowers;
        class forceDefaultMap { postInit = 1; };    	
    	class initMap;
        class raiseAlarm;
        class repairFence;
        class selectTower;
        class towerSelectTarget;
        class zeusSelectDestination;
  	};

    class server {
         file = grad-nvacommand\functions\server;

         class addCBAEvents { postInit = 1; };
         class addFakeCivilian;
         class addSectorPoint;
         class generateSectors;
         class initTowers { postInit = 1; };
         class searchLightScanRandom;
         class getTrianglesForSector;
         class handleAlarm;
         class handleTripFlare;
         class serverLoop { postInit = 1; };
         class towerAlarm;
         class towerGetIn;
         class towerShowOptions;

    };
};