if (!surface_exists(surf_lines)) {
	surf_lines = surface_create(GRID*2, GRID*2);
}
if (!surface_exists(surf_crop)) {
	surf_crop = surface_create(GRID, GRID);
}

t += .6;
var _noise = perlin_noise_2d(x * .15 + t, y * .15 + t);	// magic number .15
density = map(_noise, -1, 1, -2, density_max);	// magic number -2
//density = map_curve(_noise, -1, 1, -2, density_max, 1, 2);
//rot = map(perlin_noise(x + y*GRID, .05), -1, 1, 0, 360); 
//rot += 5;

surface_set_target(surf_lines);
draw_clear_alpha(c_black, 0);
draw_set_color(c_white);
draw_lines(GRID*2, density, xoff);
surface_reset_target();

var _x = lengthdir_x(GRID*2, rot);
var _y = lengthdir_y(GRID*2, rot);
var mid1 = midpoint(GRID, 0, 0, GRID);
var mid2 = midpoint(_x,_y,-_y,_x);
var vx = mid1.x-mid2.x;
var vy = mid1.y-mid2.y;

surface_set_target(surf_crop);
draw_clear_alpha(c_black, 0);
draw_surface_ext(surf_lines, vx, vy, 1, 1, rot, c_white, 1);
surface_reset_target();

draw_surface(surf_crop, x, y);