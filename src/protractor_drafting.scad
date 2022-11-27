$fa=0.01;
$fs=0.1;

$r=50;
$width=15;
$height=2;
$ruler_length=150;
$ruler_width=10;
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

difference() {
union() {
semiCylinder($r, $height);

l=$width-$dot_margin*2-$dot_radius*2;

translate([-$r, 0, 0])
cube([$r*2, $width, $height]);

translate([-$ruler_length/2, -$ruler_width, 0]) {
cube([$ruler_length, $ruler_width, $height]);

for( i = [1:$ruler_length-1]) {
if(i % 5 == 0) {
md=$mark_depth*((i%10==0)?2:1);
translate([i-$mark_width/2, 0, $height]) cube([$mark_width, md, $mark_height]);
}
}

}

for( i = [-90:90]) {
x=sin(i)*$r;
y=cos(i)*$r;
if(i%10==0) {
rx=sin(i)*($r-$dot_margin-$dot_radius);
ry=cos(i)*($r-$dot_margin-$dot_radius);
translate([0, 0, $height])
rotate([0, 0, -i])
translate([-$mark_width/2, 0, 0])
cube([$mark_width, $r, $mark_height]);
}
}

}
difference() {
semiCylinder($r-$width, $height+$mark_height);
translate([-$r,0,0]) cube([$r*2, $width, $height]);
}
}


semiCylinder($width, $height);
translate([-$mark_width/2, 0, $height])
cube([$mark_width, $width, $mark_height]);