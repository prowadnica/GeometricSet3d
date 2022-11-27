$fa=0.01;
$fs=0.1;

$r=50;
$width=15;
$height=2;
$mark_width = 1;
$mark_depth = 4;
$mark_height = 1;
$dot_radius=2;
$dot_margin=1;
$dot_height=1;

module semiCylinder(r, h) {
difference() {
cylinder(r=r, h=h);
translate([-r, -r, 0])
cube([r*2, r, h]);
}
}

semiCylinder($r, $height);

translate([-$r, -$width, 0])
cube([$r*2, $width, $height]);
translate([-$mark_width/2, -$width, $height])
cube([$mark_width, $width, $mark_height]);

for( i = [-90:90]) {
x=sin(i)*$r;
y=cos(i)*$r;
if(i%10==0) {
translate([0, 0, $height])
rotate([0, 0, -i])
translate([-$mark_width/2, 0, 0])
cube([$mark_width, $r, $mark_height]);
}
}

