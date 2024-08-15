; start-gcode
; ----------
; homing gcode
M103; disable RPM
M73 P0; enable build process
G21; set units to mm
G90; set positioning to absolute
G162 X Y F2500; home XY axes maximum
G161 Z F1100; home Z axis minimum
G92 X Y Z-5 E0; set Z to -5
G0 Z0.0 F1100; move away from the Z endstop
G161 Z F100; slowly home Z axis minimum again
M132 X Y Z A B; recall stored home offsets for XYZAB axis
M114; report current position
; initial extrude gcode
M104 S[first_layer_temperature] T0; set nozzle heater to 220 degrees celsius
G0 X-15 Y0 Z[first_layer_height] F3300; move to waiting position off build plate
M70 P3 (Please wait...); display text for 3 seconds
G130 X20 Y20 Z20 A20 B20; lower stepper Vrefs while heating
M6 T0; wait for extruder to reach temperature
G130 X127 Y127 Z40 A127 B127; set stepper motor Vref to defaults
G1 X90 Y Z[first_layer_height] E15 F2000; extrude 15mm of filament
M127; make sure blower fan is turned off before printing begins
M82; set extruder to absolute mode
G92 E0; reset E to 0
M73 P0; reset build progress to 0
; ----------
; end of start-gcode