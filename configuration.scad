// PRUSA iteration3
// Configuration file
// GNU GPL v3
// Josef Pr?sa <josefprusa@me.com>
// Václav 'ax' H?la <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// PLEASE SELECT ONE OF THE CONFIGURATIONS BELOW
// BY UN-COMMENTING IT

// functions
include <inc/functions.scad>;
include <inc/nuts_screws.scad>;
include <printer_conf.scad>;

use_fillets=true;
// Custom settings here, tailor to your supplies and print settings

rod_allowance=0.2;
center_cutout_width = 110;
threaded_rod_diameter = 8;

threaded_rod_distance = 320;
vertex_rod_to_rod_distance = 58.5;
rod_distance_to_edge = 15;
rod_distance_to_cutout = 30;
center_rod_offset=3;

bottom_vertex_angle = 30;

vertex_y =vertex_rod_to_rod_distance * cos(bottom_vertex_angle);
vertex_x =vertex_rod_to_rod_distance * sin(bottom_vertex_angle);
top_vertex_y =threaded_rod_distance * cos(bottom_vertex_angle);

plate_width = vertex_x*2+threaded_rod_distance+rod_distance_to_edge*2;
plate_height = vertex_y+top_vertex_y+rod_distance_to_edge*2;