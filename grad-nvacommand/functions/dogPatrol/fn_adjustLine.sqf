params ["_rope", "_length"];

ropeUnwind [ _rope, 20, _length + 0.5, false];

systemChat str (ropeLength _rope);