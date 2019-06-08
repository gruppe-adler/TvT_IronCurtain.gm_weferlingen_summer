class CfgFaces
    {
        class Default
        {
            class Default
            {
                name = "";
                head = "";
                material = "";
                texture = "#(rgb,8,8,3)color(0.5,0.5,1,1)";
                textureHL = "#(rgb,8,8,3)color(0.5,0.5,1,1)";
                materialHL = "";
                identityTypes[] = {"Default"};


                Man_A3


                Barklem


                displayName == face player
            }
        }
    }



    

            class CfgHeads
    {
        class Air
        {
            friction = 10;
            movement = 160;
            maxAmp = 0.05;
            maxSpeed = 3;
            radius = 0.2;
        };
        class Land
        {
            friction = 20;
            movement = 260;
            maxAmp = 0.1;
            maxSpeed = 4;
            radius = 0.3;
        };
        class Default_A3

        class MaskHead_A3: Default_A3
        {
            model = "\A3\Characters_F\Heads\m_white_01";
