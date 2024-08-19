#macro GRID global.grid
global.grid = 30;

function map(_value, _value_min, _value_max, _target_min, _target_max) {
    return (((_value - _value_min) / (_value_max - _value_min)) * (_target_max - _target_min)) + _target_min;
}

function draw_lines(_size, _density, _xoff=0) {
	if (_density < 0) _density = 0;
	var _dist = _size / (_density + 1);
	for (var i = 1; i <= _density; i++) {
		draw_line_width(i * _dist + _xoff, 0, i * _dist+ _xoff, _size, 1);
	}
}

function midpoint(x1,y1,x2,y2) {
	return {x: (x1 + x2)/2, y: (y1 + y2)/2};
}
