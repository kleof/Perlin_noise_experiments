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

// translated from Sighack https://github.com/sighack/easing-functions/blob/master/code/easing/easing.pde
function map_curve(_value, _value_min, _value_max, _target_min, _target_max, _v, _when) {
	var b = _target_min;
	var c = _target_max - _target_min;
	var t = _value - _value_min;
	var d = _value_max - _value_min;
	var p = _v;
	var out = 0;
	if (_when == 0) { // ease IN
		t /= d;
		out = c*power(t, p) + b;
	} else if (_when == 1) { // ease OUT
		t /= d;
		out = c * (1 - power(1 - t, p)) + b;
	} else if (_when == 2) { // ease IN OUT
		t /= d/2;
		if (t < 1) return c/2*power(t, p) + b;
		out = c/2 * (2 - power(2 - t, p)) + b;
	}
	return out;
}