include <inc/functions.scad>
include <configuration.scad>

dxf=true;

module prusa_plate() {
	difference() {
		union() {
			translate([-plate_width/2, 0, 0]) cube([plate_width,plate_height,10]);
			// feet
			translate([threaded_rod_distance/2+rod_distance_to_edge-30, -10, -0.5])
				cube([30,11,10+1]);
			translate([-(threaded_rod_distance/2+rod_distance_to_edge), -10, -0.5])
				cube([30,11,10+1]);
		}
		translate([threaded_rod_distance/2, rod_distance_to_edge,-0.5]) rotate([0,0,-bottom_vertex_angle]) {		
			rod_hole(d=threaded_rod_diameter, h=10+1, allowance=rod_allowance);
			translate([0, vertex_rod_to_rod_distance, 0]) rod_hole(d=threaded_rod_diameter, h=10+1, allowance=rod_allowance);
		}
		translate([-threaded_rod_distance/2, rod_distance_to_edge,-0.5]) rotate([0,0,bottom_vertex_angle]) {		
			rod_hole(d=threaded_rod_diameter, h=10+1, allowance=rod_allowance);
			translate([0, vertex_rod_to_rod_distance, 0]) rod_hole(d=threaded_rod_diameter, h=10+1, allowance=rod_allowance);
		}

		// Top vertex holes
		translate([vertex_rod_to_rod_distance/2, vertex_y+top_vertex_y+rod_distance_to_edge, -0.5])
			rod_hole(d=threaded_rod_diameter, h=10+1, allowance=rod_allowance);
		translate([-vertex_rod_to_rod_distance/2, vertex_y+top_vertex_y+rod_distance_to_edge, -0.5])
			rod_hole(d=threaded_rod_diameter, h=10+1, allowance=rod_allowance);

		// bottom support hole
		translate([-threaded_rod_diameter-center_rod_offset, rod_distance_to_edge, -0.5])
			rod_hole(d=threaded_rod_diameter, h=10+1, allowance=rod_allowance, length=center_rod_offset);

		// center cutout
		translate([-center_cutout_width/2,vertex_y+rod_distance_to_edge,-0.5])
			cube_fillet([center_cutout_width,plate_height-vertex_y-rod_distance_to_cutout-rod_distance_to_edge*2,10+1], vertical=[40,40,10,10]);

		// side cutoffs
		translate([plate_width/2, vertex_y+rod_distance_to_edge*2, -0.5])
			rotate([0,0,bottom_vertex_angle])
			cube([plate_width/2,plate_height,10+1]);
		mirror([1,0,0]) translate([plate_width/2, vertex_y+rod_distance_to_edge*2, -0.5])
			rotate([0,0,bottom_vertex_angle])
			cube([plate_width/2,plate_height,10+1]);

		translate([threaded_rod_distance/2+rod_distance_to_edge, 0, -0.5])
			rotate([0,0,-bottom_vertex_angle])
			cube([vertex_x+1,vertex_rod_to_rod_distance+rod_distance_to_edge,10+1]);

		mirror([1,0,0]) translate([threaded_rod_distance/2+rod_distance_to_edge, 0, -0.5])
			rotate([0,0,-bottom_vertex_angle])
			cube([vertex_x+1,vertex_rod_to_rod_distance+rod_distance_to_edge,10+1]);
	}
}

if (dxf){
	projection() prusa_plate();
}
else {
	prusa_plate();
}