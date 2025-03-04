module frenchCleat(cleatSideBraces=false, width=150, thickness=25, height=100) {
    union() {
        difference() {
            cube(size = [width, thickness, height]);
            
            translate([-10,1.5*thickness,height-(1.5*thickness)])
            rotate([45,0,0])
            cube(size = [width+20,thickness,3*thickness]);
        }
        
        if (cleatSideBraces) {
            cube(size = [6, thickness, height]);
            
            translate([width-6, 0, 0])
            cube(size = [6, thickness, height]);
        }
    }
}

module frenchCleatNegative(cleatSideBraces=false, width=150, thickness=25, height=100) {
    translate([-5, 0, -5])
    union() {
        frenchCleat(false, width+10, thickness, height+5);
        
        cube(size = [width+10, thickness+5, height-thickness+5]);
        
        if (cleatSideBraces) {
            cube(size = [11, thickness+5, height+5]);
            
            translate([width-1, 0, 0])
            cube(size = [11, thickness+5, height+5]);
        }
    }
}

//frenchCleat();

//frenchCleatNegative();
