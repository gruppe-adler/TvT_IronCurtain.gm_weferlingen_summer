class CfgReinforcements {

    class gm_gc_bgs_p601 {
        maxCount = 3;
        displayName = "Aufklärungs-Trabant";
        pic = "grad-nvacommand\vehicles\trabant.paa";
        crewControl = 0;
        vehicleVoice = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\gm_vehname_trabant_s.ogg";

        crew[] = {
            "gm_gc_bgs_rifleman_mpikm72_80_str"
        };

        cargo[] = {
            "gm_gc_bgs_rifleman_mpikm72_80_str",
            "gm_gc_bgs_rifleman_mpikm72_80_str",
            "gm_gc_bgs_rifleman_mpikm72_80_str"
        };
    };

    class gm_gc_army_ural4320_cargo_oli {
        maxCount = 3;
        displayName = "Mot. Infanterie";
        pic = "grad-nvacommand\vehicles\truck.paa";
        crewControl = 1;
        vehicleVoice = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\veh_infantry_p_2.ogg";

        crew[] = {
            "gm_gc_bgs_rifleman_mpikm72_80_str"
        };

        cargo[] = {
            "gm_gc_army_squadleader_mpiak74n_80_str",
            "gm_gc_army_rifleman_mpiak74n_80_str",
            "gm_gc_army_machinegunner_lmgrpk_80_str",
            "gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk_80_str",
            "gm_gc_army_squadleader_mpiak74n_80_str",
            "gm_gc_army_antitank_mpiak74n_rpg7_80_str",
            "gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str",
            "gm_gc_army_rifleman_mpiak74n_80_str",
            "gm_gc_army_rifleman_mpiak74n_80_str"
        };
    };

    class gm_gc_army_brdm2_oli {
        maxCount = 2;
        displayName = "Recon BRDM2";
        pic = "grad-nvacommand\vehicles\brdm.paa";
        crewControl = 0;
        vehicleVoice = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\gm_vehname_brdm_s.ogg";

        crew[] = {
            "gm_gc_army_crew_mpiaks74nk_80_blk",
            "gm_gc_army_crew_mpiaks74nk_80_blk",
            "gm_gc_army_crew_mpiaks74nk_80_blk"
        };
    };

    class gm_gc_army_pt76b_oli {
        maxCount = 2;
        displayName = "Recon PT76B";
        pic = "grad-nvacommand\vehicles\pt76.paa";
        crewControl = 0;
        vehicleVoice = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\gm_vehname_bmp_s.ogg";

        crew[] = {
            "gm_gc_army_crew_mpiaks74nk_80_blk",
            "gm_gc_army_crew_mpiaks74nk_80_blk",
            "gm_gc_army_crew_mpiaks74nk_80_blk"
        };
    };

    class gm_gc_army_ural4320_repair_oli {
        displayName = "Logistik LKW";
        maxCount = 2;
        pic = "grad-nvacommand\vehicles\repair.paa";
        crewControl = 0;
        vehicleVoice = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\Supporting.ogg";

        crew[] = {
            "gm_gc_bgs_rifleman_mpikm72_80_str",
            "gm_gc_bgs_rifleman_mpikm72_80_str"
        };
    };

    class gm_gc_army_t55am2b {
        displayName = "Kpz T55-AM2B";
        maxCount = 1;
        pic = "grad-nvacommand\vehicles\tank.paa";
        crewControl = 0;
        vehicleVoice = "gm\gm_languages\gm_deu_language\data\voice1\voicefiles\Normal\gm_vehname_t55_s.ogg";
        

        crew[] = {
            "gm_gc_army_crew_mpiaks74nk_80_blk",
            "gm_gc_army_crew_mpiaks74nk_80_blk",
            "gm_gc_army_crew_mpiaks74nk_80_blk",
            "gm_gc_army_crew_mpiaks74nk_80_blk"
        };
    };
};