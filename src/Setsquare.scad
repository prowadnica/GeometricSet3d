$base=75;
$height=1.5;
$width=10;
$mark_width = 1;
$mark_depth = 4;
$mark_height = 1;
$micromark_width = 0.5;
$micromark_depth = 2;
$micromark_height = 1;

module triangle(base) {
linear_extrude($height)
polygon(points=[[0,0], [0,base*2], [base,0]]);
}

module shape() {
difference() {
triangle($base);
translate([$width, $width, 0])
triangle($base-$width*3);
}
}

module setSquare() {
shape();
for( i = [1:$base-$width-1]) {
if(i % 1 == 0) {
tmd=$micromark_depth*((i%10==0)?4:2);
md=$micromark_depth*((i%5==0)?tmd:1);
translate([i-$micromark_width/2, 0, $height]) cube([$micromark_width, md, $micromark_height]);
}
}
for( i = [1:$base*2-$width-1]) {
if(i % 5 == 0) {
md=$mark_depth*((i%10==0)?2:1);
translate([0, i-$mark_width/2,  $height]) cube([md, $mark_width, $mark_height]);
}
}
}

setSquare();