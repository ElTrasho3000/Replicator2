; end-gcode
; ----------
M73 P100; end build progress
G0 Z155 F1000; send Z axis to bottom of machine
M104 S0 T0; cool down extruder
M127; stop blower fan
G0 X142.5 F2500; send X axis to centre
G162 Y F2500; home Y endstops
M18; disable stepper
M70 P5 (We <3 Making Things!); display text 
M72 P1; play Ta-Da song
; end of end-gcode