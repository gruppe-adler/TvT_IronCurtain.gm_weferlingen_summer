class CfgNVAFortifications {

    class Fortifications {
        class land_gm_gc_lamp_02_01 {
            demolitionTime = 20;
            icon = "grad-nvacommand\vehicles\build_lamp";
            amount = 40;
            displayName = "Flutlicht";
            info = "Erhellt nachts dunkle und schwer einsehbare Bereiche.";
        };
        class ACE_FlareTripMine {
            demolitionTime = 3;
            icon = "grad-nvacommand\vehicles\build_tripflare";
            amount = 40;
            displayName = "Stolperdraht";
            info = "Schießt bei Betreten eine Leuchtkugel in den Himmel und löst Alarm aus.";
        };
        class land_gm_tanktrap_02 {
            demolitionTime = 30;
            icon = "grad-nvacommand\vehicles\build_hedgehog";
            amount = 20;
            displayName = "Panzersperre";
            info = "Härtet Grenzbereiche gegen Fahrzeuge aller Art.";
        };
        class land_gm_flanders_fence_01 {
            demolitionTime = 30;
            icon = "grad-nvacommand\vehicles\build_fence";
            amount = 10;
            displayName = "Flandernzaun";
            info = "Erschwert den Zutritt zu Grenzbereichen für Fußgänger.";
        };
        class land_gm_gc_g501_sm70_02 {
            magneticTo = "land_gm_fence_border_gz1_600";
            demolitionTime = 60;
            icon = "grad-nvacommand\vehicles\build_SM70";
            amount = 20;
            displayName = "SM-70";
            info = "Tödliche Selbstschussanlage, löst bei Annäherung aus.";
        };
        class land_gm_wall_gc_borderpost_04 {
            demolitionTime = 20;
            icon = "grad-nvacommand\vehicles\build_gmn";
            amount = 20;
            displayName = "Grenzmeldenetz-Stehle";
            info = "Ermöglicht die Kontaktaufnahme zum NVA-Kommandanten durch NVA, VoPo und Stasi.";
            customScript = "grad-nvacommand\functions\ui\fn_actionBuildGrenzmeldenetz.sqf";
        };
        class Land_Psi_bouda {
            demolitionTime = 60;
            icon = "grad-nvacommand\vehicles\build_hunde";
            amount = 20;
            displayName = "Hundelaufanlage";
            info = "Warnt im Bereich 200m um die Anlage vor Annäherung durch Fußgänger.";
            customScript = "grad-nvacommand\functions\ui\fn_actionBuildHundelaufanlage.sqf";
        };
    };
};
