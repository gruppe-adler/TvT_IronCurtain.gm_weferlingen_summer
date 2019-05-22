class GRAD_nvacommand {

  	class client {
    	file = grad-nvacommand\functions\client;

    	class addMapEventhandler;
        class addRepairAction { postInit = 1; };
        class alarmDismissAction;
        class deselectAllTowers;
        class forceDefaultMap { postInit = 1; };    	
    	class initMap;
        class raiseAlarm;
        class repairFence;
        class selectTower;
  	};

    class server {
         file = grad-nvacommand\functions\server;

         class addCBAEvents { postInit = 1; };
         class addSectorPoint;
         class generateSectors;
         class initTowers { postInit = 1; };
         class getTrianglesForSector;
         class handleAlarm;
         class serverLoop { postInit = 1; };
         class towerAlarm;
         class towerGetIn;
         class towerShowOptions;
    };
};