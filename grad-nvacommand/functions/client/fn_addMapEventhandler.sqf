// todo: remove after dev
params ["_unit", "_player", "_display", "_map"];

private _mouseOver = _display ctrlCreate ["RscText", 1234]; 
_mouseOver ctrlsetText "BLABLA"; 
_mouseOver ctrlSetPosition [0,0]; 
_mouseOver ctrlSetBackgroundColor [0,0,0,1]; 
_mouseOver ctrlCommit 0;


private _towerLabels = [];
// towers
private _towers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];
{
   private _towerLabel = _display ctrlCreate ["RscText", -1]; 
  _towerLabel ctrlsetText "BLABLA"; 
  _towerLabel ctrlSetPosition [0,0,0.06,0.03];
  _towerLabel ctrlSetBackgroundColor [0,0,0,1]; 
  _towerLabel ctrlCommit 0;

  _towerLabels append [_towerLabel];
} forEach _towers;

missionNamespace setVariable ["GRAD_nvacommand_towerLabelList", _towerLabels];

// add map draw eh
_map ctrlAddEventHandler ["Draw", 
{
    params ["_map"];

    if (player getVariable ["GRAD_nvacommand_isCommander", false]) then {

        private _towerLabels = missionNamespace getVariable ["GRAD_nvacommand_towerLabelList", []];
        private _towers = missionNamespace getVariable ["GRAD_nvaCommand_towerList", []];

        {
            private _index = _forEachIndex;
            private _label = _towerLabels select _index;
            private _position = _map posWorldToScreen (position _x);
            _label ctrlsetText (format ["%1/4", _x getVariable ["GRAD_nvaCommand_towerIsManned", 0]]);
            _label ctrlSetPosition _position;
            _label ctrlCommit 0;
        } forEach _towers;

    	  private _triggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_triggeredSectors", []];
        private _untriggeredSectors = missionNamespace getVariable ["GRAD_nvacommand_untriggeredSectors", []];

        
        private _mouseToWorld = _map ctrlMapScreenToWorld getMousePosition;
        _mouseToWorld set [2,0];
        
        private _mouseOver = (ctrlParent _map) displayCtrl 1234;
        _mouseOver ctrlSetText "";
        _mouseOver ctrlSetBackgroundColor [0,0,0,0];
       
        // _tooltipCtrl ctrlSetText format ["%1", _mouseToWorld]; 
        {
          private _identifier = _x select 0;
          private _sector = _x select 1;
          private _color = [1,0,0,0.5 + abs(((sin(time * 100))/2))];

          if (_mouseToWorld inPolygon _sector) then {
              _mouseOver ctrlSetText format ["Sector %1 - ALARM", _identifier];
              _mouseOver ctrlSetBackgroundColor [0,0,0,1];
             _color = [1,0,0,1];
          };
          _map drawTriangle [_sector, _color, "#(rgb,1,1,1)color(1,1,1,1)"];
        } forEach _triggeredSectors;

        {
          private _identifier = _x select 0;
          private _sector = _x select 1;
          private _color = [0,0,0,0.2];

          if (_mouseToWorld inPolygon _sector) then {
             _mouseOver ctrlSetText format ["Sector %1", _identifier];
             _mouseOver ctrlSetBackgroundColor [0,0,0,1];
             _color = [0,0,0,0.5];
          };
          _map drawTriangle [_sector, _color, "#(rgb,1,1,1)color(1,1,1,1)"];
        } forEach _untriggeredSectors;

        _mouseOver ctrlSetPosition getMousePosition;
        _mouseOver ctrlCommit 0;
        
	   // copyToClipboard format ["_triggeredSectors: %1 --- _untriggeredSectors: %2", _triggeredSectors, _untriggeredSectors];
	};
   
}];