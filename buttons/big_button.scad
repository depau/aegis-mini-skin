min_width=9.9;
max_width=11.4;
height=8;

side_cyl_rad=3.0;
corner_cyl_rad=0.6;
min_thickn=4;
max_thickn=4.4;

base_thickn=0.6;
inside_depth=0.9;

outer_ring_r=3.85;
inner_ring_r=1.5;
ring_thickn=0.7;

union() {
    difference () {
        union() {
            main_shape(min_thickn, max_thickn);
            
            // base
            translate([1, 1] * -base_thickn)
            scale([(max_width+2*base_thickn)/max_width, (height+2*base_thickn)/height])
            main_shape(base_thickn, base_thickn);
        }
        
        // cavity
        translate([1, 1] * inside_depth)
        scale([(max_width-2*inside_depth)/max_width, (height-2*inside_depth)/height, (min_thickn-inside_depth)/min_thickn])
        main_shape(min_thickn, max_thickn);
    }
    
    translate([min_width, height]/2)
    hollow_cylinder(min_thickn, outer_ring_r, outer_ring_r-ring_thickn, $fn=100);
    
    translate([min_width/2, height/2, inside_depth])
    hollow_cylinder(min_thickn-inside_depth, inner_ring_r, inner_ring_r-ring_thickn, $fn=100);
}

module main_shape(min_t, max_t) {
    top_angle=atan2(max_t-min_t, height);
    
    difference() {
        hull() {
            // bottom left
            translate([1, 1]*corner_cyl_rad)
            cylinder(h=max_t, r=corner_cyl_rad, $fn=100);
            
            // bottom right
            translate([min_width, 0])
            translate([-1, 1]*corner_cyl_rad)
            cylinder(h=max_t, r=corner_cyl_rad, $fn=100);
            
            // top left
            translate([0, height])
            translate([1, -1]*corner_cyl_rad)
            cylinder(h=max_t, r=corner_cyl_rad, $fn=100);
            
            // top right
            translate([min_width, height])
            translate([-1, -1]*corner_cyl_rad)
            cylinder(h=max_t, r=corner_cyl_rad, $fn=100);
            
            // left side
            translate([min_width-max_width, height]/2)
            translate([1, 0]*side_cyl_rad)
            cylinder(h=max_t, r=side_cyl_rad, $fn=100);
            
            // right side
            translate([(min_width-max_width)/2+max_width, height/2])
            translate([-1, 0]*side_cyl_rad)
            cylinder(h=max_t, r=side_cyl_rad, $fn=100);
        }
        
        if (min_t != max_t) {
            translate([-5, 0, min_t])
            rotate([top_angle])
            cube([20, 20, 10]);
        }
    }
}

module hollow_cylinder(h, r_outer, r_inner, $fn) {
    difference() {
        cylinder(h=h, r=r_outer, $fn=$fn);
        cylinder(h=h, r=r_inner, $fn=$fn);
    }
}