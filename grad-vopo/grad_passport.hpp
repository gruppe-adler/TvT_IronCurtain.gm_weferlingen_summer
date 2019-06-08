#include "node_modules\grad-passport\dialog\dialog.hpp"

class DDR_Reisepass: grad_passport_defaultPassport {
    class ControlsBackground: ControlsBackground {
        class BGPic: BGPic {
            text = "grad-vopo\data\ddr-reisepass2.paa";
        };
    };

    class Controls: Controls {
        class LastNameTitle: LastNameTitle {
            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X;
            y = GRAD_PASSPORT_DEFAULT_LINETITLE_Y(0);
            w = (0.1000 * X_SCALE);
            h = GRAD_PASSPORT_LINE_H;

            text = "";
            sizeEx = GRAD_PASSPORT_DEFAULT_TITLETEXTSIZE;

            colorText[] = {0,0,0,1};
        };
        class LastName: LastName {
            idc = GRAD_IDC_LASTNAME;

            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X + GRAD_PASSPORT_DEFAULT_INDENT_X;
            y = GRAD_PASSPORT_DEFAULT_LINE_Y(0);
            w = GRAD_PASSPORT_CONTENT_W;
            h = GRAD_PASSPORT_LINE_H;

            colorText[] = {0,0,0,1};
        };
        class FirstNameTitle: FirstNameTitle {
            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X;
            y = GRAD_PASSPORT_DEFAULT_LINETITLE_Y(1);
            w = (0.1000 * X_SCALE);
            h = GRAD_PASSPORT_LINE_H;

            text = "Given names";
            sizeEx = GRAD_PASSPORT_DEFAULT_TITLETEXTSIZE;

            colorText[] = {0,0,0,1};
        };
        class FirstName: FirstName {
            idc = GRAD_IDC_FIRSTNAME;

            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X;
            y = GRAD_PASSPORT_DEFAULT_LINE_Y(1);
            w = GRAD_PASSPORT_CONTENT_W;
            h = GRAD_PASSPORT_LINE_H;

            colorText[] = {0,0,0,1};
        };
        class DateOfBirthTitle: DateOfBirthTitle {
            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X;
            y = GRAD_PASSPORT_DEFAULT_LINETITLE_Y(2);
            w = (0.1000 * X_SCALE);
            h = GRAD_PASSPORT_LINE_H;

            text = "";
            sizeEx = GRAD_PASSPORT_DEFAULT_TITLETEXTSIZE;

            colorText[] = {0,0,0,1};
        };
        class DateOfBirth: DateOfBirth {
            idc = GRAD_IDC_DATEOFBIRTH;

            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X;
            y = GRAD_PASSPORT_DEFAULT_LINE_Y(2);
            w = GRAD_PASSPORT_CONTENT_W;
            h = GRAD_PASSPORT_LINE_H;

            colorText[] = {0,0,0,1};
        };
        class PlaceOfBirthTitle: PlaceOfBirthTitle {
            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X;
            y = GRAD_PASSPORT_DEFAULT_LINETITLE_Y(3);
            w = (0.1000 * X_SCALE);
            h = GRAD_PASSPORT_LINE_H;

            text = "";
            sizeEx = GRAD_PASSPORT_DEFAULT_TITLETEXTSIZE;

            colorText[] = {0,0,0,1};
        };
        class PlaceOfBirth: PlaceOfBirth {
            idc = GRAD_IDC_PLACEOFBIRTH;

            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X;
            y = GRAD_PASSPORT_DEFAULT_LINE_Y(3);
            w = GRAD_PASSPORT_CONTENT_W;
            h = GRAD_PASSPORT_LINE_H;

            colorText[] = {0,0,0,1};
        };
        class ExpiresTitle: ExpiresTitle {
            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X;
            y = GRAD_PASSPORT_DEFAULT_LINETITLE_Y(2);
            w = (0.1000 * X_SCALE);
            h = GRAD_PASSPORT_LINE_H;

            text = "Date of expiry";
            sizeEx = GRAD_PASSPORT_DEFAULT_TITLETEXTSIZE;

            colorText[] = {0,0,0,1};
        };
        class Expires: Expires {
            idc = GRAD_IDC_EXPIRES;

            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X;
            y = GRAD_PASSPORT_DEFAULT_LINE_Y(2);
            w = GRAD_PASSPORT_CONTENT_W;
            h = GRAD_PASSPORT_LINE_H;

            colorText[] = {0,0,0,1};
        };
        class Serial: Serial {
            idc = GRAD_IDC_SERIAL;

            x = GRAD_PASSPORT_DEFAULT_RIGHTCOLUMN_X;
            y = GRAD_PASSPORT_DEFAULT_LINE_Y(3);
            w = GRAD_PASSPORT_CONTENT_W;
            h = GRAD_PASSPORT_LINE_H;

            font = "EtelkaMonospacePro";
            sizeEx = 0.03 * TEXT_SCALE;
            colorText[] = {0,0,0,1};
        };
    };
};

