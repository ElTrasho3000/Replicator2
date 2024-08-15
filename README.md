# MakerBot Replicator 2 with Sailfish for PrusaSlicer

## ReplicatorG and Sailfish firmware

### Preparations - Option 1
- get ReplicatorG for your OS [here](http://replicat.org/)
- connect your Replicator2 via USB
- run ReplicatorG
- select 'Machine -> Machine Type (Driver) -> Replicator 2'
- select 'Machine -> Connection (Serial Port) -> \<your port>'
- click the connect icon
- screenshot/note your printer's specs show under</br>'Machine -> Onboard Prefs'
- go to 'File -> Preferences -> Advanced'
- change 'Firmware update URL:' to the URL provided [here](https://www.thingiverse.com/thing:32084)
- go to 'Machine -> Upload new firmware...'
- select your printer model
- upload Sailfish firmware

### Preparations - Option 2 (Linux only)
- git clone this repository
- connect your Replicator2 via USB
- run ReplicatorG from cloned repository
- select 'Machine -> Machine Type (Driver) -> Replicator 2'
- select 'Machine -> Connection (Serial Port) -> \<your port>'
- click the connect icon
- screenshot/note your printer's specs show under</br>'Machine -> Onboard Prefs'
- go to 'Machine -> Upload new firmware...'
- select your printer model
- upload Sailfish firmware

### Connecting after Sailfish installation
- use Sailfish edition of ReplicatorG (available [here](https://www.thingiverse.com/thing:32084/files)) to connect</br>to your printer after Sailfish firmware was installed
- IMPORTANT!</br>a known issue is an old version of 'librxtxSerial.so' being</br>distributed with ReplicatorG, leading to a connection error</br>on x86_64 machines</br>as a workaround install librxtx-java to your system and</br>symlink it to 'lib-x86_64/librxtxSerial.so' within Sailfish</br>edition of ReplicatorG directory
- if you cloned this repository, there is already a symlink</br>pointing to '/usr/lib/jni/librxtxSerial.so' that you might need</br>to change depending on which linux distro you use you</br>still have to install librxtx-java, e.g. via apt
- on first connection after Sailfish installation check the</br>settings under 'Machine -> Onboard Prefs' and compare</br>them to your screenshots/notes

### Homing and offset
As default the Replicator2's origin is in the middle of the printbed.</br>Running into several issues with that while trying to get good prints</br>with PrusaSlicer, I decided to change the origin to front left of the</br>printbed. This can be achieved with different methods.
- use ReplicatorG Sailfish edition to change offset to</br>'X285 Y150 Z0 A0 B0' via 'Machine Onboard Prefs' and load it</br>in start G-code after homing via 'M132 X Y Z A B'
- use the EEPROM version of the start G-code which sets the</br>offset via 'G92 X285 Y150 Z0 A0 B0' after homing, stores it via</br>'M131 X Y Z A B' and calls it via 'M132 X Y Z A B'

## G-code to x3g
I personally use octoprint with GPX plugin to send the G-code files to my</br>Replicator2. The GPX plugin does the neccessary conversion from G-code to</br>x3g.
You can also use ReplicatorG to do the conversion, use a custom</br>post-processing script in PursaSlicer to call GPX or use GPX as</br>command-line tool.

## Tips
- don't cancel a print while homing, always wait until the print started</br>to prevent damage to your steppers, belts and threaded rods

#### Sources