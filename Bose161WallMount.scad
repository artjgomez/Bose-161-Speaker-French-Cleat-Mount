include <./WallBracket.scad>
include <./SpeakerBracket.scad>

// A pretty good Bose 161 speaker mount

module Bose161WallMount (
    
    // Set the variables below to get everything just right, hermano.
    // The generated models are in the recommended orientation for printing.
    
    recommendedPrintOrientation=true,
    
    // verticleMount=true will design the mount to hang the speaker tall-ways (up and down).
    verticalMount = false,
    
    // Puts side braces on the wall bracket so that the speaker bracket doesn't slide side to side.
    cleatSideBraces = true,
    
    // 0 degrees is straight forward. Positive degrees angles down. Negative degrees angles up.
    fixedAngle = 0,
    
    // If calculateAngle=true, the below values will calculate the angle at which the speaker will point
    calculateAngle = false,
    // Below values can be mm, inches, feet, w/e. As long as they're all the same units. No negatives, silly billy.
    speakerMountHeightFromFloor = 90,
    listenerEarsHeightFromFloor = 41,
    listenerEarsDistanceFromSpeakerWall = 163
    
    // That's it, really.
) {
    screwSeparation = 59.5;
    mountWidth = 100;
    mountHeight = 100;
    cleatThick = 20;
    
    calculatedAngle = bitOTrig(speakerMountHeightFromFloor, listenerEarsHeightFromFloor, listenerEarsDistanceFromSpeakerWall);
    
    echo(calculatedAngle);
    
    rotate([0, recommendedPrintOrientation?90:0, 0])
    translate([recommendedPrintOrientation?-mountWidth:0, 0, 0])
    speakerBracket(calculateAngle ? calculatedAngle : fixedAngle, cleatSideBraces, verticalMount, mountWidth, cleatThick, mountHeight);
    
    rotate([0, recommendedPrintOrientation?90:0, 0])
    translate([recommendedPrintOrientation?-mountWidth:0, 100, 0])
    wallBracket(cleatSideBraces, mountWidth, cleatThick, mountHeight);
}

// Remember SOH-CAH-TOA and all that
// We usin' TOA boyz
// tan(angle) = opposite/adjacent
// tan(angle) = a/b
// atan(tan(angle)) = atan(a/b)
// angle = atan(a/b)
function bitOTrig(spkH, lH, lD) = 
    atan(
        (spkH-lH) / (lD)
    );

Bose161WallMount();
