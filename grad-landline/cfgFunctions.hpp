class GRAD_landline {

    class client_actions {
        file = grad-landline\functions\client\actions;

        class addAction;
        class addSelfAction;
        class cleanPhoneBookMap;
        class conditionAccept;
        class conditionCall;
        class conditionDirectCall;
        class conditionEnd;
        class createPhoneList;
        class onPhoneBookEntrySelect;
        class onPhoneBookMapClick;
    };

     class client_keypad {
        file = grad-landline\functions\client\keypad;

        class keypadDialNumber;
        class keypadProcessInput;
    };

    class client_rotary {
        file = grad-landline\functions\client\rotary;

        class rotaryDialNumber;
        class rotaryProcessInput;
        class rotarySetAngle;
    };

    class client_calls {
        file = grad-landline\functions\client\calls;

        class callAccept;
        class callDeleteInfo;
        class callEnd;
        class callGetInfo;
        class callGetOwner;
        class callGetStatus;
        class callPluginActivate;
        class callPluginDeactivate;
        class callSaveInfo;
        class callSetOwner;
        class callSetStatus;
        class callStart;
        class callWaiting;

    };

    class client_hooking {
        file = grad-landline\functions\client\hooking;

        class hookEnd;
        class hookStart;
        class hookShowCalls;
    };


    class client_sounds {
        file = grad-landline\functions\client\sounds;

        class soundBusy;
        class soundHookEnd;
        class soundHookRemote;
        class soundHookStart;
        class soundInterrupted;
        class soundRing;
        class soundWaiting;

    };

    class client_far {
        file = grad-landline\functions\client\tfar;

      class setTFARfakeRadio;
    };




    class server_calls {
       file = grad-landline\functions\server\calls;

       class callRegister;
       class callRinging;
       class callUnregister;
    };

    class server_core {
       file = grad-landline\functions\server\core;

       class addPhone;
       class distributePhones;
       class initServer { preInit = 1; };
    };

    class server_number {
       file = grad-landline\functions\server\number;

       class assignPhoneNumber;
       class extractNumberFromPrefix;
       class generateBaseNumber;
       class generatePhoneNumber;
    };
    
};