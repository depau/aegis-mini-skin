module screw_rod(d) {
    rotate([90])
    translate([0, 0, -50])
    cylinder(d=d, h=100, $fn=500);
}

module screw_inset(d=screws_outer_d) {
    difference() {
        screw_rod(d=d);
        
        cube([100, diam-2*screw_outer_thickn, 100], center=true);
    }
}