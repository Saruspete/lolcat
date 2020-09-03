#!/usr/bin/awk -f

BEGIN {
	freq = 0.1
	spread = 3.0
	pi = atan2(0,-1)
	offset = 0
}

function rainbow(f,s,  t, r,g,b) {
	t = f*s
	r = sin(t + 0) * 127 + 128
	g = sin(t + 2*pi/3) * 127 + 128
	b = sin(t + 4*pi/3) * 127 + 128
	return sprintf("%d;%d;%d", r,g,b)
}

{
	nchars = split($0, chars, "")
	for(i=1; i<=nchars; i++) {
		color = rainbow(freq, offset+i/spread)
		printf("\033[38;2;%sm%s%s", color, chars[i], "\033[39m")
	}
	offset += spread
	printf("\n")
}
