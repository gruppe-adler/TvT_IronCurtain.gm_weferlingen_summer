class GRAD_nvacommand {

  	class client {
    	file = grad-nvacommand\functions\client;

        class addMapEventhandler;
        class addRepairAction { postInit = 1; };
        class alarmGetSector;
        class alarmSetSector;
        class alarmSetTower;
        class curatorInterfaceDetection;
        class curatorInterfaceInfantryCreate;
        class curatorInterfaceTowerCreate;

        class curatorOnSelect;
        class curatorOnSelectEH;
        class curatorSetCamera;
        
        class deselectAllTowers;
        class forceDefaultMap { postInit = 1; };    
        class GUI_dismiss;
        class GUI_refreshSelects;	
    	class initMap;
        class initTowersLocal;

        class markerFade;
        class markerFenceCut;
        
        class raiseAlarm;
        class repairFence;
        class towerCenterSelected;
        class towerGetNearest;
        class towerIsAlarmed;
        class towerSelectTarget;
        class zeusSelectDestination;
  	};

    class server {
         file = grad-nvacommand\functions\server;

         class addCBAEvents { postInit = 1; };
         class addFakeCivilian;
         class addSectorPoint;
         class fenceDamageHandling;
         class generateSectors;
         class getTrianglesForSector;
         class handleTripFlare;
         class hideFakeRunners;
         class initTowers { postInit = 1; };
         class searchLightScanRandom;         
         class serverLoop { postInit = 1; };
         class towerAlarmDismiss;
         class towerAlarmRaise;
         class towerGetIn;
         class towerShowOptions;

    };
};