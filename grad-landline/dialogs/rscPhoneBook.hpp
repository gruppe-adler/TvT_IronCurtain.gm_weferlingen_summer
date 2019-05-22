#include "rscDefines.hpp"

#define CT_STRUCTURED_TEXT          13
#define ST_LEFT                     0x00

#define GRAD_LANDLINE_100H             safeZoneH
#define GRAD_LANDLINE_100W             safeZoneX + safeZoneW
#define GRAD_COLUMN_COUNT              10
#define GRAD_COLUMN_W                  GRAD_LANDLINE_100W/GRAD_COLUMN_COUNT
#define GRAD_ROW_COUNT                 20
#define GRAD_ROW_H                     (safeZoneY + GRAD_LANDLINE_100H)/GRAD_ROW_COUNT

#define GRAD_LANDLINE_PHONEBOOK_X      GRAD_COLUMN_W // single column padding
#define GRAD_LANDLINE_PHONEBOOK_Y      GRAD_ROW_H*2 + safeZoneY
#define GRAD_LANDLINE_PHONEBOOK_W      GRAD_COLUMN_W*4
#define GRAD_LANDLINE_PHONEBOOK_H      GRAD_ROW_H*16


class grad_landline_rscPhoneBook {
    idd = -1;
    fadein = 0.25;
    fadeout = 0.25;

    movingEnable = 0;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['grad_landline_rscPhoneBook', _this select 0];";
    onUnload = "uiNamespace setVariable ['grad_landline_rscPhoneBook', controlNull]; [] call GRAD_landline_fnc_cleanPhoneBookMap;";

    class ControlsBackground { };
    
    class objects { };

    class controls {
        class phoneBookList: GRAD_landline_RscListBox
            {
                idc = 1000;
                x = GRAD_LANDLINE_PHONEBOOK_X;
                y = GRAD_LANDLINE_PHONEBOOK_Y;
                w = (GRAD_LANDLINE_100W/2) - (GRAD_COLUMN_W); // 0.7
                h = GRAD_LANDLINE_PHONEBOOK_H;
                colorBackground[] = {0,0,0,0.85};
                canDrag=false;
                text = "";
                rowHeight = GRAD_ROW_H*2;
                onLBSelChanged = "_this call GRAD_landline_fnc_onPhoneBookEntrySelect";
            };
        class phoneBookMap: GRAD_landline_RscMapControl 
            {
                idc = 2000;
                x = GRAD_LANDLINE_100W/2;
                y = GRAD_LANDLINE_PHONEBOOK_Y;
                w = (GRAD_LANDLINE_100W/2) - (GRAD_COLUMN_W); // 0.7
                h = GRAD_LANDLINE_PHONEBOOK_H;
                onMouseButtonClick = "_this call GRAD_landline_fnc_onPhoneBookMapClick";
            };
        class phoneBookButton: GRAD_landline_RscButton
            {
                text = "Anrufen";
                idc = 3000;
                x = GRAD_LANDLINE_PHONEBOOK_X;
                y = GRAD_LANDLINE_PHONEBOOK_H + GRAD_LANDLINE_PHONEBOOK_Y;
                w = GRAD_LANDLINE_100W - (GRAD_COLUMN_W*2);
                h = GRAD_ROW_H*2;
            };
    };
};