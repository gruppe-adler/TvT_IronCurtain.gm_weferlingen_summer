// todo: remove after dev
params ["_unit", "_player", "_display", "_map"];

systemChat "adding map eh";

private _mouseOver = _display ctrlCreate ["RscText", 1234]; 
_mouseOver ctrlsetText "BLABLA"; 
_mouseOver ctrlSetPosition [0,0]; 
_mouseOver ctrlSetBackgroundColor [0,0,0,1]; 
_mouseOver ctrlCommit 0;

// ((findDisplay 12) displayCtrl 51) mapCenterOnCamera true;

private _towerLabels = [];
// towers
private _towers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];
{
   private _towerLabel = _display ctrlCreate ["RscText", -1]; 
  _towerLabel ctrlsetText "BLABLA";
  _towerLabel ctrlSetPosition [0,0,0.05,0.03];
  _towerLabel ctrlSetBackgroundColor [0,0,0,1];
  _towerLabel ctrlCommit 0;

  _towerLabels append [_towerLabel];
} forEach _towers;

missionNamespace setVariable ["GRAD_nvacommand_towerLabelList", _towerLabels];

// add map draw eh
_map ctrlAddEventHandler ["Draw", 
{
    params ["_map"];

    private _towerLabels = missionNamespace getVariable ["GRAD_nvacommand_towerLabelList", []];
    private _towers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];

    if (visiblemap) then {
        
        {
            private _index = _forEachIndex;
            private _label = _towerLabels select _index;
            private _position = _map posWorldToScreen (position _x);
            _label ctrlShow true;
            _label ctrlsetText (format ["%1|4", _x getVariable ["GRAD_nvaCommand_towerIsManned", 0]]);
            _label ctrlSetPosition _position;

            if ([_x] call GRAD_nvacommand_fnc_towerIsAlarmed) then {
                _label ctrlSetBackgroundColor [1,0,0,1];
            } else {
                _label ctrlSetBackgroundColor [0,0,0,1];
            };
            _label ctrlCommit 0;
        } forEach _towers;

    	  private _sectors = missionNamespace getVariable ["GRAD_nvacommand_sectors", []];
        
        private _mouseToWorld = _map ctrlMapScreenToWorld getMousePosition;
        _mouseToWorld set [2,0];
        
        private _mouseOver = (ctrlParent _map) displayCtrl 1234; //
        _mouseOver ctrlSetText "";
        _mouseOver ctrlSetBackgroundColor [0,0,0,0];
       
        // _tooltipCtrl ctrlSetText format ["%1", _mouseToWorld]; 
        {
          _x params ["_sector", "_triangles", "_isAlarmed", "_tower"];
          private _color = if (_isAlarmed) then { [1,0,0, 0.5 + abs(((sin(time * 100))/2))] } else { [0,0,0,1] };          
          private _texture = if (_isAlarmed) then { "\A3\ui_f\data\map\markerbrushes\diaggrid_ca.paa" } else { "\A3\ui_f\data\map\markerbrushes\horizontal_ca.paa" };
          private _text = if (_isAlarmed) then { "Alarm beenden" } else { "Alarm auslösen" };
          if (count _sector < 3) exitWith { diag_log format ["NVACOMMAND-addMapEventhandler: skipping empty sector %1", _sector]; };

          if (_mouseToWorld inPolygon _sector) then {
              // _map ctrlSetTooltip _text;
              _mouseOver ctrlSetText _text;
              _mouseOver ctrlSetBackgroundColor [0,0,0,1];
              _texture = "\A3\ui_f\data\map\markerbrushes\cross_ca.paa";
              _map drawPolygon [_sector, _color];
          } else {
              _map ctrlSetTooltip "";
          }; 
          
          _map drawTriangle [_triangles, _color, _texture];
        } forEach _sectors;

        _mouseOver ctrlSetPosition getMousePosition;
        _mouseOver ctrlCommit 0;
        
	};
}];


// click eh
_map ctrlAddEventHandler ["MouseButtonClick", {
    params ["_mapCtrl","_button","_xPos","_yPos","_shift","_alt","_ctrl"];

    // currently nothing but left- and rightclick
    if (_button > 1) exitWith {};

    if (_button == 0) then {
        private _mouseToWorld = _mapCtrl ctrlMapScreenToWorld getMousePosition;
        _mouseToWorld set [2,0];
        [_mouseToWorld] remoteExecCall ["GRAD_nvacommand_fnc_alarmToggle", 2];
        } else {
        // systemChat "rightclick";
    };

    false
}];


// self made eh
[{
        params ["_args"];
        _args params ["_visible", "_map"];

        if (_visible isEqualTo visibleMap) exitWith {};

        _visible = visibleMap;

        _args set [0, _visible];

        if (!_visible) then {
            private _towerLabels = missionNamespace getVariable ["GRAD_nvacommand_towerLabelList", []];
            private _towers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];

              {
                    private _index = _forEachIndex;
                    private _label = _towerLabels select _index;
                    _label ctrlShow false;
                    _label ctrlCommit 0;
              } forEach _towers;

            private _mouseOver = (ctrlparent _map) displayCtrl 1234; //
            _mouseOver ctrlSetText "";
            _mouseOver ctrlSetBackgroundColor [0,0,0,0];
        };
}, 0, [visibleMap, _map]] call CBA_fnc_addPerFrameHandler;
/*

IDD_RSCDISPLAYCURATOR = 312; 
    IDC_RSCDISPLAYCURATOR_MAINMAP = 50; 
    private _display = finddisplay IDD_RSCDISPLAYCURATOR; 
     
private _ctrlMap = _display displayCtrl IDC_RSCDISPLAYCURATOR_MAINMAP; 
_ctrlMap ctrlAddEventHandler ["KillFocus", {
    params ["_map"];
      hint "bla";
        
}];

        */


        /*

        private _towerLabels = missionNamespace getVariable ["GRAD_nvacommand_towerLabelList", []];
        private _towers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];

          {
                private _index = _forEachIndex;
                private _label = _towerLabels select _index;
                _label ctrlShow false;
                _label ctrlCommit 0;
          } forEach _towers;

        private _mouseOver = (ctrlparent _map) displayCtrl 1234; 
        _mouseOver ctrlSetText "";
        _mouseOver ctrlSetBackgroundColor [0,0,0,0];
   */