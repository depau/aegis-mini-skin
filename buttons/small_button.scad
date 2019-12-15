width=5.9;
height=4.9;
thickn=4.2;
base_thickn=0.6;
inside_depth=0.9;
cross_thickn=0.6;
deco_thickn=0.5;

difference() {
    union() {
        // main cube
        cube([width, height, thickn]);
        
        // base
        translate([-1, -1]*base_thickn)
        cube([width+2*base_thickn, height+2*base_thickn, base_thickn]);
        
        // decoration
        translate([0, 0, thickn])
        polyhedron(
            points=[
                [width, height, 0],
                [width, 0, 0],
                [0,0,0],
                [0, height, 0],
                [width/2, height/2, deco_thickn]
            ],
            faces=[
                [0,1,4],
                [1,2,4],
                [2,3,4],
                [3,0,4],
                [1,0,3],
                [2,1,3]
            ]
        );
    }
    
    // cavity
    translate([1, 1]*base_thickn)
    difference() {
        cube([width-2*base_thickn, height-2*base_thickn, thickn-base_thickn]);
        
        
        // cross
       #translate([0, (height-2*base_thickn-cross_thickn)/2, inside_depth])
       cube([width-2*base_thickn, cross_thickn, thickn-inside_depth]);
        
       translate([(width-2*base_thickn-cross_thickn)/2, 0, inside_depth])
       cube([cross_thickn, height-2*base_thickn, thickn-inside_depth]);
    }
}
