class grad_landline_rscKeypad {
    idd = -1;
    fadein = 0.25;
    fadeout = 0.25;

    movingEnable = 0;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['grad_landline_rscKeypad', _this select 0];";
    onUnload = "uiNamespace setVariable ['grad_landline_rscKeypad', controlNull];";

    class ControlsBackground { };
    
    class objects { };

    class controls {
        class keypad_back: GRAD_landline_RscPicture
            {
               idc = 4000;
               text = "grad-landline\data\keypad_init.paa";
               x = GRAD_LANDLINE_100W/2 - 0.5;
               y = GRAD_LANDLINE_100H/2 - 0.5;
               w = 1;
               h = 1;
             };

        class keypad_front: GRAD_landline_RscPicture
            {
               idc = 5000;
               text = "grad-landline\data\keypad_1.paa";
               x = GRAD_LANDLINE_100W/2 - 0.5;
               y = GRAD_LANDLINE_100H/2 - 0.5;
               w = 1;
               h = 1;
               show = 0;
             };
    };
};