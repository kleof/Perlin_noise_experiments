GRID = 20; // size of a cell
offset = 100;
width = 25;
height = 25;
randomize();

for (var i = 0; i < width; ++i) {
    for (var j = 0; j < height; ++j) {
	    var _inst = instance_create_layer(GRID*i+offset, GRID*j+offset, "Instances", obj_cell);
	}
}


