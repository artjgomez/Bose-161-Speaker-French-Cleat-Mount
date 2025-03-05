include <./FrenchCleat.scad>

// This is the bracket that attaches to the speaker

//speakerBracket();

module speakerBracket(angle=0, cleatSideBraces=true, verticalMount=false, mountWidth=100, cleatThick=20, mountHeight=100) {
    angleLimit = verticalMount ? (15) : (25);
    assert(angle <= angleLimit && angle >= -angleLimit);
    
    difference() {
        translate([0, 35, 0])
        backCleatPart(cleatSideBraces, mountWidth, cleatThick, mountHeight);
        
        translate([mountWidth/2, 1.5*cleatThick, mountHeight/2])
        speakerRearWithScrewHoles(angle, verticalMount, mountHeight);
    }
}

module backCleatPart(cleatSideBraces=true, mountWidth=100, cleatThick=20, mountHeight=80) {
    cleatWidth = mountWidth;
    backPartThick = cleatThick+20;
    cleatHeight = mountHeight-20;
    
    union() {
        translate([mountWidth/2, 0, mountHeight/2])
        rotate([180, 90, 0])
        bigHalfCylinder(mountWidth, mountHeight);
        
        difference() {
            cube(size = [cleatWidth, backPartThick, mountHeight]);
            
            translate([0,backPartThick-cleatThick,0])
            frenchCleatNegative(cleatSideBraces, cleatWidth, cleatThick, cleatHeight);
        }
    }
}

module bigHalfCylinder(backPartWidth=100, backPartHeight=90) {
        rotate_extrude(angle=180, $fn = 200)
        translate([backPartHeight/4,0,0])
        square([backPartHeight/2,backPartWidth], center=true);
}

module speakerRearWithScrewHoles(angle=14, verticalMount=false, mountHeight=90) {
    
    rotate([angle, 0, 0])
    rotate([0, verticalMount ? 90: 0, 0])
    union() {
        speakerRearProfile();
        screwHoles();
    }
}

module speakerRearProfile() {
    // To calculate the radius of the arc on the back of the speaker:
    // I measured an arc length of 72 mm and a chord length of 69.2 mm.
    // The calculated radius is 73.66 mm. And the central angle is 56.033 degrees.
    // The chord length was too short to fit the speaker IRL so I raised it to 73.3 mm which results in a central angle of 59.6412 degrees
    
    width=300;
    
    transX=width/2;
    transY=-73.66/2;
    transZ=0;
    
    rotX=90;
    rotY=0;
    rotZ=-90;
    
    translate([transX, transY, transZ])
        rotate([rotX, rotY, rotZ])
            linear_extrude(height=width) {
                halfSpeakerRearProfile();
                mirror([0,1,0])
                    halfSpeakerRearProfile();
            }
}

module halfSpeakerRearProfile() {
    a=9.7;
    b=36.6;
    R=73.66;
    A=[a, b];
    B=[R,0];
    C=[R, b+23.7];
    
    intersection() {
        translate([R/2,0,0])
        circle(r=R, $fn = 200);
        
        translate([-R/2,0,0])
            square([R, b]);
    }
    
    translate([-R/2,0,0]) 
        polygon([A, B, C]);
}

module screwHoles() {
    spaceBetweenScrewCenters=60;
    minMountScrewDepth=10;
    screwHoleWidth=7;
    screwHeadHoleWidth=16;
    
    translate([-spaceBetweenScrewCenters/2,minMountScrewDepth,0])
    rotate([-90,0,0])
    union() {
        cylinder(h=3*minMountScrewDepth, r=screwHoleWidth/2, center=true, $fn = 200);
        cylinder(h=200, r=screwHeadHoleWidth/2, center=false, $fn = 200);

        translate([spaceBetweenScrewCenters, 0, 0])
        cylinder(h=3*minMountScrewDepth, r=screwHoleWidth/2, center=true, $fn = 200);
        translate([spaceBetweenScrewCenters, 0, 0])
        cylinder(h=200, r=screwHeadHoleWidth/2, center=false, $fn = 200);
    }
}
