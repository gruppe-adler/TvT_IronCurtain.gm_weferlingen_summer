class GRAD_nvacommand {

  	class client {
    	file = grad-nvacommand\functions\client;

        class addMapEventhandler;
        class addRepairAction { postInit = 1; };
        class alarmGetSector;
        class alarmSetSector;
        class alarmSetTower;
        class curatorInterfaceDetection;
        class curatorOnSelect;
        class curatorOnSelectEH;
        class curatorInterfaceInfantryCreate;
        class curatorInterfaceTowerCreate;
        class deselectAllTowers;
        class forceDefaultMap { postInit = 1; };    
        class GUI_dismiss;
        class GUI_refreshSelects;	
    	class initMap;
        class raiseAlarm;
        class repairFence;
        class towerCenterSelected;
        class towerSelectTarget;
        class towerGetNearest;
        class towerIsAlarmed;
        class zeusSelectDestination;
  	};

    class server {
         file = grad-nvacommand\functions\server;

         class addCBAEvents { postInit = 1; };
         class addFakeCivilian;
         class addSectorPoint;
         class fenceDamageHandling;
         class generateSectors;
         class initTowers { postInit = 1; };
         class searchLightScanRandom;
         class getTrianglesForSector;
         class handleTripFlare;
         class serverLoop { postInit = 1; };
         class towerAlarmDismiss;
         class towerAlarmRaise;
         class towerGetIn;

    };
};