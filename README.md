# Bose-161-Speaker-French-Cleat-Mount
Bose 161 Speaker French Cleat Mount implemented in OpenSCAD, with STLs.

** The mount has not yet been printing or tested - I will update the project after printing and modifying if needed **

Edit the Bose161WallMount.scad file to tweak the parameters that generate the speaker mount and the wall mount.

Parameters in Bose161WallMount.scad:
- recommendedPrintOrientation (true/false) Orients the models in the recommended orientation for 3 printing. If false, the models will be standing right-side up.
- verticalMount (true/false) Changes the speaker bracket to connect to a speaker in the vertical position.
- cleatSideBraces (true/false) Puts braces on the sides of the sloped part of the wall mount and adds notches to fit the braces on the speaker mount. This prevents the speaker mount from sliding side to side. If you want to print the speaker mount to be used on an existing french cleat system, you may want to turn this off for a cleaner look.
- fixedAngle (numerical) Adjust this value to angle the speaker up or down. A positive number will tilt the speaker down and a negative number will tilt up. This value is disregarded when calculateAngle=true.
- calculateAngle (true/false) This will disregard the fixedAngle value and calculate a precise angle based on the values given in the next three parameters. *NOTE any measurement unit can be used for the below parameters, as long as they're all the same unit.
- speakerMountHeightFromFloor (numerical) Set this value to the measured distance between the floor and the speaker.
- listenerEarsHeightFromFloor (numerical) Set this value to the measured distance between the floor and the listener's ears.
- listenerEarsDistanceFromSpeakerWall (numerical) Set this value to the measured distance between the wall the speaker will be mounted on and the listener's ears.

Feel free to submit a pull request for fixes or improvements.
