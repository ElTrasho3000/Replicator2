(**** beginning of start.gcode ****)
(**** begin initialization commands ****)
G21 (set units to mm)
G90 (set positioning to absolute)
M108 S255 (set extruder speed to maximum)
M103 (Make sure extruder is off)
M104 S225 T0 (set extruder temperature)
M109 S125 T0 (set heated-build-platform temperature)
(**** end initialization commands ****)
(**** begin homing ****)
(**** end homing ****)
(**** end of start.gcode ****)
