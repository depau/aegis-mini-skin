include <utils.scad>;


module inner_cutout(cutout_w=50) {
    if (build_inner_cutout) {
        point_1x=sin(cutout_vertical_angle)*cutout_inner_h/2;
        point_1y=cutout_inner_h/2;
        
        point_1=[point_1x, point_1y];
        
        point_2x=cos(cutout_inner_angle)*cutout_w;
        point_2y=sin(cutout_inner_angle)*cutout_w;
        
        point_2=[point_2x, point_2y];

        rotate([90, 180])
        translate([0, 0, -cutout_w/2])
        linear_extrude(cutout_w)
        polygon([
            [0, 0],
            point_1,
            point_2 + point_1,
            [cutout_w, 0],
            vmult(point_2 + point_1, [1, -1]),
            vmult(point_1, [1, -1])
        ]);
    } else {
        import("stl/inner_cutout.stl");
    }
}

module outer_cutout(cutout_w=100) {
    if (build_outer_cutout) {
        inner_w=cutout_w-10;
        
        point_1x=sin(cutout_vertical_angle)*cutout_outer_h/2;
        point_1y=cutout_outer_h/2;
        
        point_1=[point_1x, point_1y];
        
        point_2x=cos(cutout_outer_angle)*inner_w;
        point_2y=sin(cutout_outer_angle)*inner_w;
        
        point_2=[point_2x, point_2y];


        difference() {
            cube(cutout_w, center=true);
            
            rotate([90, 180])
            translate([0, 0, -inner_w/2])
            linear_extrude(inner_w)
            polygon([
                [0, 0],
                point_1,
                point_2 + point_1,
                [cutout_w, 0],
                vmult(point_2 + point_1, [1, -1]),
                vmult(point_1, [1, -1])
            ]);
        }
    } else {
        import("stl/outer_cutout.stl");        
    }
}
