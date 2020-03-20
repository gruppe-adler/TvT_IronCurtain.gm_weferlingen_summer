class CfgGradCivs {
    autoInit = 1;
    maxCivsOnFoot = 25;
    maxCivsResidents = 15;
    maxCivsInVehicles = 10;
    spawnDistancesOnFoot[] = {1000,4500};
    spawnDistancesInVehicles[] = {1000,4500};
    debugCivState = 0;
    debugFps = 0;
    minCivUpdateTime = 3;
    minFps = 40;
    automaticVehicleGroupSize = 1;
    exitOn = "";
    onSpawn = "diag_log format ['%1 spawned', typeOf (_this select 0)];";
    onHeldUp = "";    
    backpackProbability = 0.1;

    vehicles[] = {
        "gm_gc_civ_p601",
        "gm_gc_civ_p601",
        "gm_gc_civ_p601",
        "gm_gc_civ_p601",
        "gm_gc_civ_p601",
        "RDS_Gaz24_Civ_03",
        "RDS_Gaz24_Civ_01",
        "RDS_Gaz24_Civ_02",
        "RDS_Ikarus_Civ_01",
        "RDS_JAWA353_Civ_01",
        "RDS_Old_bike_Civ_01",
        "RDS_S1203_Civ_01",
        "RDS_S1203_Civ_02",
        "RDS_Lada_Civ_01",
        "RDS_Lada_Civ_03",
        "RDS_Lada_Civ_02",
        "C_Tractor_01_F"
    };

    goggles[] = {
        "TRYK_Beard_BK",
        "TRYK_Beard_BK2",
        "TRYK_Beard_BK3",
        "",
        "",
        "",
        "",
        "",
        ""
    };

    backpacks[] = {
        "rhs_sidor",
        "gm_pl_army_backpack_80_oli",
        "gm_gc_army_backpack_80_assaultpack_str",
        "gm_pl_army_backpack_at_80_gry",
        "gm_ge_backpack_satchel_80_blk",
        "rhs_medic_bag",
        "rhs_assault_umbts"
    };

    clothes[] = {
        "gm_ge_civ_uniform_blouse_80_gry",
        "gm_gc_civ_uniform_man_02_80_brn",
        "gm_gc_civ_uniform_man_01_80_blu",
        "gm_gc_civ_uniform_man_01_80_blk",
        "rds_uniform_citizen1",
        "rds_uniform_citizen2",
        "rds_uniform_citizen3",
        "rds_uniform_citizen4",
        "rds_uniform_Functionary1",
        "rds_uniform_Functionary2",
        "U_O_R_Gorka_01_F",
        "U_Marshal",
        "rds_uniform_Rocker1",
        "rds_uniform_Rocker2",
        "rds_uniform_Rocker3",
        "rds_uniform_Rocker4",
        "rds_uniform_schoolteacher"
    };

    headgear[] = {
        "U_I_G_Story_Protagonist_F",
        "H_Hat_brown",
        "H_Hat_grey",
        "rds_rocker_hair1",
        "rds_rocker_hair2",
        "rds_rocker_hair3",
        "rds_Woodlander_cap3",
        "rds_Woodlander_cap4",
        "rds_Woodlander_cap3",
        "rds_Woodlander_cap4",
        "rds_Villager_cap1",
        "",
        "",
        "",
        "",
        ""
    };

    faces[] = {
        "WhiteHead_02",
        "WhiteHead_03",
        "WhiteHead_04",
        "WhiteHead_05",
        "WhiteHead_06",
        "WhiteHead_07",
        "WhiteHead_08",
        "WhiteHead_09",
        "WhiteHead_10",
        "WhiteHead_11",
        "GreekHead_A3_01",
        "GreekHead_A3_02",
        "GreekHead_A3_03",
        "GreekHead_A3_04",
        "GreekHead_A3_05",
        "GreekHead_A3_06",
        "GreekHead_A3_07",
        "GreekHead_A3_08",
        "GreekHead_A3_09",
        "RussianHead_1",
        "RussianHead_2",
        "RussianHead_3",
        "RussianHead_4",
        "RussianHead_5",
        "WhiteHead_16",
        "WhiteHead_17",
        "WhiteHead_18",
        "WhiteHead_19",
        "WhiteHead_20",
        "WhiteHead_21",
        "WhiteHead_22_a",
        "WhiteHead_22_l",
        "WhiteHead_22_sa",
        "WhiteHead_23",
        "WhiteHead_24",
        "WhiteHead_25",
        "WhiteHead_26",
        "WhiteHead_27",
        "WhiteHead_28",
        "WhiteHead_29",
        "WhiteHead_30",
        "WhiteHead_31",
        "WhiteHead_32",
        "LivonianHead_1",
        "LivonianHead_2",
        "LivonianHead_3",
        "LivonianHead_4",
        "LivonianHead_5",
        "LivonianHead_6",
        "LivonianHead_7",
        "LivonianHead_8",
        "LivonianHead_9",
        "LivonianHead_10"
    };
};