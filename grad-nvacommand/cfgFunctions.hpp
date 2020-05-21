class GRAD_nvacommand {

  	class client {
    	file = grad-nvacommand\functions\client;

        class addMapEventhandler;
        class addRepairAction { postInit = 1; };

        class alarmSetSector;

        class curatorDisableZENactions { postInit = 1; }; 
        class curatorZENAddCustomActions { postInit = 1; }; 

        class curatorInterfaceDetection;
        class curatorInterfaceInfantryCreate;
        class curatorInterfaceTowerCreate;
        class curatorInterfaceVehicleCreate;
        class curatorMutePlayersVoices { postInit = 1; };

        class curatorOnSelect;
        class curatorOnSelectEHAdd;
        class curatorSetCamera;
        
        class deselectAllTowers;
        class forceDefaultMap { postInit = 1; };  

        class fortificationsMouseEH;
        class fortificationsStartBuild;

        class getSectorForPosition;  
        class gateLock;
        
        class GUI_dismiss;
        class GUI_refreshSelects;	
    	class initMap;
        class initTowersLocal;

        class markerFade;
        class markerFenceCut;

        class reinforcementsInit { postInit = 1; }; 
        class reinforcementsGUI;
       
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
         class addTowerToSector;
         class alarmRaise;
         class alarmToggle;
         class curatorNerf { postInit = 1; };
         // class createTower;
         class fenceDamageHandling;
         class generateSectors;
         class getTrianglesForSector;
         class handleTripFlare;
         class hideFakeRunners;
         class searchLightScanRandom;         
         class initSectors { postInit = 1; };
         class initTowers;
         class towerAlarmDismissGroup;
         class towerAlarmDismissLamp;
         class towerAlarmDismissSound;
         class towerAlarmRaiseGroup;
         class towerAlarmRaiseLamp;
         class towerAlarmRaiseSound;
         class towerGetIn;
         class towerShowOptions;

    };

    class ui {
        file = grad-nvacommand\functions\ui;
        class getIconSpeed;
    };
};