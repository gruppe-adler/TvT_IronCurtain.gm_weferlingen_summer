#include "baseRsc.hpp"
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by nomisum, v1.063, #Fydafy)
////////////////////////////////////////////////////////
class gui_spawn_waitplease
{
        idd = 8020;
        movingenable = 0;
        enableSimulation = 1;
        enableDisplay = 1;
        objects[] = {};

        class ControlsBackground
        {
            class gui_spawn_waitplease_bg: grad_nvaCommand_RscBackground
            {
                idc = 8021;
                x = 10 * GUI_GRID_W + GUI_GRID_X;
                y = 0 * GUI_GRID_H + GUI_GRID_Y;
                w = 20 * GUI_GRID_W;
                h = 10 * GUI_GRID_H;
                colorBackground[] = {0,0,0,0.8};
            };
        };

        class Controls {

            class btn_wait_opfor: grad_nvaCommand_RscStructuredText
            {
                idc = 8022;
                text = "sasd";
                x = 16 * GUI_GRID_W + GUI_GRID_X;
                y = 2 * GUI_GRID_H + GUI_GRID_Y;
                w = 12 * GUI_GRID_W;
                h = 3 * GUI_GRID_H;
                colorBackground[] = {0,0,0,1};

            };
        };
};

class grad_nvacommand_gui_tower {
    idd = -1;
    movingEnable = false;
    enableSimulation = true;
     onLoad = "uiNamespace setVariable ['grad_nvacommand_gui_tower', _this select 0];";

    class ControlsBackground {
        class MainBackground: grad_nvaCommand_RscBackground {
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 21 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };

        class RscPicture_1200: grad_nvaCommand_RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(1,1,1,0.2)";
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 3.5 * GUI_GRID_W;
            h = 3 * GUI_GRID_H;
        };
    };

    class Controls {
        class RscText_1001: grad_nvaCommand_RscText
        {
            idc = 1001;
            text = "BT-11"; //--- ToDo: Localize;
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 3 * GUI_GRID_W;
            h = 0.5 * GUI_GRID_H;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.5};
        };

        class RscButton_1600: grad_nvaCommand_RscButton
        {
            idc = 1600;
            text = "Alarm"; //--- ToDo: Localize;
            x = 33 * GUI_GRID_W + GUI_GRID_X;
            y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 6.5 * GUI_GRID_W;
            h = 3 * GUI_GRID_H;
            colorText[] = {1,1,1,1};
            colorBackground[] = {1,1,1,1};
            sizeEx = 0.5 * GUI_GRID_H;
        };
        class RscButton_1601: grad_nvaCommand_RscButton
        {
            idc = 1601;
            text = "Suchscheinwerfer"; //--- ToDo: Localize;
            x = 26 * GUI_GRID_W + GUI_GRID_X;
            y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 6.5 * GUI_GRID_W;
            h = 3 * GUI_GRID_H;
            colorText[] = {1,1,1,1};
            colorBackground[] = {1,1,1,1};
            sizeEx = 0.5 * GUI_GRID_H;
        };
    };
};