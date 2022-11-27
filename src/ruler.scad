$depth=20;
$mark_width = 1;
$mark_depth = 4;
$mark_height = 1;
$dot_space=1;
$dot_radius=1;
$floor=2;
$margin=1;

module rulerSide(length, mark_width, mark_depth, mark_density, dots) {
max=$mark_depth*2+$dot_space+$dot_radius*2;
translate([-max/2, -length/2, 0]) {
union() {
for( i = [1:length-1]) {
mod_p = ((i%10)==0)?2:1;
mod = ((i%5)==0)?mod_p:0.5;
md = mark_depth * mod;
if(i % mark_density == 0) {
translate([0, i-mark_width/2, 0])
cube([md, mark_width, $mark_height]);
}
if(i % 50 == 0 && dots) {
translate([mark_depth*2+$dot_space+$dot_radius, i, 0])
cylinder(r=$dot_radius, h=$mark_height);
}

}
}
}
}

length=300;

max=$mark_depth*2+$dot_space+$dot_radius*2;

w=max+$margin;

rulerSide(length, $mark_width, $mark_depth, 5, true);

translate([-max/2, -length/2, -$floor])
cube([w, length, $floor]);