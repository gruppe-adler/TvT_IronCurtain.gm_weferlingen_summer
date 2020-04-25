class IC_setup {

    class client {
        file = IC-setup\functions\client;

        class addGameAreaBarrier { postInit = 1; };
        class detectBorderFence;
        class showBarrier;
        class hideBarrier;
    }; 

    class server {
        file = IC-setup\functions\server;

        class createSAM70 { postInit = 1; };
    };
};