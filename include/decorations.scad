
module decoration_top_btm() {
    if (build_decoration_top_btm) {
        difference() {
            translate([-(diam/2), (diam+5)/-2, (height-cutout_inner_h)/2])
            cube([diam/2+deco_inset, diam+5, 20]);
        
            translate([0, 0, -height/2])
            rotate([0, 1.2, 0])
            scale([0.96, 1.0])
            translate([-1.5, 0, 0])
            cylinder(h=height, d2=diam+0.8, d1=19, $fn=1000, center=false);
            
            translate([0, 0, -0.92])
            rotate([0, -deco_side_angle_1])
            translate([0, -25, 0])
            cube([20, 50, 20]);
        }
    } else {
        import("stl/decoration_top_btm.stl");
    }
}

module decoration_side() {
    if (build_decoration_side) {
        union() {
            translate([2.3, 1.21, 23])
            rotate([0, -deco_side_angle_1, deco_side_angle_2])
            translate([30, 0, 18.7]*-1)
            cube([30, 5, 18.5]);
            
            mirror(v=[0, 0, 1])
            translate([2.3, 1.21, 23])
            rotate([0, -deco_side_angle_1, deco_side_angle_2])
            translate([30, 0, 18.7]*-1)
            cube([30, 5, 18.5]);
            
            difference() {
                union() {
                    translate([0, 2.5, cutout_outer_h/4 - 0.01])
                    translate([25, 0, cutout_outer_h/4])
                    rotate([-deco_side_angle_horz, 0, deco_side_angle_vert])
                    translate([50, 0, cutout_outer_h/2]*-1)
                    cube([50, 5, cutout_outer_h/2]);
                    
                    mirror(v=[0, 0, 1])
                    translate([0, 2.5, cutout_outer_h/4 - 0.01])
                    translate([25, 0, cutout_outer_h/4])
                    rotate([-deco_side_angle_horz, 0, deco_side_angle_vert])
                    translate([50, 0, cutout_outer_h/2]*-1)
                    cube([50, 5, cutout_outer_h/2]);
                }
                
                translate([-30, -25, 6.3])
                rotate([0, -deco_side_angle_1, 0])
                cube(50);
            }
        }
    } else {
        import("stl/decoration_side.stl");
    }
}