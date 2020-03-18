#include "..\node_modules\grad-passport\dialog\dialog.hpp"

class DDR_Reisepass: grad_passport_defaultPassport {
    class ControlsBackground: ControlsBackground {
        class BGPic: BGPic {
            text = "grad-vopo\data\ddr-reisepass.paa";
            x = GRAD_PASSPORT_DEFAULT_X/4;
            y = GRAD_PASSPORT_DEFAULT_Y/4;
            w = GRAD_PASSPORT_DEFAULT_W*2;
            h = GRAD_PASSPORT_DEFAULT_H*2;
        };
    };

    class Controls: Controls {
        class LastNameTitle: LastNameTitle {
            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X*1.20;
            y = GRAD_PASSPORT_DEFAULT_LINETITLE_Y(0);
            w = (0.1000 * X_SCALE);
            h = GRAD_PASSPORT_LINE_H;

            text = "";
            sizeEx = GRAD_PASSPORT_DEFAULT_TITLETEXTSIZE;

            colorText[] = {0.1,0.31,0.48,1};
        };
        class LastName: LastName {
            idc = GRAD_IDC_LASTNAME;

            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X + GRAD_PASSPORT_DEFAULT_INDENT_X*1.20;
            y = GRAD_PASSPORT_DEFAULT_LINE_Y(0) * 0.75;
            w = GRAD_PASSPORT_CONTENT_W;
            h = GRAD_PASSPORT_LINE_H;

            colorText[] = {0.05,0.15,0.24,1};
        };
        class FirstNameTitle: FirstNameTitle {
            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X*1.20;
            y = GRAD_PASSPORT_DEFAULT_LINETITLE_Y(1) * 0.75;
            w = (0.1000 * X_SCALE);
            h = GRAD_PASSPORT_LINE_H;

            text = "Name";
            sizeEx = GRAD_PASSPORT_DEFAULT_TITLETEXTSIZE;

            colorText[] = {0.1,0.31,0.48,1};
        };
        class FirstName: FirstName {
            idc = GRAD_IDC_FIRSTNAME;

            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X*1.20;
            y = GRAD_PASSPORT_DEFAULT_LINE_Y(1) * 0.75;
            w = GRAD_PASSPORT_CONTENT_W;
            h = GRAD_PASSPORT_LINE_H;

            colorText[] = {0.05,0.15,0.24,1};
        };
        class DateOfBirthTitle: DateOfBirthTitle {
            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X*1.20;
            y = GRAD_PASSPORT_DEFAULT_LINETITLE_Y(2) * 0.75;
            w = (0.1000 * X_SCALE);
            h = GRAD_PASSPORT_LINE_H;

            text = "Geburtsdatum";
            sizeEx = GRAD_PASSPORT_DEFAULT_TITLETEXTSIZE;

            colorText[] = {0.1,0.31,0.48,1};
        };
        class DateOfBirth: DateOfBirth {
            idc = GRAD_IDC_DATEOFBIRTH;

            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X*1.20;
            y = GRAD_PASSPORT_DEFAULT_LINE_Y(2) * 0.75;
            w = GRAD_PASSPORT_CONTENT_W;
            h = GRAD_PASSPORT_LINE_H;

            colorText[] = {0.05,0.15,0.24,1};
        };
        class PlaceOfBirthTitle: PlaceOfBirthTitle {
            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X*1.20;
            y = GRAD_PASSPORT_DEFAULT_LINETITLE_Y(3) * 0.75;
            w = (0.1000 * X_SCALE);
            h = GRAD_PASSPORT_LINE_H;

            text = "Geburtsort";
            sizeEx = GRAD_PASSPORT_DEFAULT_TITLETEXTSIZE;

            colorText[] = {0.1,0.31,0.48,1};
        };
        class PlaceOfBirth: PlaceOfBirth {
            idc = GRAD_IDC_PLACEOFBIRTH;

            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X*1.20;
            y = GRAD_PASSPORT_DEFAULT_LINE_Y(3) * 0.75;
            w = GRAD_PASSPORT_CONTENT_W;
            h = GRAD_PASSPORT_LINE_H;

            colorText[] = {0.05,0.15,0.24,1};
        };
        class ExpiresTitle: ExpiresTitle {
            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X*1.20;
            y = GRAD_PASSPORT_DEFAULT_LINETITLE_Y(4) * 0.9;
            w = (0.1000 * X_SCALE);
            h = GRAD_PASSPORT_LINE_H;

            text = "Ablaufdatum";
            sizeEx = GRAD_PASSPORT_DEFAULT_TITLETEXTSIZE;

            colorText[] = {0.1,0.31,0.48,1};
        };
        class Expires: Expires {
            idc = GRAD_IDC_EXPIRES;

            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X*1.20;
            y = GRAD_PASSPORT_DEFAULT_LINE_Y(4) * 0.9;
            w = GRAD_PASSPORT_CONTENT_W;
            h = GRAD_PASSPORT_LINE_H;

            colorText[] = {0.05,0.15,0.24,1};
        };
        class Serial: Serial {
            idc = GRAD_IDC_SERIAL;

            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X*1.20;
            y = GRAD_PASSPORT_DEFAULT_LINE_Y(5) * 0.9;
            w = GRAD_PASSPORT_CONTENT_W;
            h = GRAD_PASSPORT_LINE_H;

            font = "EtelkaMonospacePro";
            sizeEx = 0.03 * TEXT_SCALE;
            colorText[] = {0.025,0.08,0.12,1};
        };
    };
};

