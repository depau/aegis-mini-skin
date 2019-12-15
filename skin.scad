include <config.scad>;
include <include/cutouts.scad>;
include <include/screws.scad>;
include <include/decorations.scad>;


cavity_scale=(diam-2*thickn)/diam;

rotate([0, 90, 0])
difference() {
    main_shape();

    hull()
    scale([cavity_scale, cavity_scale])
    main_shape();
    
    translate([cutout_inner_offset, 0, height/2])
    inner_cutout();
    
    translate([cutout_outer_offset, 0, height/2])
    outer_cutout();
    
    translate([screws_offset_x, 0, height/2 + screws_offset_z])
    screw_rod(d=screws_inner_d);
    
    
    translate([screws_offset_x, 0, height/2 + screws_offset_z])
    screw_inset(d=screws_outer_d);

    
    translate([screws_offset_x, 0, height/2 - screws_offset_z])
    screw_rod(d=screws_inner_d);
    
    translate([screws_offset_x, 0, height/2 - screws_offset_z])
    screw_inset(d=screws_outer_d);
    
    translate([0, (diam-deco_inset)/2, height/2])
    decoration_side();

    mirror([0, 1, 0])
    translate([0, (diam-deco_inset)/2, height/2])
    decoration_side();
    
    translate([0, 0, height/2])
    decoration_top_btm();
    
    mirror([0, 0, 1])
    translate([0, 0, -height/2])
    decoration_top_btm();
}


module main_shape() {
    linear_extrude(height)
    union() {
        circle(d=diam, $fn=1000);
        
        translate([0, diam/2 - thickn_side + 0.08])
        rotate([0, 0, -overshoot_angle])
        polygon([[0,0] , [diam, 0], [diam, thickn_side], [thickn_side, thickn_side]]);

        translate([0, -diam/2 - 0.08])
        rotate([0, 0, overshoot_angle])
        polygon([[0, thickn_side] , [diam, thickn_side], [diam, 0], [thickn_side, 0]]);

    }
}

/*translate([-2, -1.7, 30])
rotate([90, 0, 180])
scale(34.55)
rotate([0, 35, 0])
rotate([-4, 0, 0])
rotate([0, 0, 20])
import("dense-vsfm/dense1.stl");*/
