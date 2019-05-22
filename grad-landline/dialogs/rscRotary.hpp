class grad_landline_rscRotary {
    idd = -1;
    fadein = 0.25;
    fadeout = 0.25;

    movingEnable = 0;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['grad_landline_rscRotary', _this select 0];";
    onUnload = "uiNamespace setVariable ['grad_landline_rscRotary', controlNull];";

    class ControlsBackground { };
    
    class objects { };

    class controls {
        class rotary_back: GRAD_landline_RscPicture
            {
               idc = 4000;
               text = "grad-landline\data\rotary_back.paa";
               x = GRAD_LANDLINE_100W/2 - 0.5;
               y = GRAD_LANDLINE_100H/2 - 0.5;
               w = 1;
               h = 1;
             };

        class rotary_front: GRAD_landline_RscPicture
            {
               idc = 5000;
               text = "grad-landline\data\rotary_front.paa";
               x = GRAD_LANDLINE_100W/2 - 0.5;
               y = GRAD_LANDLINE_100H/2 - 0.5;
               w = 1;
               h = 1;
             };

        class rotary_ping: GRAD_landline_RscPicture
            {
               idc = -1;
               text = "grad-landline\data\rotary_ping.paa";
               x = GRAD_LANDLINE_100W/2 - 0.5;
               y = GRAD_LANDLINE_100H/2 - 0.5;
               w = 1;
               h = 1;
             };
    };
};