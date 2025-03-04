include <./FrenchCleat.scad>

// This is the bracket that attaches to the wall

//wallBracket();

module wallBracket(cleatSideBraces=true, mountWidth=100, cleatThick=20, mountHeight=100) {
    screwXZInset = 16;
    
    cleatHeight = mountHeight-cleatThick;
    
    screw1Z = screwXZInset;
    screw2Z = cleatHeight-cleatThick-screwXZInset;
    screw1X = screwXZInset;
    screw2X = mountWidth-screwXZInset;
    
    
    difference() {
        frenchCleat(cleatSideBraces, mountWidth, cleatThick, cleatHeight);
        
        union() {
            translate([screw1X, 0, screw1Z])
            screwWasherHole(cleatThick);
                
            translate([screw2X, 0, screw2Z])
            screwWasherHole(cleatThick);
        }
    }
}

module screwWasherHole(cleatThick=20) {
    union() {
        rotate([90, 0, 0])
        cylinder(h = 100, d = 7, center = true);
            
        rotate([90, 0, 0])
        cylinder(h = 2*(cleatThick/3), d = 16, center = true);
    }
}
